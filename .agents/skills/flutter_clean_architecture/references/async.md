---
trigger: always_on
---

# Quy Tắc Async Await

## 1. Nguyên tắc mặc định

- Ưu tiên `async/await` cho mọi luồng bất đồng bộ thông thường.
- Viết flow bất đồng bộ theo kiểu tuần tự, rõ ràng, dễ đọc.
- Không ưu tiên style callback chain như:
  - `.then(...)`
  - `.catchError(...)`
  - `.whenComplete(...)`
  trừ khi có lý do kỹ thuật rất rõ.

## 2. Cách viết mong muốn

- Khi một hàm gọi API, đọc cache, xử lý async nhiều bước, hãy viết:
  - `async`
  - `await`
  - `try/catch`
- Mỗi bước async nên hiện rõ thứ tự thực thi.
- Nếu có nhiều nhánh lỗi, xử lý bằng `try/catch` hoặc tách hàm phụ, không dồn vào callback lồng nhau.

## 3. Không được làm

- Không chain nhiều `.then()` liên tiếp cho flow nghiệp vụ bình thường.
- Không dùng `.catchError()` để thay thế `try/catch` trong code application thông thường.
- Không viết callback lồng callback khiến luồng xử lý khó đọc.
- Không trộn nửa `await` nửa `.then()` trong cùng một flow nếu không thật sự cần.

## 4. Ngoại lệ chấp nhận được

- Có thể dùng callback style khi API thư viện buộc phải dùng như vậy.
- Có thể dùng stream/listener khi bản chất bài toán là event stream, không phải request-response đơn giản.
- Có thể dùng `Future.wait`, `unawaited`, hoặc pattern async nâng cao khi thực sự hợp lý và có chủ đích rõ.

## 5. Trong Bloc và use case

- Event handler async phải đọc được từ trên xuống dưới.
- Loading, success, error nên xuất hiện theo thứ tự rõ ràng.
- Nếu có nhiều lời gọi async liên tiếp, giữ từng bước tường minh thay vì nhét vào callback chain.

## 6. Trong test

- Test bất đồng bộ cũng ưu tiên `async/await`.
- Không dùng callback style trong test nếu có thể viết dạng await rõ ràng hơn.
- Arrange, act, assert phải đọc mạch lạc.

## 7. Mục tiêu cuối cùng

- Code async phải dễ đọc như code đồng bộ.
- Người review phải nhìn một lần là hiểu:
  - chờ cái gì
  - xử lý lỗi ở đâu
  - kết quả cuối cùng được emit hoặc return thế nào
