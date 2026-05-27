---
name: flutter-router
description: Define and enforce modern GoRouter structure, route organization, redirects, guards, and page transitions for this Flutter repository. Use when Codex needs to add a new route, refactor navigation flow, wire feature routes into the app router, or apply clean and polished screen transition patterns.
---

# Flutter Router

Dùng skill này để giữ navigation gọn, dễ mở rộng và nhất quán theo `GoRouter`.

## Mục tiêu

- Tập trung router tổng ở `core/navigation/`.
- Route theo feature được tách rõ nhưng không tự phát.
- Không hardcode route string lung tung trong UI.
- Transition hiện đại, tinh gọn, có chủ đích, không lạm dụng animation.

## Workflow

1. Xác định đây là route toàn app hay route của một feature.
2. Đặt router tổng, redirect, shell route ở `core/navigation/`.
3. Nếu feature lớn có nhiều route riêng, đặt route config phụ trong `features/<feature>/presentation/routes/`.
4. Trong từng file route, đặt luôn `static const path`, `static const name`, và helper static `go` hoặc `push`.
5. Nối route feature vào router tổng, không để feature tự tạo router độc lập.
6. Chỉ dùng transition khi nó cải thiện cảm giác điều hướng; ưu tiên animation ngắn, mượt, nhất quán.
7. Giữ navigation API rõ ràng bằng helper static của route thay vì string rải rác hoặc gọi `goNamed` trực tiếp khắp nơi.

## Quy tắc bắt buộc

- Root `GoRouter` phải có một entry point rõ ràng, ví dụ `app_router.dart`.
- `path`, `name`, redirect, shell route, observer, guard phải có chỗ đặt dễ tìm.
- Một feature không được sở hữu root router riêng nếu chỉ là một phần của app.
- `path` và `name` phải nằm trong chính file route tương ứng.
- Điều hướng từ UI phải ưu tiên đi qua static helper của route, bên trong helper mới gọi `context.goNamed(...)` hoặc `context.pushNamed(...)`.
- Với flow lớn, ưu tiên route theo feature thay vì để toàn bộ route nằm trong một file khổng lồ.

## Transition và motion

- **LUÔN LUÔN** sử dụng `AppRoutePage.cupertino` cho tất cả các định nghĩa route (`GoRoute`) để bắt buộc dùng animation chuyển màn hình chuẩn của iOS (trượt ngang từ phải sang, có bóng mờ, vuốt mép trái để back) trên toàn bộ mọi nền tảng (cả Android và iOS).
- **KHÔNG** sử dụng `builder` mặc định của `GoRoute` hoặc các transition tự chế (Fade, Slide) khác trừ khi có yêu cầu đặc biệt rõ ràng từ User.
- Ví dụ bắt buộc khi tạo route:
  ```dart
  GoRoute(
    path: path,
    name: name,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return AppRoutePage.cupertino<void>(
        state: state,
        child: const YourPage(),
      );
    },
  )
  ```
- Với Bottom Navigation (StatefulShellRoute), dùng cơ chế `indexedStack` mặc định của GoRouter, **không** tự ý nhồi thêm transition để tránh mất state giữa các tab.
- Tránh animation dài, phô trương. Dialog, BottomSheet cũng phải dùng motion mượt mà và dứt khoát.

## References

- Đọc `references/router.md` cho rule chi tiết về cấu trúc file, transition, guard và cách tổ chức route theo feature.
