---
name: flutter-i18n
description: Define and enforce rules for internationalization (i18n) and translations using slang in this Flutter repository. Use when Codex needs to add or edit UI texts, ensuring all text is properly localized across all supported languages.
---

# Flutter Internationalization (i18n) Rules

Dùng skill này để đảm bảo ứng dụng luôn được dịch đầy đủ, chuẩn xác theo tất cả các ngôn ngữ đang hỗ trợ.

## Mục tiêu

- Không bao giờ hardcode text trong UI.
- Mọi text hiển thị cho người dùng phải thông qua file JSON của `slang` trong thư mục `lib/i18n/`.
- Dịch đầy đủ cho **TẤT CẢ** các ngôn ngữ mà ứng dụng đang hỗ trợ. Không được bỏ sót bất kỳ ngôn ngữ nào.

## Workflow

1. Khi cần thêm một text mới trên UI, hãy mở file `lib/i18n/en.i18n.json` để thêm key và giá trị (Tiếng Anh - Base).
2. Thêm đúng key đó vào **TẤT CẢ 11 file ngôn ngữ còn lại** trong thư mục `lib/i18n/` và dịch nghĩa tương ứng. Danh sách 12 ngôn ngữ bắt buộc phải có bao gồm:
   - 🇬🇧 Tiếng Anh: `lib/i18n/en.i18n.json` (Base)
   - 🇻🇳 Tiếng Việt: `lib/i18n/vi.i18n.json`
   - 🇫🇷 Tiếng Pháp: `lib/i18n/fr.i18n.json`
   - 🇩🇪 Tiếng Đức: `lib/i18n/de.i18n.json`
   - 🇪🇸 Tiếng Tây Ban Nha: `lib/i18n/es.i18n.json`
   - 🇵🇹 Tiếng Bồ Đào Nha: `lib/i18n/pt.i18n.json`
   - 🇸🇦 Tiếng Ả Rập: `lib/i18n/ar.i18n.json`
   - 🇮🇳 Tiếng Hindi: `lib/i18n/hi.i18n.json`
   - 🇮🇩 Tiếng Indonesia: `lib/i18n/id.i18n.json`
   - 🇯🇵 Tiếng Nhật: `lib/i18n/ja.i18n.json`
   - 🇰🇷 Tiếng Hàn: `lib/i18n/ko.i18n.json`
   - 🇨🇳 Tiếng Trung: `lib/i18n/zh.i18n.json`

3. Nếu không có file dịch sẵn, AI phải dùng bộ dịch thuật của mình để dịch sang các ngôn ngữ trên, đảm bảo file JSON hợp lệ và **KHÔNG THIẾU KEY ở bất kỳ file nào**.
4. Chạy lệnh sinh code: `dart run slang`.
5. Ở phía UI (Flutter/Dart), import `strings.g.dart`. Để text tự động đổi ngôn ngữ mượt mà ngay lập tức khi thay đổi, hãy cân nhắc dùng `context.t` hoặc `Translations.of(context)` thay vì gọi biến `t` tĩnh.

## Quy tắc bắt buộc (Mandatory Rules)

- **Tuyệt đối không hardcode UI text**: Không để text tĩnh trong các file `.dart` của UI (trừ text dùng để debug/log nội bộ).
- **Dịch Full Ngôn ngữ**: Nếu thêm 1 key vào `en.i18n.json`, **BẮT BUỘC** phải thêm key đó vào tất cả các file JSON ngôn ngữ khác. Không được sót bất kỳ ngôn ngữ nào trong thư mục `lib/i18n/`.
- **Sử dụng Python Script (nếu có)**: Nên dùng đoạn script Python tự động thêm key vào tất cả ngôn ngữ nếu số lượng key nhiều để tránh sai sót.
- **Phân nhóm Key**: Đặt tên key theo cấu trúc rõ ràng, phân nhóm theo màn hình hoặc module (ví dụ: `profile.gemStore`, `dashboard.welcome`).
