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
flutter build apk --release --build-name=1.0.2 --build-number=4

# Build file App Bundle để đưa lên Google Play Store
flutter build appbundle --release --build-name=1.0.3 --build-number=7
```

### iOS
```bash
# Build gói phát hành iOS (IPA)
flutter build ipa --release --build-name=1.0.4 --build-number=4

```

## 4. Dọn dẹp & Reset iOS Build (Chuyển đổi Thiết bị thật <-> Máy ảo)
Khi gặp lỗi biên dịch liên quan đến CocoaPods hoặc cache Xcode khi chuyển đổi build giữa máy thật (Physical Device) và máy ảo (Simulator), chạy chuỗi lệnh sau để dọn dẹp sạch sẽ:
```bash
# 1. Dọn dẹp build cache của Flutter
flutter clean && flutter pub get

# 2. Di chuyển vào thư mục ios để xóa cấu trúc CocoaPods cũ và cài đặt lại sạch sẽ
cd ios
pod deintegrate
pod cache clean --all
pod install --repo-update
cd ..
```
# clean nhẹ nhàng, đủ đêr fix lôĩ object_c
```bash
# Build file APK chạy thử
flutter clean
rm -rf ios/Pods ios/Podfile.lock
flutter pub get
cd ios
pod install
cd ..
``