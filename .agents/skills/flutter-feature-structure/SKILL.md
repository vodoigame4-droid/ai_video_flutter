---
name: flutter-feature-structure
description: Define and enforce a feature-first Flutter Clean Architecture folder structure for this repository. Use when Codex needs to create a new feature, review folder placement, move files into the correct layer, or keep Bloc next to pages and widgets inside `features/<feature>/presentation/`.
---

# Flutter Feature Structure

Dùng skill này khi làm việc với cấu trúc thư mục của project theo hướng `feature-first`, không dùng kiểu gom toàn bộ `pages`, `widgets`, `bloc` toàn app vào một chỗ.

## Mục tiêu

- Giữ `Bloc` nằm cạnh UI trong từng feature.
- Giữ ranh giới `data`, `domain`, `presentation` rõ ràng trong từng feature.
- Tránh tạo file mới sai layer hoặc sai thư mục.
- Khi thêm feature mới, tạo cấu trúc thư mục đúng ngay từ đầu.

## Cấu trúc chuẩn

Đọc `references/structure.md` để lấy cây thư mục chuẩn và quy tắc đặt file.

## Quy tắc bắt buộc

- Mọi code nghiệp vụ theo feature phải nằm trong `lib/features/<feature_name>/`.
- Không tạo thêm cấu trúc song song kiểu:
  - `lib/presentation/...`
  - `lib/domain/...`
  - `lib/data/...`
  cho feature mới nếu feature đó thuộc chuẩn `feature-first`.
- `bloc`, `pages`, `widgets` phải nằm trong:
  - `lib/features/<feature_name>/presentation/bloc/`
  - `lib/features/<feature_name>/presentation/pages/`
  - `lib/features/<feature_name>/presentation/widgets/`
- Không đặt `Bloc` ở thư mục xa UI nếu bloc đó chỉ phục vụ một feature.
- Repository interface phải nằm ở `domain/repositories/`.
- Repository implementation phải nằm ở `data/repositories/`.
- DTO/model API phải nằm ở `data/models/`.
- Data source phải nằm ở `data/datasources/`.
- Entity chỉ nằm ở `domain/entities/`.
- Use case chỉ nằm ở `domain/usecases/`.

## Cách áp dụng khi làm code

1. Xác định feature đang sửa hoặc feature mới cần tạo.
2. Kiểm tra file đang thêm thuộc `data`, `domain`, hay `presentation`.
3. Đặt file vào đúng cây thư mục của feature đó.
4. Nếu là UI state theo màn hình, đặt `Bloc` trong `presentation/bloc/` của chính feature.
5. Nếu là widget hiển thị, đặt trong `presentation/widgets/` hoặc `presentation/pages/` tùy vai trò.
6. Nếu phát hiện code mới đang đi vào cấu trúc global cũ, ưu tiên đưa về cấu trúc feature-first, trừ khi người dùng yêu cầu giữ nguyên.

## Quy tắc review và refactor

- Khi review, ưu tiên bắt lỗi đặt sai thư mục trước cả chuyện naming nhỏ.
- Nếu một file đang nằm sai layer nhưng phạm vi task nhỏ, chỉ refactor khi việc di chuyển không gây lan rộng ngoài yêu cầu.
- Với feature mới, không được tạo nửa cũ nửa mới. Phải theo trọn cây `features/<feature>/...`.
- Với feature cũ, nếu người dùng không yêu cầu refactor lớn, chỉ cần giữ các file mới tuân theo cấu trúc chuẩn hoặc mở rộng trong cùng feature.

## Liên hệ với các skill khác

- Dùng cùng `$flutter_clean_architecture` khi cần rule chặt về layer, widget, state, i18n và tech stack.
- Nếu có xung đột giữa cấu trúc cũ và cấu trúc chuẩn mới, ưu tiên làm rõ phạm vi áp dụng trước khi di chuyển hàng loạt file.
