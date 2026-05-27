---
trigger: always_on
---

# Quy Tắc Dependency Injection

## 1. Vị trí đặt file

- DI tổng app đặt trong `lib/core/injection/`.
- Nên có một entry point rõ ràng như:
  - `injection_container.dart`
  - hoặc `di.dart`
- Feature lớn có thể có file registration riêng, ví dụ:
  - `auth_injection.dart`
  - `chat_injection.dart`

## 2. Tổ chức theo feature

- Mỗi feature nên có một hàm registration riêng khi số dependency bắt đầu tăng.
- Ví dụ:
  - `Future<void> initAuthDependencies(GetIt sl)`
  - `Future<void> initChatDependencies(GetIt sl)`
- Entry point DI tổng chỉ chịu trách nhiệm gọi các hàm con theo thứ tự hợp lý.

## 3. Lifetime

- `factory`:
  - Bloc
  - Cubit
  - UseCase thường không giữ state
- `lazySingleton`:
  - Repository
  - Remote/local data source
  - Service stateless hoặc reusable
- `singleton`:
  - chỉ dùng khi thật sự cần khởi tạo một instance duy nhất ngay lập tức

## 4. Hướng phụ thuộc

- Bloc phụ thuộc vào use case hoặc repository contract.
- Use case phụ thuộc vào repository contract.
- Repository implementation phụ thuộc vào data source/service.
- Không inject từ layer thấp ngược lên layer cao.
- Bloc phải nhận dependency qua constructor injection, không tự resolve dependency từ `GetIt`.

## 4.1 Constructor injection cho Bloc

- Mọi `Bloc` hoặc `Cubit` phải khai báo dependency ngay ở constructor.
- Ví dụ mong muốn:
  - `LoginBloc(this._loginUseCase, this._sessionRepository) : super(...)`
- Không viết:
  - `final _loginUseCase = GetIt.I<LoginUseCase>();`
  - `final _repo = sl<AuthRepository>();`
- Constructor injection giúp:
  - dễ đọc dependency graph
  - dễ test
  - tránh service locator bị gọi rải rác trong project
  - giữ ranh giới DI ở composition root thay vì tràn vào code nghiệp vụ

## 5. Clean registration

- Nhóm registration theo block rõ ràng:
  - external
  - core
  - feature auth
  - feature chat
  - feature payment
- Không để file DI là một danh sách dài khó đọc không có phân vùng.
- Nếu feature tăng nhanh, tách registration theo module thay vì giữ tất cả trong một file.

## 6. Không được làm

- Không `GetIt.I.register...` rải rác trong nhiều file không kiểm soát.
- Không `GetIt.I<T>()`, `GetIt.instance<T>()`, hoặc `sl<T>()` lung tung trong page, widget, bloc, cubit, use case, repository.
- Không khởi tạo repository trực tiếp bên trong Bloc nếu repository đó đã thuộc DI.
- Không inject implementation khi có thể inject contract.
- Không đăng ký dependency mà class hiện tại không dùng.
- Không tạo dependency graph vòng tròn.
- Không dùng service locator như một global accessor trong toàn dự án.

## 7. Mục tiêu gọn gàng

- Nhìn vào DI phải biết:
  - app có những module nào
  - feature nào đăng ký gì
  - lifetime của từng dependency là gì
- DI đẹp là DI dễ đọc, không phải DI nhiều abstraction.
