---
name: flutter-testing
description: Define and enforce clean modern testing standards for this Flutter repository. Use when Codex needs to add or review tests for Bloc, use cases, repositories, widgets, route behavior, or feature regressions, and when deciding the minimum test coverage expected for a change.
---

# Flutter Testing

Dùng skill này để giữ test gọn, có giá trị, và bám đúng hành vi thật của feature thay vì viết test hình thức.

## Mục tiêu

- Mọi thay đổi có logic phải có mức test tương xứng.
- Test tập trung vào hành vi quan trọng, không test rườm rà.
- Bloc, use case, repository và widget có rule test rõ ràng.
- Test code phải dễ đọc như một đặc tả hành vi.

## Workflow

1. Xác định thay đổi thuộc UI, state, business logic hay data layer.
2. Chọn loại test nhỏ nhất nhưng đủ bắt regression.
3. Viết test gần feature, tên rõ hành vi, không phụ thuộc setup mơ hồ.
4. Mock đúng ranh giới, không mock quá sâu.
5. Nếu không thể viết test hợp lý trong phạm vi task, nêu rõ lý do và rủi ro còn lại.

## Quy tắc bắt buộc

- Repository có mapping quan trọng hoặc error handling phải có test.
- Widget có nhiều trạng thái hiển thị hoặc hành vi người dùng quan trọng phải có widget test.
- Bug fix phải ưu tiên thêm test chặn tái phát nếu phạm vi cho phép.

## Testing hiện đại

- Ưu tiên test hành vi, không test implementation detail.
- Dùng fixture hoặc builder gọn, tránh setup dài.
- Một test nên kiểm tra một ý chính.
- Tên test phải mô tả rõ điều kiện và kết quả.
- Tránh golden test tràn lan nếu chưa có quy trình review ổn định; dùng khi UI thực sự cần khóa chặt.

## References

- Đọc `references/testing.md` cho rule chi tiết về test matrix, naming, mocking và mức coverage kỳ vọng theo loại thay đổi.
