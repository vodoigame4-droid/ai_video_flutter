# Local Network Package (`packages/network`)

Package này chịu trách nhiệm đóng gói toàn bộ logic gọi API (HTTP requests, Interceptors, Exception mapping) độc lập với ứng dụng chính.

---

## 📌 Các quy tắc thiết kế & phát triển (Golden Rules)

1. **KHÔNG tự khởi tạo Dio hay HTTP Client ở App:** Mọi kết nối mạng phải đi qua lớp `ApiClient` của package này.
2. **Không in log bừa bãi:** Log HTTP được xử lý qua `LoggingInterceptor` bằng cách truyền callback logger từ ứng dụng chính (ví dụ: `LogUtils.d`), đảm bảo log được quản lý tập trung và ẩn hoàn toàn khi ở bản Release.
3. **Mã hóa Exception miền (Network Exceptions):** Tất cả các lỗi từ Dio (`DioException`) phải được bắt lại và chuyển đổi thành `NetworkException` thích hợp trước khi ném ra ngoài để các tầng phía trên (Repositories/Blocs) xử lý sạch sẽ.
4. **Tách biệt DTO và Entity:**
   - Model API (DTO) phải được thiết kế bất biến bằng `@freezed` + `fromJson`/`toJson`.
   - Data Layer chỉ tương tác với Model DTO.
   - Domain Layer và Presentation Layer chỉ tương tác với Domain Entity.
   - Bắt buộc cung cấp Mapper (`toEntity()`) ở tầng Data để chuyển đổi DTO sang Entity.

---

## 🛠 Cách sử dụng trong dự án chính

### 1. Khai báo Dependency trong `pubspec.yaml`
```yaml
dependencies:
  network:
    path: ./packages/network
```

### 2. Khởi tạo & Đăng ký Dependency Injection (GetIt)
```dart
import 'package:network/network.dart';

sl.registerLazySingleton<ApiClient>(
  () => ApiClient(
    baseUrl: 'https://api.example.com/',
    logCallback: LogUtils.d,
    tokenProvider: () async {
      // Logic lấy JWT token nếu có
      return null;
    },
  ),
);
```

### 3. Tích hợp với Retrofit
Khai báo API client bằng Retrofit bằng cách truyền `Dio` được lấy từ `ApiClient`:

```dart
@RestApi()
abstract class FeatureApiClient {
  factory FeatureApiClient(Dio dio, {String baseUrl}) = _FeatureApiClient;

  @GET('/api/v1/data')
  Future<DataResponseModel> getData();
}

// Đăng ký DI
sl.registerLazySingleton(() => FeatureApiClient(sl<ApiClient>().dio));
```
