---
name: flutter_clean_architecture
description: Clean Architecture rules for the Dream Girl Flutter project. Use when Codex needs to add or edit Flutter code in this repository while preserving layer boundaries, naming conventions, Bloc usage, Freezed patterns, localization rules, and the existing project tech stack.
---

# Agent Skill: Flutter Clean Architecture (Lean)

Tuân thủ cấu trúc `dreamgirl-flutter`. Tập trung vào quy tắc chính.

## 1. Layers & Naming
- **Presentation**: `blocs/`, `pages/`, `widgets/`. Suffix: `_bloc`, `_page`, `_widget`.
- **Domain**: `entities/`, `usecases/`, `repositories/` (interface). Suffix: `_entity`, `_use_case`, `_repository`.
- **Data**: `datasources/`, `models/` (DTO), `repositories/` (impl). Suffix: `_model`, `_repository_impl`.
- **Naming**: File `snake_case`, Class `PascalCase`.

## 2. Mandatory: Freezed
**BẮT BUỘC** dùng `freezed` cho:
1. **Bloc Events & States**: Hỗ trợ Pattern Matching.
2. **Domain Entities**: Mọi class model dùng `freezed` (đặc biệt là Entity, State, Event) **bắt buộc** phải khai báo dưới dạng `abstract class` để tránh lỗi phải ghi đè (override) và hoạt động tốt nhất. Ví dụ: `abstract class CharacterEntity with _$CharacterEntity { ... }`.
3. **Data Models (DTOs)**: **Bắt buộc** dùng `@freezed` thay vì `@JsonSerializable()` thuần túy để tạo các class bất biến (immutable) và tự động sinh hàm `fromJson`/`toJson`.
   - Suffix Model: `_model.dart` hoặc `_dto.dart`.
   - Luôn định nghĩa dạng: `abstract class XxxDto with _$XxxDto { const factory XxxDto(...) = _XxxDto; factory XxxDto.fromJson(Map<String, dynamic> json) => _$XxxDtoFromJson(json); }`.

## 3. Implementation Flow
1. **Domain**: Tạo `Entity` -> `Repository` interface -> `UseCase`.
2. **Data**: Tạo `Model` (DTO) -> `DataSource` -> `RepositoryImpl`.
3. **Presentation**: Tạo `Bloc` (Freezed Event/State) -> `Page`.
4. **DI**: Đăng ký vào `lib/injection_container.dart` (`lazySingleton` cho Repo/Source, `factory` cho Bloc/UseCase).

## 4. Gold Rules
- **UI**: Không logic, chỉ gọi Bloc.
- **Bloc**: mỗi screen bắt buộc có Bloc/Cubit riêng.
- **Bloc**: mọi screen state và async UI flow phải đi qua Bloc/Cubit; page không được tự `setState` cho state màn hình.
- **Bloc**: có thể gọi Repository, cũng có thể gọi UseCase nếu logic phức tạp cần tách UseCase.
- **Data**: Không dùng Entity trực tiếp cho API, phải dùng Model/DTO.
- **Const**: Ưu tiên `const` widget để tối ưu performance.
- **Widget**: Không dồn nhiều section UI vào một file. Mặc định phải tách nhỏ widget theo section và theo trách nhiệm hiển thị.
- **Click & Animation**: BẮT BUỘC dùng `InkWell`, `InkResponse`, `IconButton`... hoặc các widget tương tự thay cho `GestureDetector` khi xử lý click để tạo hiệu ứng ripple animation native. Nếu widget có bo góc (`borderRadius`), bắt buộc phải truyền đúng `borderRadius` vào `InkWell` hoặc bọc trong `ClipRRect` để hiệu ứng ripple KHÔNG bị tràn ra ngoài viền.
- **Async**: Ưu tiên `async/await`, không viết flow nghiệp vụ chính bằng callback chain nếu không có lý do kỹ thuật rõ ràng.
- **DI**: Page, Widget, Bloc, Cubit, UseCase, Repository không được tự gọi `GetIt`; dependency phải được wire rõ ràng.
- **Assets**: Bắt buộc dùng generated accessor như `Assets.icons.example`, không hardcode path asset trong code.
- **UseCase Pattern**: BẮT BUỘC mọi UseCase phải `implements UseCase<Type, Params>` (từ `lib/core/usecases/usecase.dart`). Nếu UseCase không có tham số, phải truyền `NoParams()`.
- **API & Retrofit**: BẮT BUỘC dùng Retrofit kết hợp Dio cho các endpoint API (`@GET`, `@POST`...) thay vì gọi Dio trực tiếp và parse JSON bằng tay.
- **Resource Wrapper**: Dữ liệu trả về từ Repository và UseCase BẮT BUỘC phải bọc trong `Resource<T>` (`Resource.success()`, `Resource.error()`). Tại Bloc, BẮT BUỘC dùng pattern matching `.when(loading: ..., success: ..., error: ...)` của `Resource` để xử lý.
- **Logging**: KHÔNG ĐƯỢC dùng `print` hay `debugPrint`. BẮT BUỘC dùng `LogUtils` (`lib/core/utils/log_utils.dart`) để log toàn bộ app. Điều này đảm bảo log được clean và ẩn hoàn toàn khi build Release.

## References

- Xem `references/architecture.md` cho rule kiến trúc đầy đủ.
- Xem `references/async.md` cho quy tắc viết code bất đồng bộ theo `async/await`.
- Xem `references/language.md` cho rule i18n và dịch thuật.
- Xem `references/rules-state.md` cho quy tắc state management.
- Xem `references/tech.md` cho tech stack và lệnh hay dùng.
- Xem `references/widget.md` cho quy tắc tách nhỏ widget và tổ chức file UI.
