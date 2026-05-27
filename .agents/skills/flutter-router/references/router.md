---
trigger: always_on
---

# Quy Tắc Router Và Navigation

## 1. Vị trí đặt file

- Router tổng app đặt trong `lib/core/navigation/`.
- Nên có các file sau nếu project đủ lớn:
  - `app_router.dart`
  - `route_redirects.dart`
  - `navigation_observer.dart`
- Route riêng của feature lớn có thể đặt trong:
  - `lib/features/<feature>/presentation/routes/`

## 2. Cấu trúc sạch

- `main.dart` chỉ bootstrap app, không chứa toàn bộ route tree dài.
- `app_router.dart` là nơi assemble route tree cuối cùng.
- Mỗi feature chỉ khai báo phần route của chính nó nếu thật sự cần.
- Không để một file route duy nhất phình quá lớn và chứa mọi flow của app mà không phân vùng.

## 3. Route name và path

- `path` và `name` phải được đặt ngay trong file route của chính màn hình hoặc feature đó.
- Không tách `route_paths.dart` và `route_names.dart` riêng nếu project đã theo convention route tự chứa metadata.
- Mỗi file route nên tự chứa:
  - `static const String path = ...`
  - `static const String name = ...`
  - `static void go(...)`
  - `static Future<T?> push<T>(...)`
- Không hardcode path string ở page, bloc, widget, service nếu file route đã cung cấp helper.
- `path` dùng cho cấu trúc URL.
- `name` dùng cho điều hướng semantic và dễ refactor hơn.
- Helper static trong file route là API điều hướng chuẩn để dùng lại trong toàn project.

## 4. Phân vai trách nhiệm

- `core/navigation/`:
  - root router
  - shell route
  - global redirect
  - auth guard
  - app-wide observer
- `features/<feature>/presentation/routes/`:
  - route builder của feature
  - child routes của feature
  - helper route dành riêng cho feature

## 5. Điều hướng từ UI

- UI không nên gọi `context.goNamed(...)` hay `context.pushNamed(...)` trực tiếp ở khắp nơi nếu đã có helper static trong file route.
- Ưu tiên gọi API điều hướng qua helper tĩnh, ví dụ:
  - `LoginRoute.go(context)`
  - `StoryDetailRoute.push(context, storyId: id)`
- Bên trong helper static mới dùng:
  - `context.goNamed(...)`
  - `context.pushNamed(...)`
- Không ghép string thủ công để điều hướng nếu file route đã có helper.
- Không đặt business decision phức tạp trực tiếp trong `onTap` rồi điều hướng loạn; nếu cần, để Bloc hoặc coordinator quyết định rồi UI chỉ thực hiện effect.

## 6. Redirect và guard

- Redirect toàn app phải tập trung ở router tổng.
- Logic auth, onboarding, paywall entry, maintenance gate phải có điểm kiểm soát rõ ràng.
- Không lặp lại cùng một điều kiện redirect ở nhiều route nếu có thể gom vào một lớp điều hướng chung.

## 7. Transition hiện đại

- Ưu tiên animation tinh gọn:
  - fade
  - fade + slight vertical slide
  - fade + slight horizontal slide cho flow drill-down
- Thời lượng ưu tiên:
  - khoảng `180ms` đến `280ms`
- Curve ưu tiên:
  - `Curves.easeOutCubic`
  - `Curves.easeInOutCubic`
- Dùng transition riêng cho:
  - full-screen flow
  - modal-like page
  - onboarding
  - image/detail drill-down
- Không thêm transition riêng cho mọi route chỉ để "cho đẹp".

## 8. Gọn gàng và đẹp

- Navigation đẹp là nhất quán, không phải nhiều hiệu ứng.
- Cảm giác "hiện đại" đến từ:
  - route tree rõ
  - mỗi route file tự chứa path/name/helper rõ ràng
  - motion ngắn
  - trạng thái back/forward dễ đoán
  - shell/tab navigation ổn định

## 9. Không được làm

- Không đặt toàn bộ config `GoRouter` vào `main.dart`.
- Không để route feature-specific sống ở `core/` nếu nó không phải shared concern.
- Không tạo nhiều lớp wrapper điều hướng vô nghĩa.
- Không rải `context.goNamed(...)` và `context.pushNamed(...)` trực tiếp khắp UI nếu route đã có static helper.
- Không dùng animation dài, nặng, nhiều lớp chồng chỉ để tạo cảm giác fancy.
