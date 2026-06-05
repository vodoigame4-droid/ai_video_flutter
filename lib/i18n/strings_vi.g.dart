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
	@override late final _Translations$generating$vi generating = _Translations$generating$vi._(_root);
	@override late final _Translations$result$vi result = _Translations$result$vi._(_root);
	@override late final _Translations$privacy_dialog$vi privacy_dialog = _Translations$privacy_dialog$vi._(_root);
	@override late final _Translations$report_dialog$vi report_dialog = _Translations$report_dialog$vi._(_root);
	@override late final _Translations$tips_sheet$vi tips_sheet = _Translations$tips_sheet$vi._(_root);
	@override late final _Translations$errors$vi errors = _Translations$errors$vi._(_root);
	@override late final _Translations$guide$vi guide = _Translations$guide$vi._(_root);
	@override late final _Translations$checkin$vi checkin = _Translations$checkin$vi._(_root);
	@override late final _Translations$connectivity$vi connectivity = _Translations$connectivity$vi._(_root);
	@override late final _Translations$notification$vi notification = _Translations$notification$vi._(_root);
	@override late final _Translations$rating_dialog$vi rating_dialog = _Translations$rating_dialog$vi._(_root);
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
	@override String get processing => 'Đang xử lý...';
	@override String get ok => 'OK';
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
	@override String get tap_upload => 'Tải ảnh của bạn lên và tạo video AI chỉ trong vài giây.';
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
	@override String get inspiring => 'AI đang suy nghĩ...';
	@override String get limit_dialog_title => 'Hết lượt gợi ý miễn phí';
	@override String get limit_dialog_desc => 'Bạn đã sử dụng hết 3 lượt gợi ý miễn phí. Vui lòng nâng cấp lên VIP để nhận gợi ý không giới hạn!';
	@override String get limit_dialog_btn => 'Nâng cấp VIP';
	@override String get limit_dialog_cancel => 'Để sau';
	@override String get inspire_me_pro => 'Gợi ý cho tôi (PRO)';
	@override String get trim_title => 'Cắt video';
	@override String get trim_save => 'Lưu';
	@override String get trimming_loading => 'Đang cắt video...';
	@override String get please_add_image_first => 'Vui lòng thêm ảnh vào trước';
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
	@override String get claim_discount => 'Nhận ưu đãi';
	@override String get no_thanks => 'Không, cảm ơn';
	@override String get buy_now => 'Mua ngay';
	@override String get sub_discount_banner => 'GIẢM ĐẾN 50% KHI ĐĂNG KÝ THÀNH VIÊN';
	@override String get unlock_premium_desc => 'Mở khóa toàn bộ tính năng cao cấp với ưu đãi đặc biệt';
	@override String get credit_5000 => '5.000 Tín dụng';
	@override String get price_5000 => '5.999.000 đ';
	@override String get itunes_disclaimer => 'Nếu bạn đăng ký, thanh toán sẽ được tính vào tài khoản iTunes của bạn sau khi xác nhận mua. Đăng ký của bạn sẽ tự động gia hạn trừ khi bị hủy ít nhất 24 giờ trước khi kết thúc kỳ thanh toán hiện tại. Tự động gia hạn có thể được quản lý bất kỳ lúc nào trong cài đặt tài khoản iTunes Store.';
	@override String get buy_credit => 'Mua Tín dụng';
	@override String save_up_to({required Object percent}) => 'Tiết kiệm đến ${percent}%';
	@override String get discount_price => '799.000';
	@override String get discount_price_suffix => '/năm';
	@override String get billed_yearly => 'Thanh toán 799.000đ/năm - Hủy bất cứ lúc nào';
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

// Path: generating
class _Translations$generating$vi extends Translations$generating$en {
	_Translations$generating$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Đang khởi tạo';
	@override String get your_video => 'video của bạn';
	@override String get desc => 'Quá trình này có thể mất vài phút.\nVui lòng đợi...';
	@override String get notify_me => 'Thông báo cho tôi khi hoàn tất';
	@override String get notified => 'Chúng tôi sẽ thông báo khi video của bạn sẵn sàng!';
	@override String get notification_denied => 'Quyền thông báo bị từ chối. Vui lòng bật lại trong Cài đặt.';
	@override String get failed => 'Không thể tạo video. Vui lòng thử lại.';
}

// Path: result
class _Translations$result$vi extends Translations$result$en {
	_Translations$result$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video kết quả';
	@override String ready_message({required Object title}) => 'Video ${title} của bạn đã sẵn sàng!';
	@override String get regenerate => 'Tạo lại';
	@override String get create_another => 'Tạo một video khác';
	@override String get share => 'Chia sẻ';
	@override String get download => 'Tải xuống';
	@override String get extend_video => 'Mở rộng video';
	@override String get extends_title => 'Mở rộng';
	@override String get delete => 'Xóa';
	@override String get share_success => 'Đã sao chép liên kết video để chia sẻ';
	@override String get download_success => 'Đã lưu video vào thư viện';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$vi extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quyền riêng tư dữ liệu';
	@override String get desc => 'Ảnh của bạn được xử lý an toàn bởi hệ thống AI nội bộ của chúng tôi. Chúng tôi không chia sẻ, bán hoặc tiết lộ thông tin của bạn cho bất kỳ bên thứ ba nào.';
	@override String get cancel => 'Hủy bỏ';
	@override String get confirm => 'Xác nhận';
}

// Path: report_dialog
class _Translations$report_dialog$vi extends Translations$report_dialog$en {
	_Translations$report_dialog$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Báo cáo';
	@override String get desc => 'Bạn có chắc chắn muốn gửi báo cáo không?';
	@override String get cancel => 'Hủy bỏ';
	@override String get submit => 'Gửi';
	@override String get success => 'Báo cáo video thành công';
	@override String get bottom_sheet_title => 'Báo cáo video';
	@override String get option_offensive => 'Nội dung phản cảm hoặc không phù hợp';
	@override String get option_quality => 'Chất lượng kém hoặc biến dạng khuôn mặt';
	@override String get option_copyright => 'Vi phạm bản quyền';
	@override String get option_bug => 'Lỗi tạo video hoặc crash';
	@override String get option_other => 'Vấn đề khác';
	@override String get thanks_msg => 'Cảm ơn vì đã báo cáo, chúng tôi sẽ xem xét sửa đổi.';
	@override String get hint_other => 'Vui lòng mô tả chi tiết vấn đề...';
}

// Path: tips_sheet
class _Translations$tips_sheet$vi extends Translations$tips_sheet$en {
	_Translations$tips_sheet$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mẹo để có kết quả tốt nhất';
	@override String get button_got_it => 'Tôi đã hiểu!';
	@override String get use_photos => 'Nên dùng ảnh như thế này';
	@override String get avoid_photos => 'Tránh dùng ảnh như thế này';
	@override String get one_person => 'Một người';
	@override String get clear_face => 'Rõ khuôn mặt';
	@override String get half_body => 'Nửa người';
	@override String get hidden_face => 'Bị che khuôn mặt';
	@override String get multiple_people => 'Nhiều người';
	@override String get blurry_photo => 'Ảnh bị mờ';
}

// Path: errors
class _Translations$errors$vi extends Translations$errors$en {
	_Translations$errors$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'Đã xảy ra lỗi không xác định. Vui lòng thử lại sau.';
	@override String get unauthorized => 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.';
	@override String get validation_error => 'Thông tin không hợp lệ. Vui lòng kiểm tra lại.';
	@override String get password_incorrect => 'Mật khẩu không chính xác. Vui lòng thử lại.';
	@override String get account_not_found => 'Không tìm thấy tài khoản.';
	@override String get email_template_already_exists => 'Mẫu email đã tồn tại.';
	@override String get email_template_not_found => 'Không tìm thấy mẫu email.';
	@override String get account_email_limit_register => 'Email này đã đạt giới hạn đăng ký.';
	@override String get account_username_is_exist => 'Tên đăng nhập đã được sử dụng.';
	@override String get token_invalid => 'Phiên làm việc không hợp lệ. Vui lòng đăng nhập lại.';
	@override String get already_enable_2fa => 'Bảo mật 2 lớp đã được bật.';
	@override String get account_are_not_enable_2fa => 'Tài khoản chưa bật bảo mật 2 lớp.';
	@override String get ref_account_not_found => 'Không tìm thấy tài khoản người giới thiệu.';
	@override String get account_already_vip => 'Tài khoản đã là VIP.';
	@override String get perm_not_found => 'Không tìm thấy quyền hạn.';
	@override String get account_register_not_found => 'Không tìm thấy thông tin đăng ký.';
	@override String get otp_invalid => 'Mã OTP không hợp lệ. Vui lòng kiểm tra lại.';
	@override String get otp_expired => 'Mã OTP đã hết hạn. Vui lòng yêu cầu mã mới.';
	@override String get otp_to_many_request => 'Quá nhiều yêu cầu. Vui lòng đợi trước khi thử lại.';
	@override String get account_info_not_found => 'Không tìm thấy thông tin tài khoản.';
	@override String get account_info_already_created => 'Thông tin tài khoản đã được tạo.';
	@override String get id_number_already_in_use => 'Số ID đã được sử dụng.';
	@override String get account_info_can_not_update => 'Không thể cập nhật thông tin tài khoản.';
	@override String get account_profile_is_processed => 'Thông tin cá nhân đang được xử lý.';
	@override String get insufficient_fund => 'Không đủ tiền hoặc số dư tín dụng.';
	@override String get account_email_is_exist => 'Email đã được đăng ký sử dụng.';
	@override String get proxy_error => 'Lỗi kết nối proxy.';
	@override String get invalid_file_type => 'Định dạng file không hợp lệ. Vui lòng dùng định dạng hỗ trợ.';
	@override String get file_too_large => 'Kích thước file vượt quá giới hạn 20MB.';
	@override String get account_banned => 'Tài khoản của bạn đã bị khóa.';
	@override String get login_failed => 'Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin.';
	@override String get error_code => 'Mã xác thực không hợp lệ.';
	@override String get user_not_found => 'Không tìm thấy người dùng.';
	@override String get user_used_invite_code => 'Mã giới thiệu đã được sử dụng.';
	@override String get get_me_failed => 'Tải thông tin cá nhân thất bại.';
	@override String get user_cannot_use_own_invite_code => 'Bạn không thể sử dụng mã giới thiệu của chính mình.';
	@override String get file_not_found => 'Không tìm thấy file.';
	@override String get file_upload_failed => 'Tải file lên thất bại. Vui lòng thử lại.';
	@override String get upload_webp_failed => 'Tải file WEBP lên thất bại.';
	@override String get create_theme_failed => 'Tạo chủ đề thất bại.';
	@override String get get_theme_failed => 'Không thể lấy thông tin chủ đề.';
	@override String get category_already_exists => 'Danh mục đã tồn tại.';
	@override String get create_category_failed => 'Tạo danh mục thất bại.';
	@override String get invalid_ratio => 'Tỷ lệ video không hợp lệ.';
	@override String get create_media_failed => 'Không thể khởi tạo quá trình tạo video.';
	@override String get media_not_found => 'Không tìm thấy file video hoặc ảnh.';
	@override String get callback_media_failed => 'Xử lý phản hồi media thất bại.';
	@override String get get_media_detail_failed => 'Không thể lấy thông tin chi tiết video.';
	@override String get get_media_failed => 'Không thể tải danh sách media.';
	@override String get update_theme_failed => 'Cập nhật chủ đề thất bại.';
	@override String get delete_theme_failed => 'Xóa chủ đề thất bại.';
	@override String get category_not_found => 'Không tìm thấy danh mục.';
	@override String get delete_category_failed => 'Xóa danh mục thất bại.';
	@override String get media_not_owned => 'Bạn không sở hữu tệp tin này.';
	@override String get theme_already_exists => 'Chủ đề đã tồn tại.';
	@override String get like_media_failed => 'Không thể cập nhật trạng thái yêu thích.';
	@override String get user_not_vip => 'Tính năng này yêu cầu đăng ký VIP.';
	@override String get not_enough_credit => 'Không đủ tín dụng. Vui lòng mua thêm credit.';
	@override String get create_photo_enhance_failed => 'Nâng cấp chất lượng ảnh thất bại.';
	@override String get remove_object_failed => 'Xóa vật thể khỏi ảnh thất bại.';
	@override String get get_suggestion_prompt_failed => 'Không thể tạo gợi ý mô tả.';
	@override String get not_enough_suggestion_free => 'Không đủ lượt gợi ý miễn phí, vui lòng nâng cấp lên VIP';
	@override String get get_tasks_failed => 'Không thể tải danh sách nhiệm vụ.';
	@override String get action_task_failed => 'Thực hiện nhiệm vụ thất bại.';
	@override String get task_not_found => 'Không tìm thấy nhiệm vụ.';
	@override String get task_already_claimed => 'Phần thưởng nhiệm vụ đã được nhận.';
	@override String get task_already_started => 'Nhiệm vụ đã được bắt đầu trước đó.';
	@override String get task_not_completed => 'Nhiệm vụ chưa được hoàn thành.';
	@override String get rate_app_failed => 'Đánh giá ứng dụng thất bại.';
	@override String get daily_login_task_not_found => 'Không tìm thấy nhiệm vụ điểm danh.';
	@override String get get_daily_login_failed => 'Tải nhiệm vụ điểm danh thất bại.';
	@override String get today_login_reward_already_claimed => 'Phần thưởng điểm danh hôm nay đã được nhận.';
	@override String get take_login_reward_failed => 'Nhận phần thưởng điểm danh thất bại.';
	@override String get iap_receipt_already_exists => 'Hóa đơn mua hàng đã được đăng ký trước đó.';
	@override String get iap_verify_product_failed => 'Xác minh sản phẩm mua hàng thất bại.';
	@override String get iap_product_not_purchased => 'Sản phẩm chưa được mua hàng.';
	@override String get iap_product_not_found => 'Không tìm thấy sản phẩm mua hàng.';
	@override String get iap_subscription_not_active => 'Gói đăng ký hiện không hoạt động.';
	@override String get iap_subscription_already_acknowledged => 'Gói đăng ký đã được xác nhận trước đó.';
	@override String get iap_verify_subscription_failed => 'Xác minh gói đăng ký thất bại.';
	@override String get refill_subscription_credits_failed => 'Nạp lại credit gói đăng ký thất bại.';
	@override String get cancel_subscription_failed => 'Hủy gói đăng ký thất bại.';
	@override String get plan_not_found => 'Không tìm thấy gói dịch vụ.';
	@override String get transaction_action_failed => 'Giao dịch thất bại.';
	@override String get iap_verify_ios_product_failed => 'Xác minh mua hàng iOS thất bại.';
	@override String get iap_subscription_invalid_type => 'Loại gói đăng ký không hợp lệ.';
	@override String get subscription_not_active_for_refill => 'Gói đăng ký không hoạt động để nạp lại credit.';
	@override String get get_price_list_failed => 'Không thể tải danh sách giá credit.';
	@override String get iap_receipt_not_found => 'Không tìm thấy hóa đơn mua hàng.';
	@override String get iap_subscription_not_found => 'Không tìm thấy thông tin gói đăng ký.';
	@override String get video_too_long => 'Video phải ngắn hơn 10 giây.';
}

// Path: guide
class _Translations$guide$vi extends Translations$guide$en {
	_Translations$guide$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get step_1 => 'Bước 1';
	@override String get step_2 => 'Bước 2';
	@override String get upload_photo => 'Tải ảnh lên';
	@override String get got_it => 'Đã hiểu!';
	@override String get write_prompt => 'Viết mô tả';
	@override String get upload_2_photos => 'Tải lên 2 ảnh';
	@override String get generate => 'Tạo video';
	@override String get upload_portrait => 'Tải ảnh chân dung';
	@override String get choose_style => 'Chọn phong cách';
	@override String get add_assets => 'Thêm tài nguyên';
}

// Path: checkin
class _Translations$checkin$vi extends Translations$checkin$en {
	_Translations$checkin$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Điểm danh';
	@override String get subtitle => 'Nhận quà mỗi ngày!';
	@override String get today => 'H.nay';
	@override String day({required Object n}) => 'Ngày ${n}';
	@override String get check_in_btn => 'Nhận quà';
	@override String get checked_in => 'Đã nhận quà';
	@override String get daily_bonus_notification => 'Thông báo hàng ngày';
}

// Path: connectivity
class _Translations$connectivity$vi extends Translations$connectivity$en {
	_Translations$connectivity$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get no_internet_title => 'Mất kết nối';
	@override String get no_internet_desc => 'Vui lòng kiểm tra lại kết nối mạng để tiếp tục sử dụng ứng dụng.';
	@override String get retry_button => 'Thử lại kết nối';
}

// Path: notification
class _Translations$notification$vi extends Translations$notification$en {
	_Translations$notification$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get channel_name => 'Thông báo quan trọng';
	@override String get channel_description => 'Kênh này được sử dụng cho các thông báo quan trọng.';
	@override String get checkin_title => 'Nhắc nhở điểm danh hàng ngày 🎁';
	@override String get checkin_body => 'Đến giờ nhận credit miễn phí hàng ngày rồi! Vào app ngay nào.';
	@override String get test_notification => 'Thử';
}

// Path: rating_dialog
class _Translations$rating_dialog$vi extends Translations$rating_dialog$en {
	_Translations$rating_dialog$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bạn thích ứng dụng chứ?';
	@override String get desc => 'Vui lòng đánh giá và giúp chúng tôi cải thiện trải nghiệm của bạn. Cảm ơn bạn!';
	@override String get support_us => 'Hỗ trợ chúng tôi';
	@override String get maybe_later => 'Để sau';
	@override String get success => 'Cảm ơn bạn đã ủng hộ!';
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
			'common.processing' => 'Đang xử lý...',
			'common.ok' => 'OK',
			'home.title' => 'Video AI',
			'home.trending' => 'Xu hướng',
			'home.new_section' => 'Mới',
			'home.toy_box' => 'Hộp đồ chơi',
			'home.epic_morph' => 'Biến hình đỉnh cao',
			'home.anime' => 'Hoạt hình',
			'home.discover' => 'Khám phá',
			'create.selfie_aquaman' => 'Ảnh tự sướng Aquaman',
			'create.tap_upload' => 'Tải ảnh của bạn lên và tạo video AI chỉ trong vài giây.',
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
			'create.inspiring' => 'AI đang suy nghĩ...',
			'create.limit_dialog_title' => 'Hết lượt gợi ý miễn phí',
			'create.limit_dialog_desc' => 'Bạn đã sử dụng hết 3 lượt gợi ý miễn phí. Vui lòng nâng cấp lên VIP để nhận gợi ý không giới hạn!',
			'create.limit_dialog_btn' => 'Nâng cấp VIP',
			'create.limit_dialog_cancel' => 'Để sau',
			'create.inspire_me_pro' => 'Gợi ý cho tôi (PRO)',
			'create.trim_title' => 'Cắt video',
			'create.trim_save' => 'Lưu',
			'create.trimming_loading' => 'Đang cắt video...',
			'create.please_add_image_first' => 'Vui lòng thêm ảnh vào trước',
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
			'premium.claim_discount' => 'Nhận ưu đãi',
			'premium.no_thanks' => 'Không, cảm ơn',
			'premium.buy_now' => 'Mua ngay',
			'premium.sub_discount_banner' => 'GIẢM ĐẾN 50% KHI ĐĂNG KÝ THÀNH VIÊN',
			'premium.unlock_premium_desc' => 'Mở khóa toàn bộ tính năng cao cấp với ưu đãi đặc biệt',
			'premium.credit_5000' => '5.000 Tín dụng',
			'premium.price_5000' => '5.999.000 đ',
			'premium.itunes_disclaimer' => 'Nếu bạn đăng ký, thanh toán sẽ được tính vào tài khoản iTunes của bạn sau khi xác nhận mua. Đăng ký của bạn sẽ tự động gia hạn trừ khi bị hủy ít nhất 24 giờ trước khi kết thúc kỳ thanh toán hiện tại. Tự động gia hạn có thể được quản lý bất kỳ lúc nào trong cài đặt tài khoản iTunes Store.',
			'premium.buy_credit' => 'Mua Tín dụng',
			'premium.save_up_to' => ({required Object percent}) => 'Tiết kiệm đến ${percent}%',
			'premium.discount_price' => '799.000',
			'premium.discount_price_suffix' => '/năm',
			'premium.billed_yearly' => 'Thanh toán 799.000đ/năm - Hủy bất cứ lúc nào',
			'video_player.play' => 'Phát',
			'video_player.pause' => 'Tạm dừng',
			'video_player.error_loading' => 'Không thể tải video.',
			'video_player.retry' => 'Thử lại',
			'video_player.buffering' => 'Đang tải...',
			'generating.title' => 'Đang khởi tạo',
			'generating.your_video' => 'video của bạn',
			'generating.desc' => 'Quá trình này có thể mất vài phút.\nVui lòng đợi...',
			'generating.notify_me' => 'Thông báo cho tôi khi hoàn tất',
			'generating.notified' => 'Chúng tôi sẽ thông báo khi video của bạn sẵn sàng!',
			'generating.notification_denied' => 'Quyền thông báo bị từ chối. Vui lòng bật lại trong Cài đặt.',
			'generating.failed' => 'Không thể tạo video. Vui lòng thử lại.',
			'result.title' => 'Video kết quả',
			'result.ready_message' => ({required Object title}) => 'Video ${title} của bạn đã sẵn sàng!',
			'result.regenerate' => 'Tạo lại',
			'result.create_another' => 'Tạo một video khác',
			'result.share' => 'Chia sẻ',
			'result.download' => 'Tải xuống',
			'result.extend_video' => 'Mở rộng video',
			'result.extends_title' => 'Mở rộng',
			'result.delete' => 'Xóa',
			'result.share_success' => 'Đã sao chép liên kết video để chia sẻ',
			'result.download_success' => 'Đã lưu video vào thư viện',
			'privacy_dialog.title' => 'Quyền riêng tư dữ liệu',
			'privacy_dialog.desc' => 'Ảnh của bạn được xử lý an toàn bởi hệ thống AI nội bộ của chúng tôi. Chúng tôi không chia sẻ, bán hoặc tiết lộ thông tin của bạn cho bất kỳ bên thứ ba nào.',
			'privacy_dialog.cancel' => 'Hủy bỏ',
			'privacy_dialog.confirm' => 'Xác nhận',
			'report_dialog.title' => 'Báo cáo',
			'report_dialog.desc' => 'Bạn có chắc chắn muốn gửi báo cáo không?',
			'report_dialog.cancel' => 'Hủy bỏ',
			'report_dialog.submit' => 'Gửi',
			'report_dialog.success' => 'Báo cáo video thành công',
			'report_dialog.bottom_sheet_title' => 'Báo cáo video',
			'report_dialog.option_offensive' => 'Nội dung phản cảm hoặc không phù hợp',
			'report_dialog.option_quality' => 'Chất lượng kém hoặc biến dạng khuôn mặt',
			'report_dialog.option_copyright' => 'Vi phạm bản quyền',
			'report_dialog.option_bug' => 'Lỗi tạo video hoặc crash',
			'report_dialog.option_other' => 'Vấn đề khác',
			'report_dialog.thanks_msg' => 'Cảm ơn vì đã báo cáo, chúng tôi sẽ xem xét sửa đổi.',
			'report_dialog.hint_other' => 'Vui lòng mô tả chi tiết vấn đề...',
			'tips_sheet.title' => 'Mẹo để có kết quả tốt nhất',
			'tips_sheet.button_got_it' => 'Tôi đã hiểu!',
			'tips_sheet.use_photos' => 'Nên dùng ảnh như thế này',
			'tips_sheet.avoid_photos' => 'Tránh dùng ảnh như thế này',
			'tips_sheet.one_person' => 'Một người',
			'tips_sheet.clear_face' => 'Rõ khuôn mặt',
			'tips_sheet.half_body' => 'Nửa người',
			'tips_sheet.hidden_face' => 'Bị che khuôn mặt',
			'tips_sheet.multiple_people' => 'Nhiều người',
			'tips_sheet.blurry_photo' => 'Ảnh bị mờ',
			'errors.unknown' => 'Đã xảy ra lỗi không xác định. Vui lòng thử lại sau.',
			'errors.unauthorized' => 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
			'errors.validation_error' => 'Thông tin không hợp lệ. Vui lòng kiểm tra lại.',
			'errors.password_incorrect' => 'Mật khẩu không chính xác. Vui lòng thử lại.',
			'errors.account_not_found' => 'Không tìm thấy tài khoản.',
			'errors.email_template_already_exists' => 'Mẫu email đã tồn tại.',
			'errors.email_template_not_found' => 'Không tìm thấy mẫu email.',
			'errors.account_email_limit_register' => 'Email này đã đạt giới hạn đăng ký.',
			'errors.account_username_is_exist' => 'Tên đăng nhập đã được sử dụng.',
			'errors.token_invalid' => 'Phiên làm việc không hợp lệ. Vui lòng đăng nhập lại.',
			'errors.already_enable_2fa' => 'Bảo mật 2 lớp đã được bật.',
			'errors.account_are_not_enable_2fa' => 'Tài khoản chưa bật bảo mật 2 lớp.',
			'errors.ref_account_not_found' => 'Không tìm thấy tài khoản người giới thiệu.',
			'errors.account_already_vip' => 'Tài khoản đã là VIP.',
			'errors.perm_not_found' => 'Không tìm thấy quyền hạn.',
			'errors.account_register_not_found' => 'Không tìm thấy thông tin đăng ký.',
			'errors.otp_invalid' => 'Mã OTP không hợp lệ. Vui lòng kiểm tra lại.',
			'errors.otp_expired' => 'Mã OTP đã hết hạn. Vui lòng yêu cầu mã mới.',
			'errors.otp_to_many_request' => 'Quá nhiều yêu cầu. Vui lòng đợi trước khi thử lại.',
			'errors.account_info_not_found' => 'Không tìm thấy thông tin tài khoản.',
			'errors.account_info_already_created' => 'Thông tin tài khoản đã được tạo.',
			'errors.id_number_already_in_use' => 'Số ID đã được sử dụng.',
			'errors.account_info_can_not_update' => 'Không thể cập nhật thông tin tài khoản.',
			'errors.account_profile_is_processed' => 'Thông tin cá nhân đang được xử lý.',
			'errors.insufficient_fund' => 'Không đủ tiền hoặc số dư tín dụng.',
			'errors.account_email_is_exist' => 'Email đã được đăng ký sử dụng.',
			'errors.proxy_error' => 'Lỗi kết nối proxy.',
			'errors.invalid_file_type' => 'Định dạng file không hợp lệ. Vui lòng dùng định dạng hỗ trợ.',
			'errors.file_too_large' => 'Kích thước file vượt quá giới hạn 20MB.',
			'errors.account_banned' => 'Tài khoản của bạn đã bị khóa.',
			'errors.login_failed' => 'Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin.',
			'errors.error_code' => 'Mã xác thực không hợp lệ.',
			'errors.user_not_found' => 'Không tìm thấy người dùng.',
			'errors.user_used_invite_code' => 'Mã giới thiệu đã được sử dụng.',
			'errors.get_me_failed' => 'Tải thông tin cá nhân thất bại.',
			'errors.user_cannot_use_own_invite_code' => 'Bạn không thể sử dụng mã giới thiệu của chính mình.',
			'errors.file_not_found' => 'Không tìm thấy file.',
			'errors.file_upload_failed' => 'Tải file lên thất bại. Vui lòng thử lại.',
			'errors.upload_webp_failed' => 'Tải file WEBP lên thất bại.',
			'errors.create_theme_failed' => 'Tạo chủ đề thất bại.',
			'errors.get_theme_failed' => 'Không thể lấy thông tin chủ đề.',
			'errors.category_already_exists' => 'Danh mục đã tồn tại.',
			'errors.create_category_failed' => 'Tạo danh mục thất bại.',
			'errors.invalid_ratio' => 'Tỷ lệ video không hợp lệ.',
			'errors.create_media_failed' => 'Không thể khởi tạo quá trình tạo video.',
			'errors.media_not_found' => 'Không tìm thấy file video hoặc ảnh.',
			'errors.callback_media_failed' => 'Xử lý phản hồi media thất bại.',
			'errors.get_media_detail_failed' => 'Không thể lấy thông tin chi tiết video.',
			'errors.get_media_failed' => 'Không thể tải danh sách media.',
			'errors.update_theme_failed' => 'Cập nhật chủ đề thất bại.',
			'errors.delete_theme_failed' => 'Xóa chủ đề thất bại.',
			'errors.category_not_found' => 'Không tìm thấy danh mục.',
			'errors.delete_category_failed' => 'Xóa danh mục thất bại.',
			'errors.media_not_owned' => 'Bạn không sở hữu tệp tin này.',
			'errors.theme_already_exists' => 'Chủ đề đã tồn tại.',
			'errors.like_media_failed' => 'Không thể cập nhật trạng thái yêu thích.',
			'errors.user_not_vip' => 'Tính năng này yêu cầu đăng ký VIP.',
			'errors.not_enough_credit' => 'Không đủ tín dụng. Vui lòng mua thêm credit.',
			'errors.create_photo_enhance_failed' => 'Nâng cấp chất lượng ảnh thất bại.',
			'errors.remove_object_failed' => 'Xóa vật thể khỏi ảnh thất bại.',
			'errors.get_suggestion_prompt_failed' => 'Không thể tạo gợi ý mô tả.',
			'errors.not_enough_suggestion_free' => 'Không đủ lượt gợi ý miễn phí, vui lòng nâng cấp lên VIP',
			'errors.get_tasks_failed' => 'Không thể tải danh sách nhiệm vụ.',
			'errors.action_task_failed' => 'Thực hiện nhiệm vụ thất bại.',
			'errors.task_not_found' => 'Không tìm thấy nhiệm vụ.',
			'errors.task_already_claimed' => 'Phần thưởng nhiệm vụ đã được nhận.',
			'errors.task_already_started' => 'Nhiệm vụ đã được bắt đầu trước đó.',
			'errors.task_not_completed' => 'Nhiệm vụ chưa được hoàn thành.',
			'errors.rate_app_failed' => 'Đánh giá ứng dụng thất bại.',
			'errors.daily_login_task_not_found' => 'Không tìm thấy nhiệm vụ điểm danh.',
			'errors.get_daily_login_failed' => 'Tải nhiệm vụ điểm danh thất bại.',
			'errors.today_login_reward_already_claimed' => 'Phần thưởng điểm danh hôm nay đã được nhận.',
			'errors.take_login_reward_failed' => 'Nhận phần thưởng điểm danh thất bại.',
			'errors.iap_receipt_already_exists' => 'Hóa đơn mua hàng đã được đăng ký trước đó.',
			'errors.iap_verify_product_failed' => 'Xác minh sản phẩm mua hàng thất bại.',
			'errors.iap_product_not_purchased' => 'Sản phẩm chưa được mua hàng.',
			'errors.iap_product_not_found' => 'Không tìm thấy sản phẩm mua hàng.',
			'errors.iap_subscription_not_active' => 'Gói đăng ký hiện không hoạt động.',
			'errors.iap_subscription_already_acknowledged' => 'Gói đăng ký đã được xác nhận trước đó.',
			'errors.iap_verify_subscription_failed' => 'Xác minh gói đăng ký thất bại.',
			'errors.refill_subscription_credits_failed' => 'Nạp lại credit gói đăng ký thất bại.',
			'errors.cancel_subscription_failed' => 'Hủy gói đăng ký thất bại.',
			'errors.plan_not_found' => 'Không tìm thấy gói dịch vụ.',
			'errors.transaction_action_failed' => 'Giao dịch thất bại.',
			'errors.iap_verify_ios_product_failed' => 'Xác minh mua hàng iOS thất bại.',
			'errors.iap_subscription_invalid_type' => 'Loại gói đăng ký không hợp lệ.',
			'errors.subscription_not_active_for_refill' => 'Gói đăng ký không hoạt động để nạp lại credit.',
			'errors.get_price_list_failed' => 'Không thể tải danh sách giá credit.',
			'errors.iap_receipt_not_found' => 'Không tìm thấy hóa đơn mua hàng.',
			'errors.iap_subscription_not_found' => 'Không tìm thấy thông tin gói đăng ký.',
			'errors.video_too_long' => 'Video phải ngắn hơn 10 giây.',
			'guide.step_1' => 'Bước 1',
			'guide.step_2' => 'Bước 2',
			'guide.upload_photo' => 'Tải ảnh lên',
			'guide.got_it' => 'Đã hiểu!',
			'guide.write_prompt' => 'Viết mô tả',
			'guide.upload_2_photos' => 'Tải lên 2 ảnh',
			'guide.generate' => 'Tạo video',
			'guide.upload_portrait' => 'Tải ảnh chân dung',
			'guide.choose_style' => 'Chọn phong cách',
			'guide.add_assets' => 'Thêm tài nguyên',
			'checkin.title' => 'Điểm danh',
			'checkin.subtitle' => 'Nhận quà mỗi ngày!',
			'checkin.today' => 'H.nay',
			'checkin.day' => ({required Object n}) => 'Ngày ${n}',
			'checkin.check_in_btn' => 'Nhận quà',
			'checkin.checked_in' => 'Đã nhận quà',
			'checkin.daily_bonus_notification' => 'Thông báo hàng ngày',
			'connectivity.no_internet_title' => 'Mất kết nối',
			'connectivity.no_internet_desc' => 'Vui lòng kiểm tra lại kết nối mạng để tiếp tục sử dụng ứng dụng.',
			'connectivity.retry_button' => 'Thử lại kết nối',
			'notification.channel_name' => 'Thông báo quan trọng',
			'notification.channel_description' => 'Kênh này được sử dụng cho các thông báo quan trọng.',
			'notification.checkin_title' => 'Nhắc nhở điểm danh hàng ngày 🎁',
			'notification.checkin_body' => 'Đến giờ nhận credit miễn phí hàng ngày rồi! Vào app ngay nào.',
			'notification.test_notification' => 'Thử',
			'rating_dialog.title' => 'Bạn thích ứng dụng chứ?',
			'rating_dialog.desc' => 'Vui lòng đánh giá và giúp chúng tôi cải thiện trải nghiệm của bạn. Cảm ơn bạn!',
			'rating_dialog.support_us' => 'Hỗ trợ chúng tôi',
			'rating_dialog.maybe_later' => 'Để sau',
			'rating_dialog.success' => 'Cảm ơn bạn đã ủng hộ!',
			_ => null,
		};
	}
}
