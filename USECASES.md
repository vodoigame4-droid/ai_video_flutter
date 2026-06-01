# Tài liệu Hướng Dẫn Sử Dụng UseCases (TGV AI Video)

Tài liệu này cung cấp hướng dẫn chi tiết về cấu trúc, tham số đầu vào, kiểu dữ liệu trả về và ví dụ thực tế cho toàn bộ các **UseCases** trong hệ thống (nằm trong package `core_business`). Tài liệu giúp các lập trình viên dễ dàng gọi UseCase khi phát triển các giao diện người dùng (UI) mới mà không cần quan tâm đến chi tiết triển khai phía dưới.

---

## 1. Hướng Dẫn Kiến Trúc & Cách Sử Dụng Chung

### 1.1. Giao diện cơ sở UseCase
Hầu hết các UseCase trong dự án đều triển khai (implement) interface cơ sở từ [usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/core/usecases/usecase.dart):
```dart
abstract class UseCase<T, Params> {
  Future<Resource<T>> call(Params params);
}
```
* **`T`**: Kiểu dữ liệu thành công trả về (Entity hoặc kiểu nguyên thủy).
* **`Params`**: Lớp chứa các tham số đầu vào. Nếu UseCase không cần tham số, sử dụng lớp `NoParams`.
* **`Resource<T>`**: Wrapper bao bọc dữ liệu trả về để quản lý trạng thái (`success`, `error`, `loading`).

### 1.2. Cách gọi UseCase trong BLoC
Tất cả các UseCase phải được đăng ký thông qua **Dependency Injection (GetIt)** và được gọi từ **BLoC/Cubit**, **TUYỆT ĐỐI KHÔNG** gọi trực tiếp từ UI (Widgets/Pages).

**Ví dụ sử dụng trong BLoC:**
```dart
class MyBloc extends Bloc<MyEvent, MyState> {
  final MyUseCase myUseCase;

  MyBloc({required this.myUseCase}) : super(const MyState.initial()) {
    on<MyEvent>((event, emit) async {
      emit(const MyState.loading());
      
      // Gọi UseCase thông qua hàm call()
      final result = await myUseCase(MyParams(id: event.id));
      
      result.when(
        success: (data) => emit(MyState.success(data)),
        error: (message) => emit(MyState.failure(message)),
      );
    });
  }
}
```

---

## 2. Danh Sách Chi Tiết UseCases Theo Feature

### 2.1. Feature: Authentication & User Profile (Xác thực & Thông tin cá nhân)

#### 🔑 `LoginUseCase`
* **Lớp:** `LoginUseCase`
* **File:** [login_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/auth/domain/usecases/login_usecase.dart)
* **Chức năng:** Thực hiện đăng nhập ẩn danh bằng Device ID (UDID) của thiết bị.
* **Tham số đầu vào (`LoginParams`):**
  * `deviceId` (`String`, Bắt buộc): ID định danh thiết bị.
  * `refCode` (`String?`, Tùy chọn): Mã giới thiệu (nếu có).
* **Dữ liệu trả về:** `Resource<UserEntity>`
  * `UserEntity` chứa các thông tin: `id`, `deviceId`, `credits` (số credit hiện có), `isPremium`, v.v.

#### 👤 `GetProfileUseCase`
* **Lớp:** `GetProfileUseCase`
* **File:** [get_profile_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/auth/domain/usecases/get_profile_usecase.dart)
* **Chức năng:** Lấy thông tin cá nhân hiện tại của người dùng (bao gồm số lượng credit còn lại).
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<UserEntity>`

#### ⚡ `AutoLoginUseCase` (Mới)
* **Lớp:** `AutoLoginUseCase`
* **File:** [auto_login_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/auth/domain/usecases/auto_login_usecase.dart)
* **Chức năng:** Khởi tạo phiên làm việc khi mở ứng dụng. Sử dụng UDID thiết bị (hoặc UUID ngẫu nhiên), chuẩn hóa định dạng (hậu tố `-tgv`), kiểm tra phiên đăng nhập đã tồn tại chưa và thực hiện đăng nhập ngầm nếu cần. Đồng thời thiết lập đăng ký nhận thông báo thông qua FCM.
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<UserEntity>`

---

### 2.2. Feature: Settings & App Configurations (Cài đặt & Trạng thái ứng dụng)

#### 🌐 `GetSettingsUseCase`
* **Lớp:** `GetSettingsUseCase`
* **File:** [get_settings_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/settings/domain/usecases/get_settings_usecase.dart)
* **Chức năng:** Lấy mã ngôn ngữ (locale code) đã lưu của ứng dụng.
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<String>` (Ví dụ: `'en'`, `'vi'`,...)

#### 💾 `SaveSettingsUseCase`
* **Lớp:** `SaveSettingsUseCase`
* **File:** [save_settings_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/settings/domain/usecases/save_settings_usecase.dart)
* **Chức năng:** Lưu mã ngôn ngữ mới được chọn vào bộ nhớ thiết bị.
* **Tham số đầu vào:** `String` (Ví dụ: `'en'`)
* **Dữ liệu trả về:** `Resource<void>`

#### 📖 `GetOnboardingStatusUseCase` (Mới)
* **Lớp:** `GetOnboardingStatusUseCase`
* **File:** [get_onboarding_status_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/settings/domain/usecases/get_onboarding_status_usecase.dart)
* **Chức năng:** Kiểm tra xem người dùng đã hoàn thành màn hình Onboarding (hướng dẫn) hay chưa.
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<bool>`

#### 🎯 `CompleteOnboardingUseCase` (Mới)
* **Lớp:** `CompleteOnboardingUseCase`
* **File:** [complete_onboarding_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/settings/domain/usecases/complete_onboarding_usecase.dart)
* **Chức năng:** Lưu trạng thái đã hoàn thành màn hình Onboarding của người dùng.
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<void>`

---

### 2.3. Feature: Media & Video Generation (Tạo video & Quản lý phương tiện)

#### 🏠 `GetHomeCategoriesUseCase`
* **Lớp:** `GetHomeCategoriesUseCase`
* **File:** [get_home_categories_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/get_home_categories_usecase.dart)
* **Chức năng:** Lấy danh sách các danh mục và các template tương ứng để hiển thị tại trang chủ.
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<List<HomeCategoryEntity>>`
  * `HomeCategoryEntity` chứa: `id`, `name`, danh sách `templates` (`List<ThemeEntity>`).

#### 🗂️ `GetCategoriesUseCase`
* **Lớp:** `GetCategoriesUseCase`
* **File:** [get_categories_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/get_categories_usecase.dart)
* **Chức năng:** Lấy danh sách toàn bộ danh mục của các template video.
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<List<HomeCategoryEntity>>`

#### 🎨 `GetThemesUseCase`
* **Lớp:** `GetThemesUseCase`
* **File:** [get_themes_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/get_themes_usecase.dart)
* **Chức năng:** Lấy danh sách các themes/templates theo bộ lọc và hỗ trợ phân trang.
* **Tham số đầu vào (`GetThemesParams`):**
  * `categoryId` (`String?`, Tùy chọn): Lọc theo ID danh mục.
  * `page` (`int?`, Tùy chọn): Trang hiện tại.
  * `take` (`int?`, Tùy chọn): Số lượng item mỗi trang.
  * `isFeatured` (`bool?`, Tùy chọn): Lọc các theme nổi bật.
* **Dữ liệu trả về:** `Resource<PaginatedListEntity<ThemeEntity>>`
  * `PaginatedListEntity` chứa: `data` (`List<ThemeEntity>`), `page`, `take`, `total`.

#### 📤 `UploadImageUseCase`
* **Lớp:** `UploadImageUseCase`
* **File:** [upload_image_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/upload_image_usecase.dart)
* **Chức năng:** Upload ảnh từ thiết bị lên server để chuẩn bị tạo video.
* **Tham số đầu vào:** `String` (Đường dẫn vật lý của tệp ảnh cục bộ).
* **Dữ liệu trả về:** `Resource<String>` (URL ảnh được upload thành công trên Cloud).

#### 🎬 `CreateTgvUseCase`
* **Lớp:** `CreateTgvUseCase`
* **File:** [create_tgv_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/create_tgv_usecase.dart)
* **Chức năng:** Gửi yêu cầu khởi tạo tiến trình tạo video AI lên backend.
* **Tham số đầu vào:** `CreateTgvRequestModel` *(Lưu ý: xem phần Vi phạm bên dưới)*
  * Các trường gồm: `imageUrl`, `name`, `prompt`, `themeId`, `isHd`, `isLongTime`, `themeType`, `themeOrgId`, `serviceType`.
* **Dữ liệu trả về:** `Resource<MediaEntity>`
  * `MediaEntity` chứa: `id`, `status` (`'PENDING'`, `'PROCESSING'`, `'COMPLETED'`, `'FAILED'`), `videoUrl`, `imageUrl`, v.v.

#### 🔍 `GetMediaDetailUseCase`
* **Lớp:** `GetMediaDetailUseCase`
* **File:** [get_media_detail_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/get_media_detail_usecase.dart)
* **Chức năng:** Lấy thông tin chi tiết (bao gồm trạng thái tiến trình tạo video hiện tại) của một Media ID.
* **Tham số đầu vào:** `String` (ID của Media/Video).
* **Dữ liệu trả về:** `Resource<MediaEntity>`

#### 🕒 `GetHistoryUseCase`
* **Lớp:** `GetHistoryUseCase`
* **File:** [get_history_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/get_history_usecase.dart)
* **Chức năng:** Lấy danh sách lịch sử tạo video của tài khoản hiện tại (hỗ trợ phân trang).
* **Tham số đầu vào (`GetHistoryParams`):**
  * `page` (`int?`): Số trang cần lấy.
  * `take` (`int?`): Số lượng phần tử mỗi trang.
* **Dữ liệu trả về:** `Resource<PaginatedListEntity<MediaEntity>>`

#### 📡 `GetMediaStatusesUseCase`
* **Lớp:** `GetMediaStatusesUseCase`
* **File:** [get_media_statuses_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/get_media_statuses_usecase.dart)
* **Chức năng:** Kiểm tra nhanh hàng loạt trạng thái của danh sách các video đang tạo.
* **Tham số đầu vào:** `List<String>` (Danh sách các Media ID cần kiểm tra).
* **Dữ liệu trả về:** `Resource<List<MediaStatusEntity>>`

#### 🗑️ `DeleteMediaUseCase`
* **Lớp:** `DeleteMediaUseCase`
* **File:** [delete_media_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/delete_media_usecase.dart)
* **Chức năng:** Xóa một video đã tạo ra khỏi tài khoản của người dùng.
* **Tham số đầu vào:** `String` (Media ID cần xóa).
* **Dữ liệu trả về:** `Resource<void>`

#### 📥 `DownloadVideoUseCase`
* **Lớp:** `DownloadVideoUseCase`
* **File:** [download_video_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/download_video_usecase.dart)
* **Chức năng:** Tải video từ URL và lưu vào Thư viện ảnh (Gallery) của thiết bị.
* **Tham số đầu vào:** `String` (URL của video trên server).
* **Dữ liệu trả về:** `Resource<void>`

#### 🔗 `ShareVideoUseCase`
* **Lớp:** `ShareVideoUseCase`
* **File:** [share_video_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/share_video_usecase.dart)
* **Chức năng:** Tải video tạm thời và mở hộp thoại chia sẻ hệ thống (System Share Sheet).
* **Tham số đầu vào (`ShareVideoParams`):**
  * `videoUrl` (`String`): URL video cần chia sẻ.
  * `title` (`String`): Tiêu đề đính kèm khi chia sẻ.
* **Dữ liệu trả về:** `Resource<void>`

#### 🔔 `RequestNotificationPermissionUseCase` (Mới)
* **Lớp:** `RequestNotificationPermissionUseCase`
* **File:** [request_notification_permission_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/request_notification_permission_usecase.dart)
* **Chức năng:** Yêu cầu quyền gửi thông báo (Push Notification) từ hệ thống thiết bị.
* **Tham số đầu vào:** `NoParams`
* **Dữ liệu trả về:** `Resource<bool>` (Trả về `true` nếu người dùng cấp quyền).

#### ✉️ `SubscribeNotificationTopicUseCase` (Mới)
* **Lớp:** `SubscribeNotificationTopicUseCase`
* **File:** [subscribe_notification_topic_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/subscribe_notification_topic_usecase.dart)
* **Chức năng:** Đăng ký nhận thông báo từ Firebase Cloud Messaging (FCM) theo chủ đề (topic) cụ thể.
* **Tham số đầu vào:** `String` (Tên topic cần đăng ký nhận tin).
* **Dữ liệu trả về:** `Resource<void>`

---

### 2.4. Feature: Liked Templates (Quản lý Template đã Thích - Local DB)

> [!NOTE]
> Các UseCase trong nhóm này sử dụng dữ liệu từ cơ sở dữ liệu cục bộ (Drift DB). Do đó, dữ liệu trả về trực tiếp mà không bọc trong `Resource<T>`, giúp việc xử lý local state hoặc reactive Stream diễn ra nhanh chóng hơn.

#### ❤️ `GetLikedTemplatesUseCase`
* **Lớp:** `GetLikedTemplatesUseCase`
* **File:** [liked_templates_usecases.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/liked_templates_usecases.dart#L4)
* **Chức năng:** Lấy danh sách toàn bộ các templates đã được người dùng nhấn thích.
* **Tham số đầu vào:** Không có (gọi dạng `call()`).
* **Dữ liệu trả về:** `Future<List<ThemeEntity>>`

#### ❓ `IsTemplateLikedUseCase`
* **Lớp:** `IsTemplateLikedUseCase`
* **File:** [liked_templates_usecases.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/liked_templates_usecases.dart#L14)
* **Chức năng:** Kiểm tra xem một template cụ thể đã được thích hay chưa.
* **Tham số đầu vào:** `String` (ID của template).
* **Dữ liệu trả về:** `Future<bool>`

#### 🔄 `ToggleLikeTemplateUseCase`
* **Lớp:** `ToggleLikeTemplateUseCase`
* **File:** [liked_templates_usecases.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/liked_templates_usecases.dart#L24)
* **Chức năng:** Đảo ngược trạng thái thích của một template (Thêm vào hoặc xóa khỏi DB cục bộ).
* **Tham số đầu vào:** `ThemeEntity` (Đối tượng template cần xử lý).
* **Dữ liệu trả về:** `Future<void>`

#### 👁️ `WatchLikedTemplatesUseCase`
* **Lớp:** `WatchLikedTemplatesUseCase`
* **File:** [watch_liked_templates_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/media/domain/usecases/watch_liked_templates_usecase.dart)
* **Chức năng:** Cung cấp Stream để lắng nghe sự thay đổi của danh sách template đã thích trong thời gian thực.
* **Tham số đầu vào:** Không có (gọi dạng `call()`).
* **Dữ liệu trả về:** `Stream<List<ThemeEntity>>`

---

### 2.5. Feature: Premium & In-App Purchases (Mua hàng & Gói thành viên)

#### 💎 `VerifySubscriptionUseCase`
* **Lớp:** `VerifySubscriptionUseCase`
* **File:** [verify_subscription_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/premium/domain/usecases/verify_subscription_usecase.dart)
* **Chức năng:** Xác thực biên lai mua gói đăng ký (Subscription) với Backend.
* **Tham số đầu vào:** `VerifySubscriptionRequestModel` *(Lưu ý: xem phần Vi phạm bên dưới)*
  * Các trường gồm: `originalTransactionId`, `productId`, `purchaseToken`, `transactionReceipt`.
* **Dữ liệu trả về:** `Resource<void>`

#### 🪙 `VerifyProductUseCase`
* **Lớp:** `VerifyProductUseCase`
* **File:** [verify_product_usecase.dart](file:///Users/linhpham/Documents/project-flutter/ai_video_flutter/packages/core_business/lib/src/features/premium/domain/usecases/verify_product_usecase.dart)
* **Chức năng:** Xác thực giao dịch mua Credit (Consumable Product) with Backend.
* **Tham số đầu vào:** `VerifyProductRequestModel` *(Lưu ý: xem phần Vi phạm bên dưới)*
  * Các trường gồm: `productId`, `purchaseToken`, `transactionReceipt`.
* **Dữ liệu trả về:** `Resource<void>`

---

## 3. Nhật Ký Refactor & Các Khuyến Nghị Còn Lại

### 3.1. [HOÀN THÀNH] Loại bỏ SharedPreferences & NotificationRepository khỏi BLoC
* **Nội dung:** Đã refactor hoàn toàn `SplashBloc` và `OnboardingBloc`.
  - Thay thế việc ghi trực tiếp `SharedPreferences` bằng `CompleteOnboardingUseCase` và `GetOnboardingStatusUseCase`.
  - Đóng gói toàn bộ logic lấy ID thiết bị, tự động đăng nhập ẩn danh và đăng ký thông báo FCM phức tạp từ `SplashBloc` sang `AutoLoginUseCase`.
* **Kết quả:** Code của các BLoC này giảm đi hơn một nửa, hoàn toàn độc lập với các data sources vật lý và sẵn sàng tái sử dụng khi bạn phát triển một thiết kế UI khác.

### 3.2. [CÒN LẠI] Rò rỉ Data Layer vào Domain Layer (Dependency Inversion Violation)
* **Mô tả:** `CreateTgvUseCase`, `VerifySubscriptionUseCase`, và `VerifyProductUseCase` vẫn đang sử dụng trực tiếp các lớp Request Model (DTOs) thuộc Data layer làm kiểu tham số đầu vào.
* **Vấn đề:** Domain layer bị phụ thuộc trực tiếp vào cấu trúc serialization/JSON của Data layer.
* **Giải pháp đề xuất:**
  1. Định nghĩa các lớp Params thuộc Domain layer trong tệp UseCase tương ứng (ví dụ: `CreateTgvParams`, `VerifySubscriptionParams`).
  2. Để các Repository Interface nhận các Params này.
  3. Tại Repository Implementation (Data layer), thực hiện chuyển đổi các Params này thành các DTO Request Models trước khi gọi API Client.
