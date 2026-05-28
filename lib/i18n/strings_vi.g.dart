///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsVi extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsVi _root = this; // ignore: unused_field

	@override 
	TranslationsVi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$vi common = _Translations$common$vi._(_root);
	@override late final _Translations$home$vi home = _Translations$home$vi._(_root);
	@override late final _Translations$create$vi create = _Translations$create$vi._(_root);
	@override late final _Translations$leave_dialog$vi leave_dialog = _Translations$leave_dialog$vi._(_root);
	@override late final _Translations$splash$vi splash = _Translations$splash$vi._(_root);
	@override late final _Translations$onboarding$vi onboarding = _Translations$onboarding$vi._(_root);
	@override late final _Translations$dashboard$vi dashboard = _Translations$dashboard$vi._(_root);
	@override late final _Translations$profile$vi profile = _Translations$profile$vi._(_root);
	@override late final _Translations$home_new$vi home_new = _Translations$home_new$vi._(_root);
	@override late final _Translations$templates$vi templates = _Translations$templates$vi._(_root);
	@override late final _Translations$settings$vi settings = _Translations$settings$vi._(_root);
	@override late final _Translations$language$vi language = _Translations$language$vi._(_root);
	@override late final _Translations$premium$vi premium = _Translations$premium$vi._(_root);
	@override late final _Translations$video_player$vi video_player = _Translations$video_player$vi._(_root);
}

// Path: common
class _Translations$common$vi extends Translations$common$en {
	_Translations$common$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'Xem tất cả';
	@override String get stay => 'Ở lại';
	@override String get leave => 'Rời đi';
	@override String get camera => 'Máy ảnh';
	@override String get gallery => 'Thư viện';
	@override String get generate => 'Tạo video';
}

// Path: home
class _Translations$home$vi extends Translations$home$en {
	_Translations$home$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video AI';
	@override String get trending => 'Xu hướng';
	@override String get new_section => 'Mới';
	@override String get toy_box => 'Hộp đồ chơi';
	@override String get epic_morph => 'Biến hình đỉnh cao';
	@override String get anime => 'Hoạt hình';
	@override String get discover => 'Khám phá';
}

// Path: create
class _Translations$create$vi extends Translations$create$en {
	_Translations$create$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'Ảnh tự sướng Aquaman';
	@override String get tap_upload => 'Chạm vào đây để tải ảnh lên.';
	@override String get select_upload_title => 'Chọn phương thức tải ảnh';
	@override String get upload_image => 'Tải ảnh lên';
	@override String get custom_prompt => 'Mô tả tùy chỉnh';
	@override String get prompt_placeholder => 'Chân dung nữ chân thực, cận cảnh, nhìn vào máy ảnh, nháy mắt tự nhiên, ánh sáng studio xanh, điện ảnh, siêu chi tiết';
	@override String get inspire_me => 'Gợi ý cho tôi';
	@override String get video_settings => 'Cài đặt video';
	@override String get quality => 'Chất lượng';
	@override String get quality_desc => 'Chọn chất lượng video';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'Thời lượng';
	@override String get duration_desc => 'Chọn độ dài video';
	@override String get sec_4s => '4s';
	@override String get sec_8s => '8s';
	@override String get sec_5s => '5s';
	@override String get sec_10s => '10s';
	@override String get sec_15s => '15s';
	@override String get generate_title => 'Tạo video';
	@override String get upload_first_photo => 'Tải lên ảnh đầu tiên.';
	@override String get upload_last_photo => 'Tải lên ảnh cuối cùng.';
	@override String get upload_video_slot => 'Tải lên Video.';
	@override String get upload_photo_slot => 'Tải lên ảnh.';
	@override String photo_slot_num({required Object num}) => 'Ảnh ${num}';
	@override String get required_label => 'Bắt buộc';
	@override String get optional_label => 'Tùy chọn';
	@override String inspire_me_count({required Object count}) => 'Gợi ý prompt (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => 'Đang tạo video của bạn...';
	@override String get select_mock_media => 'Chọn file mẫu';
	@override String get select_media_desc => 'Chọn một file mẫu để mô phỏng tải lên';
}

// Path: leave_dialog
class _Translations$leave_dialog$vi extends Translations$leave_dialog$en {
	_Translations$leave_dialog$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rời đi không lưu?';
	@override String get desc => 'Bạn muốn tiếp tục chỉnh sửa hay rời đi ngay bây giờ?';
}

// Path: splash
class _Translations$splash$vi extends Translations$splash$en {
	_Translations$splash$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Video AI';
}

// Path: onboarding
class _Translations$onboarding$vi extends Translations$onboarding$en {
	_Translations$onboarding$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$vi page1 = _Translations$onboarding$page1$vi._(_root);
	@override late final _Translations$onboarding$page2$vi page2 = _Translations$onboarding$page2$vi._(_root);
	@override late final _Translations$onboarding$page3$vi page3 = _Translations$onboarding$page3$vi._(_root);
	@override late final _Translations$onboarding$page4$vi page4 = _Translations$onboarding$page4$vi._(_root);
	@override late final _Translations$onboarding$page5$vi page5 = _Translations$onboarding$page5$vi._(_root);
}

// Path: dashboard
class _Translations$dashboard$vi extends Translations$dashboard$en {
	_Translations$dashboard$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get home => 'Trang chủ';
	@override String get user => 'Tôi';
	@override String get createVideo => 'Tạo Video';
}

// Path: profile
class _Translations$profile$vi extends Translations$profile$en {
	_Translations$profile$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hồ sơ';
	@override String get upgradeTitle => 'Nâng cấp Premium';
	@override String get upgradeSubtitle => 'Thêm Credits - Không đóng dấu';
	@override String get goPremium => 'Lên Premium';
	@override String get myVideo => 'Video của tôi';
	@override String get liked => 'Đã thích';
	@override String get noVideos => 'Chưa có video';
	@override String get noVideosDesc => 'Hãy tạo video AI đầu tiên của bạn để nó xuất hiện tại đây.';
	@override String get deleteTitle => 'Xóa video này?';
	@override String get deleteDesc => 'Bạn có chắc chắn muốn xóa video này không? Hành động này không thể hoàn tác.';
	@override String get cancel => 'Hủy';
	@override String get delete => 'Xóa';
	@override String get generating => 'Đang tạo...';
	@override String get imageGeneration => 'Tạo hình ảnh';
}

// Path: home_new
class _Translations$home_new$vi extends Translations$home_new$en {
	_Translations$home_new$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'Chào mừng đến với Video AI';
	@override String get imageToVideo => 'Ảnh sang\nVideo';
	@override String get transitionVideo => 'Video\nChuyển cảnh';
	@override String get imageToDance => 'Ảnh sang\nNhảy múa';
	@override String get unifiedVideo => 'Hợp nhất\nVideo';
}

// Path: templates
class _Translations$templates$vi extends Translations$templates$en {
	_Translations$templates$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mẫu';
	@override String get all => 'Tất cả';
	@override String get pro => 'PRO';
}

// Path: settings
class _Translations$settings$vi extends Translations$settings$en {
	_Translations$settings$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cài đặt';
	@override String get language => 'Ngôn ngữ';
	@override String get termsOfService => 'Điều khoản dịch vụ';
	@override String get privacyPolicy => 'Chính sách bảo mật';
	@override String get contactUs => 'Liên hệ với chúng tôi';
	@override String get version => 'Phiên bản';
	@override String get myCredits => 'Điểm tín dụng';
	@override String get rateApp => 'Đánh giá ứng dụng';
	@override String get userCode => 'Mã người dùng';
	@override String get copied => 'Đã sao chép vào bộ nhớ tạm!';
	@override String get termsOfUse => 'Điều khoản sử dụng';
}

// Path: language
class _Translations$language$vi extends Translations$language$en {
	_Translations$language$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ngôn ngữ';
	@override String get en => 'Tiếng Anh';
	@override String get ar => 'Tiếng Ả Rập';
	@override String get de => 'Tiếng Đức';
	@override String get es => 'Tiếng Tây Ban Nha';
	@override String get fr => 'Tiếng Pháp';
	@override String get hi => 'Tiếng Hindi';
	@override String get id => 'Tiếng Indonesia';
	@override String get ja => 'Tiếng Nhật';
	@override String get ko => 'Tiếng Hàn';
	@override String get pt => 'Tiếng Bồ Đào Nha';
	@override String get vi => 'Tiếng Việt';
	@override String get zh => 'Tiếng Trung';
}

// Path: premium
class _Translations$premium$vi extends Translations$premium$en {
	_Translations$premium$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => 'Chạm để Mở khóa';
	@override String get weekly => 'Hàng tuần';
	@override String get weekly_desc => '7 ngày truy cập không giới hạn, sau đó 249.000đ/tuần';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/tuần';
	@override String get annually => 'Hàng năm';
	@override String get annually_desc => 'Chỉ 24.980đ/tuần';
	@override String get annually_price => '1.299.000 đ';
	@override String get annually_suffix => '/năm';
	@override String get best_value => 'Tốt nhất';
	@override String get save_80 => 'Tiết kiệm 80%';
	@override String get start_free_trial => 'Bắt đầu Dùng thử Miễn phí';
	@override String get start_my_subscription => 'Bắt đầu Đăng ký';
	@override String get auto_renewable => 'Tự động Gia hạn. Hủy bất kỳ lúc nào.';
	@override String get privacy_policy => 'Chính sách Bảo mật';
	@override String get terms_of_use => 'Điều khoản Sử dụng';
	@override String get restore => 'Khôi phục';
	@override String get unlock_templates => 'Mở khóa hơn 200 Mẫu';
	@override String get fast_generation => 'Tạo Video Nhanh chóng';
	@override String get discount_packs => 'Giảm giá 50% Gói Tín dụng';
	@override String get videos_per_year => '80 Video Mỗi Năm';
	@override String get buy_more_credit => 'Mua thêm Tín dụng';
	@override String get credit_desc => '35 Tín dụng tạo được 1 video. Không có quảng cáo khi dùng tín dụng đã mua.';
	@override String get credit_70 => '70 Tín dụng';
	@override String get credit_150 => '150 Tín dụng';
	@override String get credit_350 => '350 Tín dụng';
	@override String get credit_500 => '500 Tín dụng';
	@override String get credit_1000 => '1.000 Tín dụng';
	@override String get credit_6000 => '6.000 Tín dụng';
	@override String approx_videos({required Object count}) => '(~ ${count} video)';
	@override String get price_70 => '149.000 đ';
	@override String get price_150 => '299.000 đ';
	@override String get price_350 => '599.000 đ';
	@override String get price_500 => '799.000 đ';
	@override String get price_1000 => '1.499.000 đ';
	@override String get price_6000 => '5.999.000 đ';
	@override String get most_popular => 'Phổ biến Nhất';
	@override String purchase_success({required Object item}) => 'Mua thành công: ${item}';
	@override String get purchase_failed => 'Mua thất bại.';
	@override String get credit_packages => 'Gói Tín dụng';
	@override String get buy_credit_now => 'Mua Tín dụng Ngay';
	@override String get pro_title => 'PRO';
	@override String get discount_title => 'GIẢM 50%';
	@override String get discount_subtitle => 'GIÁ TÍN DỤNG';
}

// Path: video_player
class _Translations$video_player$vi extends Translations$video_player$en {
	_Translations$video_player$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get play => 'Phát';
	@override String get pause => 'Tạm dừng';
	@override String get error_loading => 'Không thể tải video.';
	@override String get retry => 'Thử lại';
	@override String get buffering => 'Đang tải...';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$vi extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chào mừng đến với Video AI';
	@override String get subtitle => 'Hành trình sáng tạo của bạn bắt đầu tại đây...';
	@override String get button => 'Bắt đầu';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$vi extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hình ảnh sang Video';
	@override String get subtitle => 'Tải ảnh lên, viết mô tả';
	@override String get button => 'Tiếp tục';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$vi extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => '2 Hình ảnh sang Video';
	@override String get subtitle => 'Tải 2 ảnh lên, viết mô tả';
	@override String get button => 'Tiếp tục';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$vi extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hình ảnh Khiêu vũ';
	@override String get subtitle => 'Tải lên 1 Video, 1 Ảnh';
	@override String get button => 'Tiếp tục';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$vi extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video Hợp nhất';
	@override String get subtitle => 'Tải ảnh của bạn lên';
	@override String get button => 'Tiếp tục';
}

/// The flat map containing all translations for locale <vi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsVi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'Xem tất cả',
			'common.stay' => 'Ở lại',
			'common.leave' => 'Rời đi',
			'common.camera' => 'Máy ảnh',
			'common.gallery' => 'Thư viện',
			'common.generate' => 'Tạo video',
			'home.title' => 'Video AI',
			'home.trending' => 'Xu hướng',
			'home.new_section' => 'Mới',
			'home.toy_box' => 'Hộp đồ chơi',
			'home.epic_morph' => 'Biến hình đỉnh cao',
			'home.anime' => 'Hoạt hình',
			'home.discover' => 'Khám phá',
			'create.selfie_aquaman' => 'Ảnh tự sướng Aquaman',
			'create.tap_upload' => 'Chạm vào đây để tải ảnh lên.',
			'create.select_upload_title' => 'Chọn phương thức tải ảnh',
			'create.upload_image' => 'Tải ảnh lên',
			'create.custom_prompt' => 'Mô tả tùy chỉnh',
			'create.prompt_placeholder' => 'Chân dung nữ chân thực, cận cảnh, nhìn vào máy ảnh, nháy mắt tự nhiên, ánh sáng studio xanh, điện ảnh, siêu chi tiết',
			'create.inspire_me' => 'Gợi ý cho tôi',
			'create.video_settings' => 'Cài đặt video',
			'create.quality' => 'Chất lượng',
			'create.quality_desc' => 'Chọn chất lượng video',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Thời lượng',
			'create.duration_desc' => 'Chọn độ dài video',
			'create.sec_4s' => '4s',
			'create.sec_8s' => '8s',
			'create.sec_5s' => '5s',
			'create.sec_10s' => '10s',
			'create.sec_15s' => '15s',
			'create.generate_title' => 'Tạo video',
			'create.upload_first_photo' => 'Tải lên ảnh đầu tiên.',
			'create.upload_last_photo' => 'Tải lên ảnh cuối cùng.',
			'create.upload_video_slot' => 'Tải lên Video.',
			'create.upload_photo_slot' => 'Tải lên ảnh.',
			'create.photo_slot_num' => ({required Object num}) => 'Ảnh ${num}',
			'create.required_label' => 'Bắt buộc',
			'create.optional_label' => 'Tùy chọn',
			'create.inspire_me_count' => ({required Object count}) => 'Gợi ý prompt (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'Đang tạo video của bạn...',
			'create.select_mock_media' => 'Chọn file mẫu',
			'create.select_media_desc' => 'Chọn một file mẫu để mô phỏng tải lên',
			'leave_dialog.title' => 'Rời đi không lưu?',
			'leave_dialog.desc' => 'Bạn muốn tiếp tục chỉnh sửa hay rời đi ngay bây giờ?',
			'splash.appName' => 'Video AI',
			'onboarding.page1.title' => 'Chào mừng đến với Video AI',
			'onboarding.page1.subtitle' => 'Hành trình sáng tạo của bạn bắt đầu tại đây...',
			'onboarding.page1.button' => 'Bắt đầu',
			'onboarding.page2.title' => 'Hình ảnh sang Video',
			'onboarding.page2.subtitle' => 'Tải ảnh lên, viết mô tả',
			'onboarding.page2.button' => 'Tiếp tục',
			'onboarding.page3.title' => '2 Hình ảnh sang Video',
			'onboarding.page3.subtitle' => 'Tải 2 ảnh lên, viết mô tả',
			'onboarding.page3.button' => 'Tiếp tục',
			'onboarding.page4.title' => 'Hình ảnh Khiêu vũ',
			'onboarding.page4.subtitle' => 'Tải lên 1 Video, 1 Ảnh',
			'onboarding.page4.button' => 'Tiếp tục',
			'onboarding.page5.title' => 'Video Hợp nhất',
			'onboarding.page5.subtitle' => 'Tải ảnh của bạn lên',
			'onboarding.page5.button' => 'Tiếp tục',
			'dashboard.home' => 'Trang chủ',
			'dashboard.user' => 'Tôi',
			'dashboard.createVideo' => 'Tạo Video',
			'profile.title' => 'Hồ sơ',
			'profile.upgradeTitle' => 'Nâng cấp Premium',
			'profile.upgradeSubtitle' => 'Thêm Credits - Không đóng dấu',
			'profile.goPremium' => 'Lên Premium',
			'profile.myVideo' => 'Video của tôi',
			'profile.liked' => 'Đã thích',
			'profile.noVideos' => 'Chưa có video',
			'profile.noVideosDesc' => 'Hãy tạo video AI đầu tiên của bạn để nó xuất hiện tại đây.',
			'profile.deleteTitle' => 'Xóa video này?',
			'profile.deleteDesc' => 'Bạn có chắc chắn muốn xóa video này không? Hành động này không thể hoàn tác.',
			'profile.cancel' => 'Hủy',
			'profile.delete' => 'Xóa',
			'profile.generating' => 'Đang tạo...',
			'profile.imageGeneration' => 'Tạo hình ảnh',
			'home_new.welcomeToAppName' => 'Chào mừng đến với Video AI',
			'home_new.imageToVideo' => 'Ảnh sang\nVideo',
			'home_new.transitionVideo' => 'Video\nChuyển cảnh',
			'home_new.imageToDance' => 'Ảnh sang\nNhảy múa',
			'home_new.unifiedVideo' => 'Hợp nhất\nVideo',
			'templates.title' => 'Mẫu',
			'templates.all' => 'Tất cả',
			'templates.pro' => 'PRO',
			'settings.title' => 'Cài đặt',
			'settings.language' => 'Ngôn ngữ',
			'settings.termsOfService' => 'Điều khoản dịch vụ',
			'settings.privacyPolicy' => 'Chính sách bảo mật',
			'settings.contactUs' => 'Liên hệ với chúng tôi',
			'settings.version' => 'Phiên bản',
			'settings.myCredits' => 'Điểm tín dụng',
			'settings.rateApp' => 'Đánh giá ứng dụng',
			'settings.userCode' => 'Mã người dùng',
			'settings.copied' => 'Đã sao chép vào bộ nhớ tạm!',
			'settings.termsOfUse' => 'Điều khoản sử dụng',
			'language.title' => 'Ngôn ngữ',
			'language.en' => 'Tiếng Anh',
			'language.ar' => 'Tiếng Ả Rập',
			'language.de' => 'Tiếng Đức',
			'language.es' => 'Tiếng Tây Ban Nha',
			'language.fr' => 'Tiếng Pháp',
			'language.hi' => 'Tiếng Hindi',
			'language.id' => 'Tiếng Indonesia',
			'language.ja' => 'Tiếng Nhật',
			'language.ko' => 'Tiếng Hàn',
			'language.pt' => 'Tiếng Bồ Đào Nha',
			'language.vi' => 'Tiếng Việt',
			'language.zh' => 'Tiếng Trung',
			'premium.tap_to_reveal' => 'Chạm để Mở khóa',
			'premium.weekly' => 'Hàng tuần',
			'premium.weekly_desc' => '7 ngày truy cập không giới hạn, sau đó 249.000đ/tuần',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/tuần',
			'premium.annually' => 'Hàng năm',
			'premium.annually_desc' => 'Chỉ 24.980đ/tuần',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/năm',
			'premium.best_value' => 'Tốt nhất',
			'premium.save_80' => 'Tiết kiệm 80%',
			'premium.start_free_trial' => 'Bắt đầu Dùng thử Miễn phí',
			'premium.start_my_subscription' => 'Bắt đầu Đăng ký',
			'premium.auto_renewable' => 'Tự động Gia hạn. Hủy bất kỳ lúc nào.',
			'premium.privacy_policy' => 'Chính sách Bảo mật',
			'premium.terms_of_use' => 'Điều khoản Sử dụng',
			'premium.restore' => 'Khôi phục',
			'premium.unlock_templates' => 'Mở khóa hơn 200 Mẫu',
			'premium.fast_generation' => 'Tạo Video Nhanh chóng',
			'premium.discount_packs' => 'Giảm giá 50% Gói Tín dụng',
			'premium.videos_per_year' => '80 Video Mỗi Năm',
			'premium.buy_more_credit' => 'Mua thêm Tín dụng',
			'premium.credit_desc' => '35 Tín dụng tạo được 1 video. Không có quảng cáo khi dùng tín dụng đã mua.',
			'premium.credit_70' => '70 Tín dụng',
			'premium.credit_150' => '150 Tín dụng',
			'premium.credit_350' => '350 Tín dụng',
			'premium.credit_500' => '500 Tín dụng',
			'premium.credit_1000' => '1.000 Tín dụng',
			'premium.credit_6000' => '6.000 Tín dụng',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} video)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => 'Phổ biến Nhất',
			'premium.purchase_success' => ({required Object item}) => 'Mua thành công: ${item}',
			'premium.purchase_failed' => 'Mua thất bại.',
			'premium.credit_packages' => 'Gói Tín dụng',
			'premium.buy_credit_now' => 'Mua Tín dụng Ngay',
			'premium.pro_title' => 'PRO',
			'premium.discount_title' => 'GIẢM 50%',
			'premium.discount_subtitle' => 'GIÁ TÍN DỤNG',
			'video_player.play' => 'Phát',
			'video_player.pause' => 'Tạm dừng',
			'video_player.error_loading' => 'Không thể tải video.',
			'video_player.retry' => 'Thử lại',
			'video_player.buffering' => 'Đang tải...',
			_ => null,
		};
	}
}
