---
trigger: always_on
---

# Dream Girl Flutter Architecture Rules

The purpose of this file is to ensure that AI agents and contributors do not break the project structure, do not place code in the wrong layer, and do not make the codebase harder to maintain over time.

If there is a conflict between "moving fast" and "preserving architecture", preserve architecture first. If a rule must be broken, that requires an explicit user request and the change must remain minimal and localized.

## 1. Architecture First

- This project must keep the `presentation -> domain -> data` direction.
- Do not reverse dependency flow.
- `presentation` must not access API services, Dio clients, DTOs, or data sources directly.
- `domain` must not import Flutter UI, widgets, themes, Dio, JSON annotations, or data source implementations.
- `data` must not contain UI logic, `BuildContext`, widgets, or navigation code.
- Do not rename, move, merge, or split core architectural layers unless the user explicitly asks for it.

## 2. Current Project Structure Is a Contract

- Preserve the current structure inside `lib/`:
  - `presentation/`
  - `domain/`
  - `data/`
  - `core/`
  - `gen/`
  - `i18n/`
- Inside `presentation`, continue using:
  - `blocs/`
  - `pages/`
  - `widgets/`
- Inside `domain`, continue using:
  - `entities/`
  - `repositories/`
  - `usecases/`
- Inside `data`, continue using:
  - `datasources/`
  - `models/`
  - `repositories/`
- Do not introduce a parallel feature-folder architecture unless the user approves that change.
- Do not do broad folder refactors just to make the project "cleaner" if the task does not require it.

## 3. Naming Rules

- File names must use `snake_case.dart`.
- Class names must use `PascalCase`.
- Bloc files should use the `_bloc.dart` suffix.
- Event and state files must stay close to the feature and use clear, descriptive names.
- Pages and screens should use the `_page.dart` suffix.
- Reusable widgets should use the `_widget.dart` suffix when appropriate.
- DTO and model files should use `_dto.dart` or `_model.dart`.
- Repository interfaces belong in `domain/repositories`.
- Repository implementations belong in `data/repositories`.

## 4. Layer Responsibilities

### Presentation

- Contains UI, state binding, event dispatching, navigation, and rendering only.
- UI must not contain business logic, API mapping, response parsing, coin calculation, or complex permission logic.
- Business behavior belongs in Bloc or in use cases/repositories depending on complexity.
- Large pages must be split into smaller widgets by section.
- Prefer `const` widgets whenever possible.
- Do not use `setState` for business state on large screens. `setState` is only acceptable for small, local, short-lived UI state such as:
  - local tab index
  - local expand/collapse state
  - animation-only state
  - text field helper state
- Do not run screen-level async initialization in a page and then update the UI with `setState`.
- If a screen depends on async readiness, that readiness must come from Bloc/Cubit state.

### Bloc

- Bloc is responsible for orchestrating screen flow.
- Bloc should receive events, call repositories or use cases, and emit states.
- Bloc dependencies must be injected explicitly through the constructor.
- If logic is reusable, long, branching, or clearly domain-specific, move it into a use case.
- Do not write UI code inside Bloc.
- Do not import widgets, `BuildContext`, or theme classes into Bloc.
- Do not resolve dependencies inside Bloc using `GetIt` or another service locator call.
- New event/state definitions should prefer `freezed`.
- States should be explicit and easy to trace:
  - loading
  - success
  - error
  - one-shot `uiAction` only when necessary

### Domain

- Domain is the center of business logic.
- Repositories in domain are contracts only.
- Entities and use cases must not depend on data implementations.
- Domain must not know about API DTOs.
- New use cases must have names that describe a clear business action.

### Data

- Data layer is responsible for API calls, local storage, and request/response mapping.
- DTOs are for transport only.
- Do not use DTOs as direct UI models unless there is a very strong reason and it matches existing project constraints.
- Repository implementations should convert data into domain-friendly structures before exposing them upward.
- Do not place presentation logic in data sources or repository implementations.

## 5. Dependency Direction Rules

- Allowed:
  - `presentation -> domain`
  - `presentation -> core`
  - `presentation -> data` only when the existing codebase already follows that pattern in the same area and changing it would cause unnecessary refactoring
  - `domain -> core`
  - `data -> domain`
  - `data -> core`
- Not allowed:
  - `domain -> presentation`
  - `domain -> data`
  - `core -> feature presentation code`
  - shared widgets importing concrete pages

When two options are possible, choose the one with lower coupling.

## 6. Widget Composition Rules

- Large pages must be split by section.
- A widget should have one clear responsibility.
- If a page becomes hard to read because it contains many sections, extract child widgets.
- Place extracted widgets here:
  - `presentation/widgets/` if shared across features
  - the local feature `widgets/` folder if used only by that feature
- Do not copy-paste large UI blocks across screens. Extract reusable widgets instead.
- Do not over-engineer reusable widgets too early when something appears only once and has no clear abstraction yet.
- Avoid both "god widgets" and widgets that accept too many weakly meaningful flags and callbacks. If complexity grows, split further.
- For stricter project-specific widget decomposition rules, read `references/widget.md`.

## 7. Clean Code Rules

- Code must be readable before it is clever.
- Variable names, method names, event names, and state names must describe intent clearly.
- Long methods or methods with multiple branches should be split.
- Each method should do one main thing.
- Prefer `async/await` over callback chaining for normal async application flows.
- Do not add comments for code that is already obvious.
- Add comments only when needed for:
  - business reasoning
  - workarounds
  - technical constraints
  - behavior that is easy to misunderstand
- Avoid magic numbers. Move meaningful repeated values into constants.
- Do not leave dead code, commented-out code, vague TODOs, or debug prints behind.

## 8. Reusability Rules

- If logic appears in two or more places, consider extracting it.
- If a UI pattern appears in two or more places, consider making it reusable.
- If formatters, mappers, or helpers repeat, move them into `core/` or a suitable shared utility location.
- Never create reuse by violating dependency direction.
- Reuse must preserve architectural boundaries.

## 9. State Management Rules

- Business state for a screen should live in Bloc or Cubit.
- Screen async readiness must live in Bloc or Cubit.
- One-shot UI events should use an explicit mechanism such as `uiAction`, a dedicated state, or another clear pattern already used by the project.
- Do not manage business behavior with scattered mutable widget variables.
- Do not manage screen behavior with `StatefulWidget` fields if the behavior should survive rebuilds conceptually as screen state.
- Loading, empty, error, and success states must be handled clearly in UI.
- Do not skip error branches.

## 10. Navigation Rules

- Use `go_router` according to current project conventions.
- Each page should define `path` and, when needed, `routeName`.
- Repeated navigation to the same screen should be wrapped in a static helper when appropriate.
- Do not hardcode route strings in many places if the screen already exposes a constant or helper.
- Route data must be explicit:
  - `pathParameters` for required identifiers
  - `queryParameters` for flags and options
  - `extra` for auxiliary payloads

## 11. DI Rules

- Every new dependency must be registered in `lib/injection_container.dart`.
- Repositories and data sources should default to `lazySingleton`.
- Blocs and use cases should default to `factory`.
- Do not instantiate DI-managed dependencies directly inside pages or blocs.
- Do not call `GetIt` directly inside blocs, cubits, use cases, repositories, pages, or widgets except at the composition root/wiring layer.
- Bloc dependencies must be visible in the constructor signature.
- It is acceptable to create local UI-only objects directly, such as:
  - controllers
  - focus nodes
  - animation controllers
  - page controllers

## 12. Data Model and Serialization Rules

- New API models must follow the current JSON serialization conventions.
- Do not manually edit generated files:
  - `*.g.dart`
  - `*.freezed.dart`
  - `lib/gen/*.dart`
  - `lib/i18n/strings*.g.dart`
- Only edit source files, then regenerate.
- If a task changes DTOs, models, assets, or translation sources, AI must either run the proper generation command when appropriate or clearly tell the user it is required.

## 13. i18n Rules

- Do not hardcode user-facing UI strings.
- All display strings must come from `lib/i18n/*.i18n.json`.
- When adding a new key, follow the existing localization structure.
- Do not manually edit generated slang files.
- Placeholders must remain intact and correctly formatted.

## 14. Theme and Design Rules

- Do not hardcode colors, text styles, or spacing if a suitable abstraction already exists in `core/theme/`.
- One-off values are acceptable only when the design genuinely requires them.
- Prefer reuse of:
  - `AppColors`
  - `AppTextStyles`
  - shared widgets
- Do not break the established visual language of the app unless the user explicitly requests a redesign.

## 15. Generated Files, Assets, and Ads Rules

- Do not manually edit generated code.
- New assets must follow current project conventions so they remain compatible with `flutter_gen`.
- Asset access in code must use generated accessors from `lib/gen/assets.gen.dart`.
- Do not hardcode asset path strings such as `'assets/icons/foo.png'`, `'assets/raw/bar.json'`, or similar in application code when a generated accessor can be used.
- Prefer patterns such as:
  - `Assets.icons.example.svg()`
  - `Assets.images.example.image()`
  - `Assets.raw.example`
- If a new asset is added, regenerate asset output before using it in code.
- If a task touches ads, IAP, remote config, permissions, or app-open flows:
  - modify only the relevant screens and flows
  - avoid accidental regressions in splash, store, chat, and payment flows
- Do not delete, rename, or move generated files or assets unless the task requires it.

## 16. Feature Change Rules

- When adding a feature, implement all required layers instead of injecting logic directly into a page.
- Preferred order when implementing a new feature:
  1. Identify the correct module or feature area
  2. Add or update domain contracts if needed
  3. Add or update data sources and repository implementations
  4. Add or update Bloc/Cubit
  5. Add or update pages and widgets
  6. Register DI
  7. Add i18n
  8. Regenerate code if needed
- When modifying an existing feature, extend the current structure instead of creating a parallel flow.

## 17. Forbidden Changes

- Do not migrate the project to a different architecture pattern.
- Do not move business logic into widgets or pages.
- Do not call APIs directly from UI.
- Do not manage screen state with `setState` when Bloc/Cubit should own it.
- Do not perform screen-level async flows in a page and patch the result into UI with `setState`.
- Do not import data sources into presentation.
- Do not import Flutter into domain.
- Do not hardcode UI strings.
- Do not hardcode asset path strings when generated asset accessors are available.
- Do not manually edit generated files.
- Do not refactor unrelated files.
- Do not break naming conventions.
- Do not solve duplication with copy-paste if extraction is the better option.
- Do not write main async business flows using long `.then()` / `.catchError()` callback chains when `async/await` is clearer.

## 18. When Unsure

- Prefer the solution with the smallest safe change that still respects boundaries.
- Follow the patterns that already exist in this repository.
- If the codebase currently contains a few imperfect architectural areas, AI must:
  - avoid expanding those problems
  - avoid broad refactors unless requested
  - keep new code cleaner within the scope of the current task

## 19. AI Delivery Checklist

Before finishing a task, AI should verify:

- Is the new code in the correct layer?
- Does it preserve dependency direction?
- Does it avoid hardcoded UI strings?
- Is any large page or widget too big and in need of splitting?
- Is any business logic still living in UI?
- Were any generated files manually edited?
- Was every new dependency registered in DI?
- Were shared components and styles reused where appropriate?
- Were unrelated files left untouched?
- Are loading, empty, error, and success states handled?

## 20. Default Decision Rule

By default, every change should be:

- as small as possible
- aligned with the current architecture
- readable, testable, and extensible
- less harmful to long-term maintainability, not more
