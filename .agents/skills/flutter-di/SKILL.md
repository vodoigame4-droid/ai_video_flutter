---
name: flutter-di
description: Define and enforce modern dependency injection structure with GetIt for this Flutter repository. Use when Codex needs to register a new dependency, organize DI by feature, decide factory versus singleton lifetime, or refactor service locator setup into a clean feature-first structure.
---

# Flutter DI

Dùng skill này để giữ dependency injection rõ ràng, tách theo feature, và không để registration lan ra nhiều nơi khó kiểm soát.

## Mục tiêu

- Có một entry point DI tổng ở `core/injection/`.
- Registration theo feature được tách nhỏ nhưng nối về cùng một chỗ.
- Quyết định lifetime nhất quán: `factory`, `lazySingleton`, `singleton`.
- Không khởi tạo dependency quản lý bởi DI trực tiếp trong page, bloc, repository.
- Bloc phải nhận dependency qua constructor, không tự gọi `GetIt` trong class.

## Workflow

1. Xác định dependency mới thuộc feature nào và thuộc layer nào.
2. Quyết định lifetime trước khi đăng ký.
3. Đặt registration của feature vào file DI theo feature hoặc module tương ứng.
4. Nối registration đó vào entry point DI tổng của app.
5. Kiểm tra dependency direction để tránh bloc kéo nhầm data source hoặc UI layer kéo nhầm implementation.

## Quy tắc bắt buộc

- DI tổng app phải có entry point rõ ràng trong `core/injection/`.
- Feature lớn nên có registration riêng, ví dụ `initAuthDependencies(GetIt sl)`.
- Repository interface được inject qua implementation đã đăng ký.
- Bloc và use case mặc định dùng `factory`.
- Repository, data source, service mặc định cân nhắc `lazySingleton`.
- Chỉ dùng `singleton` thật sự khi object cần tồn tại duy nhất ngay từ đầu và không có lý do trì hoãn khởi tạo.
- Bloc, Cubit, UseCase, Repository không được tự gọi `GetIt.I()` hoặc `sl()` để lấy dependency trong thân class.
- Dependency phải được truyền vào constructor rõ ràng.

## Clean DI

- Không đăng ký dependency theo kiểu một file rất dài, không phân vùng.
- Không inject thừa dependency mà class không dùng.
- Không để UI biết chi tiết implementation khi có thể phụ thuộc vào contract.
- Không để feature tự âm thầm đăng ký dependency ngoài entry point chung.
- Không dùng service locator lung tung trong code nghiệp vụ hoặc UI.

## References

- Đọc `references/di.md` cho rule chi tiết về cấu trúc file, registration theo feature, naming, lifetime và anti-pattern.
