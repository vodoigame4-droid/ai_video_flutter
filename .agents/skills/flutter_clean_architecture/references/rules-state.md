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

## 4. Quy tắc cho Bloc/Cubit

- Bloc/Cubit phải nhận dependency qua constructor.
- Không gọi `GetIt` trong `Bloc/Cubit`.
- State phải rõ ràng, đọc được, và mô tả đúng UI:
  - `initial`
  - `loading`
  - `ready`
  - `success`
  - `empty`
  - `error`
- Event/state mới ưu tiên `freezed`.

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
