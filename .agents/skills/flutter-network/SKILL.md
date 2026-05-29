---
name: flutter-network
description: Rules and guidelines for calling APIs, integrating remote data sources, and managing network clients in the Flutter project. Use whenever Codex needs to implement API integrations, remote data sources, network configurations, or parse backend JSON payloads.
---

# Agent Skill: Flutter Network Integration

Tài liệu hướng dẫn quy trình và các quy tắc bắt buộc khi làm việc với API (Network) trong dự án Flutter. Đây là các quy tắc thiết kế hệ thống nghiêm ngặt không được phép vi phạm.

## 1. Golden Rules (Quy tắc bắt buộc)

1. **KHÔNG tự khởi tạo HTTP Client / Dio**: Mọi kết nối mạng phải thông qua lớp `ApiClient` nằm trong package nội bộ `network` (`packages/network`). Tuyệt đối không tự viết code khởi tạo `Dio()` hay `HttpClient` riêng lẻ ở các feature.
2. **Inject qua Dependency Injection (GetIt)**: `ApiClient` (hoặc `Dio` của nó) phải được inject từ Service Locator `GetIt` thông qua Constructor của Data Sources hoặc RestClient.
3. **BẮT BUỘC dùng Retrofit**: Cho các API Service Endpoints (ví dụ: các phương thức `@GET`, `@POST`). Không viết code gọi `dio.get()` và parse map thủ công, trừ trường hợp đặc biệt được ghi chú.
4. **Tách biệt DTO (Model) và Entity**:
   - Model API (DTO) nằm ở `data/models/` sử dụng `@freezed` + `fromJson`/`toJson`.
   - Entity nằm ở `domain/entities/` đại diện cho business logic.
   - BẮT BUỘC viết Extension Mapper để chuyển đổi từ DTO sang Entity trước khi trả lên tầng Domain/Bloc.
5. **Không dùng Print/DebugPrint**: Tất cả thông tin log HTTP phải đi qua `LoggingInterceptor` hoặc `LogUtils`.
6. **Bọc dữ liệu bằng Resource**: Dữ liệu từ Repository/UseCase trả về Bloc bắt buộc bọc trong lớp `Resource<T>`.

---

## 2. Quy trình triển khai Gọi API mới (Implementation Flow)

### Bước 1: Định nghĩa API Model (DTO)
Tạo file model tại `lib/features/<feature_name>/data/models/` sử dụng `@freezed`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/my_entity.dart';

part 'my_response_model.freezed.dart';
part 'my_response_model.g.dart';

@freezed
abstract class MyResponseModel with _$MyResponseModel {
  const factory MyResponseModel({
    @JsonKey(name: 'item_id') required String id,
    required String title,
  }) = _MyResponseModel;

  factory MyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MyResponseModelFromJson(json);
}

extension MyResponseModelX on MyResponseModel {
  MyEntity toEntity() => MyEntity(id: id, title: title);
}
```

### Bước 2: Tạo Retrofit Client
Tạo file client tại `lib/features/<feature_name>/data/datasources/` để khai báo các endpoint:

```dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/my_response_model.dart';

part 'feature_api_client.g.dart';

@RestApi()
abstract class FeatureApiClient {
  factory FeatureApiClient(Dio dio, {String baseUrl}) = _FeatureApiClient;

  @GET('/api/v1/items')
  Future<MyResponseModel> getItems();
}
```

### Bước 3: Đăng ký Dependency Injection (DI)
Trong file `lib/core/injection/injection_container.dart`, đăng ký client bằng cách truyền instance `Dio` từ `ApiClient` dùng chung:

```dart
// Đăng ký Retrofit client lấy Dio từ ApiClient
sl.registerLazySingleton(() => FeatureApiClient(sl<ApiClient>().dio));

// Đăng ký Remote Datasource inject Retrofit client
sl.registerLazySingleton<FeatureRemoteDataSource>(
  () => FeatureRemoteDataSourceImpl(apiClient: sl<FeatureApiClient>()),
);
```

### Bước 4: Triển khai DataSource và Repository
* **DataSource** nhận client qua constructor và thực hiện gọi hàm:
  ```dart
  class FeatureRemoteDataSourceImpl implements FeatureRemoteDataSource {
    final FeatureApiClient apiClient;
    FeatureRemoteDataSourceImpl({required this.apiClient});
    
    @override
    Future<MyResponseModel> getItems() => apiClient.getItems();
  }
  ```
* **RepositoryImpl** gọi DataSource, lấy kết quả DTO, chuyển đổi sang Entity thông qua extension `.toEntity()`, bọc trong `Resource` và trả về:
  ```dart
  class FeatureRepositoryImpl implements FeatureRepository {
    final FeatureRemoteDataSource remoteDataSource;
    
    FeatureRepositoryImpl({required this.remoteDataSource});

    @override
    Future<Resource<MyEntity>> getItems() async {
      try {
        final model = await remoteDataSource.getItems();
        return Resource.success(model.toEntity());
      } catch (e) {
        return Resource.error(e.toString());
      }
    }
  }
  ```
