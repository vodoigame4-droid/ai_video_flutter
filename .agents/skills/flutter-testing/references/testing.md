---
trigger: always_on
---

# Quy Tắc Testing

## 1. Test matrix tối thiểu

- Thay đổi `use case` có logic:
  - viết unit test
- Thay đổi `Bloc/Cubit` có state flow:
  - viết bloc test
- Thay đổi `repository` có mapping, fallback, retry, error handling:
  - viết repository test
- Thay đổi `widget/page` có nhiều trạng thái hoặc interaction quan trọng:
  - viết widget test
- Sửa bug:
  - ưu tiên thêm test tái hiện bug trước hoặc cùng lúc với fix

## 2. Vị trí test

- Đặt test theo cấu trúc dễ truy ngược tới feature tương ứng.
- Ưu tiên phản chiếu thư mục `lib/features/...` trong `test/`.
- Tên file test theo đúng file production cộng hậu tố `_test.dart`.

## 3. Tên test

- Tên test phải mô tả:
  - điều kiện
  - hành động
  - kết quả mong đợi
- Ví dụ:
  - `emits loading then success when fetch stories succeeds`
  - `returns failure when remote datasource throws timeout`

## 4. Mocking

- Chỉ mock ở ranh giới cần cô lập.
- Không mock những gì có thể dùng fake nhẹ hoặc test thật rẻ hơn.
- Không mock sâu đến mức test chỉ xác nhận implementation detail.

## 4.1 Async style trong test

- Test async phải ưu tiên `async/await`.
- Tránh callback style khi `await` có thể làm flow rõ ràng hơn.
- Arrange, act, assert cần đọc thẳng mạch, không lồng nhiều callback.

## 5. Bloc test

- Kiểm tra thứ tự state rõ ràng.
- Ưu tiên verify branch quan trọng:
  - success
  - empty
  - error
  - retry
- Không viết bloc test quá dài; tách scenario riêng.

## 6. Widget test

- Kiểm tra hành vi người dùng thấy được:
  - text
  - button state
  - loading
  - error
  - interaction
- Không test layout vi mô vô nghĩa.
- Với page dùng Bloc, bơm state rõ ràng thay vì dựng setup mơ hồ.

## 7. Golden test

- Chỉ dùng khi UI cần khóa chặt về hình ảnh hoặc có design review ổn định.
- Không dùng golden test tràn lan như thay thế widget test thông thường.

## 8. Khi nào được phép chưa có test

- UI thay đổi rất nhỏ, không có logic, không có interaction mới.
- Hotfix cực nhỏ với rủi ro thấp và phạm vi không cho phép setup test hợp lý ngay.
- Dù vậy vẫn phải nêu rõ testing gap trong kết luận nếu không thêm test.

## 9. Mục tiêu hiện đại và gọn

- Test ngắn nhưng chặn đúng regression.
- Setup đọc nhanh.
- Một file test không trở thành bãi rác helper.
- Test code phải sạch gần như production code.
