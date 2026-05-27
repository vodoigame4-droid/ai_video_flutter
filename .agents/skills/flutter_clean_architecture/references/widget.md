---
trigger: always_on
---

# Quy Tắc Tách Nhỏ Widget

Mục tiêu của rule này là ngăn việc dồn toàn bộ UI vào một file lớn, khó đọc, khó review, khó tái sử dụng và khó bảo trì.

## 1. Nguyên tắc mặc định

- Mặc định phải tách nhỏ widget.
- Không xem việc viết toàn bộ UI trong một file là lựa chọn ưu tiên.
- Mỗi widget chỉ nên có một trách nhiệm hiển thị rõ ràng.
- Nếu một phần UI có thể đặt tên được, phần đó nên được tách thành widget riêng.

## 2. Khi nào bắt buộc phải tách widget

- Khi một `page` có nhiều section UI khác nhau.
- Khi trong `build()` xuất hiện nhiều block như:
  - header
  - body section
  - card item
  - action bar
  - filter bar
  - empty state
  - loading state
  - error state
- Khi một widget con có thể được đặt tên theo vai trò cụ thể.
- Khi một đoạn UI dài đến mức phải cuộn nhiều màn hình mới đọc hết trong editor.
- Khi một widget chứa nhiều nhánh `if`, `switch`, `when`, hoặc ternary làm giảm khả năng đọc.
- Khi một `Column`, `Row`, `Stack`, `ListView`, hoặc `CustomScrollView` chứa quá nhiều phần tử con và làm mờ cấu trúc màn hình.
- Khi một khối UI có khả năng tái sử dụng ở nơi khác, hoặc dù chưa tái sử dụng nhưng đã đủ lớn để cần cô lập.

## 3. Quy tắc theo cấp độ

### Page

- `Page` chỉ nên làm các việc:
  - kết nối Bloc
  - điều phối state sang UI
  - ghép các section lớn của màn hình
  - xử lý navigation hoặc effect ở mức màn hình
- `Page` không nên chứa toàn bộ chi tiết của từng item UI nhỏ.
- Trong `Page`, phần `build()` phải đọc được như một sơ đồ màn hình ở mức cao.

### Section Widget

- Mỗi section lớn của màn hình nên được tách thành widget riêng.
- Ví dụ:
  - `profile_header_widget.dart`
  - `subscription_banner_widget.dart`
  - `chat_action_bar_widget.dart`
  - `settings_group_widget.dart`
- Section widget có thể chứa các widget con nhỏ hơn nếu section đó vẫn còn dài hoặc có nhiều trạng thái.

### Item Widget

- Các item lặp lại trong list/grid phải được tách thành file riêng nếu chúng có layout không tầm thường.
- Không để toàn bộ item builder dài nhiều chục dòng ngay trong page hoặc parent widget.
- Nếu item có nhiều biến thể, tách theo widget con hoặc tách hàm dựng UI phụ trợ có tên rõ ràng. Nếu vẫn lớn, tiếp tục tách file.

## 4. Quy tắc đặt file

- Widget dùng riêng cho một feature: đặt trong thư mục `widgets/` của feature đó.
- Widget dùng chung nhiều feature: đặt trong vùng shared phù hợp theo cấu trúc dự án.
- Không đặt widget lớn dưới dạng private class trong cùng file page nếu widget đó là một section thực thụ của màn hình.
- Chỉ dùng private widget cùng file cho phần rất nhỏ, rất gần ngữ cảnh, và không đáng để tách file riêng.

## 5. Những gì không được phép

- Không dồn toàn bộ một màn hình dài vào một file duy nhất nếu màn hình có nhiều section.
- Không để `build()` của page trở thành nơi chứa toàn bộ layout chi tiết.
- Không nhét nhiều widget private liên tiếp trong cùng file chỉ để tránh tạo file mới.
- Không dùng một widget khổng lồ rồi điều khiển hành vi bằng quá nhiều boolean như:
  - `isLoading`
  - `isPremium`
  - `isCompact`
  - `showIcon`
  - `showBadge`
  - `showDivider`
  Nếu số lượng flag tăng lên làm widget khó hiểu, phải tách thành widget nhỏ hơn hoặc tách theo biến thể rõ ràng.

## 6. Dấu hiệu cần refactor ngay

- Một file UI rất dài và khó định vị section.
- `build()` có quá nhiều indentation lồng nhau.
- Reviewer phải mất nhiều thời gian chỉ để hiểu cấu trúc màn hình.
- Cùng một kiểu card, tile, header, hoặc row lặp lại ở nhiều nơi.
- Việc sửa một UI nhỏ yêu cầu chạm vào một file rất lớn.

## 7. Cách ưu tiên tách widget

- Tách theo section hiển thị trước.
- Tách theo trạng thái hiển thị sau.
- Tách theo item lặp lại tiếp theo.
- Chỉ sau đó mới cân nhắc trừu tượng hóa thành widget dùng chung.

## 8. Kỳ vọng khi viết code mới

- Khi tạo màn hình mới, phải chủ động chia file ngay từ đầu.
- Khi sửa màn hình cũ, nếu thấy file đang phình to, ưu tiên tách nhỏ trong cùng lần sửa nếu phạm vi cho phép.
- Mọi màn hình trung bình hoặc lớn phải có cấu trúc đủ rõ để nhìn vào `page` là thấy được các section chính.

## 9. Mẫu tư duy mong muốn

Thay vì viết:

- một `page` chứa toàn bộ header, tab, banner, list item, footer, dialog trigger trong cùng file

Hãy viết:

- `some_page.dart`
- `widgets/some_header_widget.dart`
- `widgets/some_banner_widget.dart`
- `widgets/some_content_section_widget.dart`
- `widgets/some_item_widget.dart`
- `widgets/some_footer_widget.dart`

Ưu tiên khả năng đọc, review và bảo trì hơn việc giữ ít file.
