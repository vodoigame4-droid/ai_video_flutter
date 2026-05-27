---
trigger: always_on
---

# Cấu Trúc Thư Mục Chuẩn

```text
lib/
├── core/
│   ├── errors/
│   ├── injection/
│   ├── network/
│   ├── navigation/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── features/
│   └── feature_name/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
└── main.dart
```

## Ý nghĩa từng vùng

### `core/`

- Chứa phần dùng chung toàn app.
- Chỉ đặt ở đây những gì thực sự shared.
- Không nhét logic đặc thù của một feature vào `core/`.
- Đây cũng là nơi đặt cấu hình DI tổng app và cấu hình navigation tổng app.
- Shared widget dùng ở nhiều feature nên đặt trong `core/widgets/`.

### `core/widgets/`

- Chứa shared UI component dùng lại ở nhiều màn hoặc nhiều feature.
- Ví dụ:
  - `coin_button.dart`
  - `app_primary_button.dart`
  - `loading_overlay.dart`
- Chỉ đặt ở đây những widget thật sự shared, không đặt widget đặc thù của một feature.

### `core/injection/`

- Chứa cấu hình dependency injection ở cấp toàn app.
- Nên đặt các file như:
  - `injection_container.dart`
  - `service_locator.dart`
  - `di.dart`
  tùy convention cuối cùng của project, nhưng chỉ nên có một entry point rõ ràng cho DI.
- Các hàm đăng ký dependency theo feature có thể tách nhỏ, nhưng vẫn phải được gọi từ điểm cấu hình DI tổng.

### `core/navigation/`

- Chứa cấu hình `GoRouter` ở cấp toàn app.
- Nên đặt các file như:
  - `app_router.dart`
  - `route_names.dart`
  - `route_paths.dart`
  - `navigation_observer.dart`
- Đây là nơi tập trung:
  - root router
  - shell route
  - redirect toàn app
  - guard mức application
  - constants route dùng chung
- Không nhét toàn bộ định nghĩa route phức tạp vào `main.dart`.

### `features/<feature_name>/data/`

- Chứa lớp làm việc với API, local storage, mapper, DTO, repository implementation.
- Không để widget, bloc, navigation, hoặc UI logic trong đây.

### `features/<feature_name>/domain/`

- Chứa business contract và business model.
- Đây là nơi đặt:
  - entity
  - repository interface
  - use case
- Không để DTO, JSON annotation, API response model, hoặc code Flutter UI vào đây.

### `features/<feature_name>/presentation/`

- Chứa phần giao diện và state theo feature.
- Bao gồm:
  - `bloc/`: bloc, event, state
  - `pages/`: page cấp màn hình
  - `widgets/`: widget con, section, item, reusable UI trong feature
- Nếu feature lớn và có nhiều route riêng, có thể thêm:
  - `routes/`: route builder hoặc route config của riêng feature
- Các route theo feature vẫn phải được nối vào router tổng trong `core/navigation/`.

## Quy tắc quan trọng

- `Bloc` phải nằm cạnh UI trong cùng feature, không gom bloc toàn app ở một thư mục chung.
- Mỗi feature phải tự chứa đủ `data`, `domain`, `presentation` nếu feature đó có đầy đủ các lớp này.
- Nếu feature nhỏ chưa cần đủ cả 3 layer, vẫn giữ hướng mở rộng theo cấu trúc này.
- Không tạo thêm nhánh thư mục song song làm vỡ convention.
- DI tổng app phải nằm trong `core/injection/`, không đặt rải rác ở nhiều nơi không kiểm soát.
- Navigation tổng app phải nằm trong `core/navigation/`, không dồn route config lớn vào `main.dart`.
- Route riêng của feature, nếu có, chỉ là phần mở rộng của feature; điểm ghép cuối cùng vẫn ở router tổng.

## Ví dụ đặt file

- `lib/core/injection/injection_container.dart`
- `lib/core/navigation/app_router.dart`
- `lib/core/navigation/route_paths.dart`
- `lib/core/widgets/coin_button.dart`
- `lib/features/auth/presentation/bloc/login_bloc.dart`
- `lib/features/auth/presentation/pages/login_page.dart`
- `lib/features/auth/presentation/widgets/login_form_widget.dart`
- `lib/features/auth/presentation/routes/auth_routes.dart`
- `lib/features/auth/domain/usecases/login_usecase.dart`
- `lib/features/auth/domain/entities/user_entity.dart`
- `lib/features/auth/data/models/login_request_model.dart`
- `lib/features/auth/data/datasources/auth_remote_datasource.dart`
- `lib/features/auth/data/repositories/auth_repository_impl.dart`

## Không được làm

- Không đặt `login_bloc.dart` ở `lib/presentation/bloc/` nếu bloc chỉ phục vụ `auth`.
- Không đặt `user_entity.dart` trong `data/models/`.
- Không đặt `auth_repository_impl.dart` trong `domain/repositories/`.
- Không đặt widget feature-specific vào `core/` chỉ vì muốn tái sử dụng sớm.
- Không đặt toàn bộ `GoRouter` config trực tiếp trong `main.dart` nếu đã có `core/navigation/`.
- Không đăng ký dependency lung tung trong page, bloc, hoặc file feature nếu đó là dependency dùng DI quản lý ở cấp app.

## Ưu tiên khi mở rộng project

- Tạo feature mới theo cây chuẩn ngay từ đầu.
- Khi sửa feature cũ, nếu có thể, mở rộng theo cấu trúc feature-first thay vì tạo thêm thư mục global.
- Chỉ refactor hàng loạt khi người dùng yêu cầu rõ hoặc khi task thực sự là chuẩn hóa cấu trúc dự án.
