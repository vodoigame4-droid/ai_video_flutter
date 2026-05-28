# AI Video Flutter Project

## 1. Phát triển & Chạy dự án (Development & Run)
```bash
# Lấy các thư viện/packages
flutter pub get

# Chạy ứng dụng ở chế độ Debug
flutter run

# Chạy ứng dụng ở chế độ Release
flutter run --release
```

## 2. Sinh code tự động (Code Generation)
Chạy khi thêm mới assets, thay đổi freezed model, hoặc cập nhật bản dịch đa ngôn ngữ:
```bash
# Sinh code cho Freezed / Retrofit / Drift
dart run build_runner build --delete-conflicting-outputs

# Sinh code cho Slang (Đa ngôn ngữ)
dart run slang

# Lệnh gộp chạy cả hai:
dart run build_runner build --delete-conflicting-outputs && dart run slang
```

## 3. Biên dịch dự án (Build)

### Android
```bash
# Build file APK chạy thử
flutter build apk --debug

# Build file APK phát hành (Release)
flutter build apk --release --build-name=1.0.0 --build-number=1

# Build file App Bundle để đưa lên Google Play Store
flutter build appbundle --release --build-name=1.0.0 --build-number=1
```

### iOS
```bash
# Build gói phát hành iOS (IPA)
flutter build ipa --release --build-name=1.0.0 --build-number=1
```