---
trigger: always_on
---

# Quy Tắc State Management

## 1. Nguyên tắc cứng

- Mỗi screen hoặc page cấp màn hình bắt buộc phải có `Bloc` hoặc `Cubit` riêng.
- Mọi state của màn hình phải đi qua `Bloc` hoặc `Cubit`.
- Không dùng `setState` để quản lý screen state, async state, loading state, error state, empty state, selected state, tab state nghiệp vụ, hoặc bất kỳ state nào ảnh hưởng hành vi chính của màn hình.
- `setState` chỉ được chấp nhận cho UI-only state rất nhỏ và rất ngắn hạn nếu không đáng để tạo bloc riêng, ví dụ:
  - hiệu ứng animation thuần hiển thị
  - toggle hiển thị icon tạm thời
  - focus helper cục bộ
- Nếu có tranh cãi liệu state đó có phải "nhỏ" hay không, mặc định đưa sang `Bloc/Cubit`.

## 2. Cấm rõ ràng

- Không viết screen chỉ bằng `StatelessWidget` hoặc `StatefulWidget` thuần nếu màn đó có hành vi, state, async flow, tab, selection, loading, CTA state, hoặc state hiển thị đáng kể.
- Không viết màn hình chính theo kiểu `StatefulWidget` rồi giữ dữ liệu màn hình trong `State`.
- Không gọi async flow nghiệp vụ trong `initState()` rồi `setState()` để cập nhật UI.
- Không dùng `Future.delayed(...).then(...)`, listener, callback, hoặc controller callback để tự cập nhật screen state trực tiếp trong page.
- Không tự giữ các biến như:
  - `isLoading`
  - `hasError`
  - `items`
  - `selectedTab`
  - `isLoggedIn`
  - `isReady`
  trong `State` của page nếu chúng thuộc hành vi thật của màn hình.

## 3. Quy tắc cho async UI flow

- Mọi async flow có trạng thái phải được đẩy vào `Bloc/Cubit`.
- Ví dụ phải đi qua `Bloc/Cubit`:
  - fetch dữ liệu
  - khởi tạo player/service có ảnh hưởng UI
  - login
  - preload nội dung
  - check permission
  - mở khóa button sau async work
  - load asset/video/background nếu UI phụ thuộc vào trạng thái đó
- Page chỉ render theo state đã emit ra, không tự điều khiển flow đó.

## 4. Quy tắc định nghĩa State cho Bloc/Cubit (Bắt buộc dùng Freezed Union)

- Bloc/Cubit phải nhận dependency qua constructor.
- Không gọi `GetIt` trong `Bloc/Cubit`.
- Mọi `State` của `Bloc` hoặc `Cubit` bắt buộc phải sử dụng `@freezed` làm `abstract class` để định nghĩa và phải chia thành các **State con (Union Cases)** rõ ràng để mô tả chính xác trạng thái UI:
  - `initial`: Trạng thái ban đầu khi chưa thực hiện bất kỳ tác vụ nào.
  - `loading`: Trạng thái đang tải dữ liệu hoặc đang xử lý tác vụ bất đồng bộ.
  - `ready`: Trạng thái dữ liệu hoặc tài nguyên đã sẵn sàng (ví dụ: video player đã khởi tạo xong, cấu hình đã load xong).
  - `success`: Trạng thái xử lý tác vụ thành công (ví dụ: tạo video thành công, gửi biểu mẫu thành công).
  - `empty`: Trạng thái dữ liệu trống (không có dữ liệu hiển thị).
  - `error`: Trạng thái xảy ra lỗi (chứa thông báo lỗi `String message` hoặc failure object).

### Ví dụ chuẩn hóa định nghĩa State bằng Freezed:
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_feature_state.freezed.dart';

@freezed
abstract class MyFeatureState with _$MyFeatureState {
  const factory MyFeatureState.initial() = _Initial;
  const factory MyFeatureState.loading() = _Loading;
  const factory MyFeatureState.ready({
    required List<String> categories,
    required String selectedCategory,
  }) = _Ready;
  const factory MyFeatureState.success({
    required String resultUrl,
  }) = _Success;
  const factory MyFeatureState.empty() = _Empty;
  const factory MyFeatureState.error({
    required String message,
  }) = _Error;
}
```

### Quy tắc sử dụng State tại UI:
Tại widget build của màn hình, **BẮT BUỘC** sử dụng pattern matching `.when` hoặc `.maybeWhen` để render giao diện tương ứng với từng trạng thái con:
```dart
state.when(
  initial: () => const SizedBox.shrink(),
  loading: () => const Center(child: CircularProgressIndicator()),
  ready: (categories, selectedCategory) => MyReadyWidget(categories, selectedCategory),
  success: (resultUrl) => MySuccessWidget(resultUrl),
  empty: () => const MyEmptyView(),
  error: (message) => MyErrorView(message: message),
);
```

### 4.1. Quy tắc bọc trạng thái tài nguyên con (Resource Sub-States)
Khi một màn hình chứa nhiều phần độc lập (như danh sách danh mục, danh sách video, dữ liệu cấu hình...) mà mỗi phần cần có trạng thái tải (loading, success, empty, error) riêng biệt mà không làm ảnh hưởng đến trạng thái chung của cả màn hình (ví dụ: không làm cả màn hình bị vẽ lại loading xoay vòng khi chỉ đang load danh sách danh mục), ta **BẮT BUỘC** phải bọc các thuộc tính bất đồng bộ đó bằng generic class **`Resource<T>`** (`lib/core/resources/resource.dart`).

Ví dụ định nghĩa các thuộc tính bất đồng bộ độc lập trong một State duy nhất:
```dart
@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  
  // Trạng thái màn hình đã sẵn sàng, nhưng từng cụm dữ liệu bên trong có trạng thái riêng
  const factory HomeState.ready({
    required Resource<List<String>> categoriesState,
    required Resource<List<String>> trendingVideosState,
    required Resource<List<String>> newVideosState,
    required String currentLocale,
  }) = _Ready;
  
  const factory HomeState.error({required String message}) = _Error;
}
```

Cách vẽ UI độc lập tại các widget tương ứng sử dụng `.when` của `Resource`:
```dart
categoriesState.when(
  initial: () => const SizedBox.shrink(),
  loading: () => const CategoryLoadingSkeleton(),
  success: (categories) => CategoryListWidget(categories),
  empty: () => const EmptyText(),
  error: (message) => ErrorRetryButton(message: message),
);
```

## 5. Wiring rõ ràng

- `BlocProvider` chỉ nên xuất hiện ở wiring layer của màn hình hoặc route.
- Page không tự `GetIt`.
- Widget con không tự tạo lại bloc mới nếu chỉ đang consume state của màn hình.
- Màn nào cần bloc thì route hoặc page-level provider phải cấp bloc rõ ràng từ constructor injection / DI wiring.
- Route hoặc screen-level wiring phải chịu trách nhiệm cấp `Bloc/Cubit` cho màn hình.
- Một screen không được xem là hoàn chỉnh nếu chưa có wiring `BlocProvider` hoặc `Cubit` tương ứng.

## 6. Hậu quả review

- Nếu một screen không có `Bloc/Cubit` riêng trong khi có state hoặc hành vi màn hình, đó được xem là vi phạm kiến trúc.
- Nếu một page dùng `setState` cho screen state, đó được xem là vi phạm kiến trúc.
- Nếu một page tự chạy async rồi cập nhật UI mà không qua `Bloc/Cubit`, đó được xem là vi phạm kiến trúc.
- Nếu `GetIt` bị gọi trong page, widget, bloc, cubit, use case, repository, đó được xem là vi phạm DI rule.
