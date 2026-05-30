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
class TranslationsKo extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$ko common = _Translations$common$ko._(_root);
	@override late final _Translations$home$ko home = _Translations$home$ko._(_root);
	@override late final _Translations$create$ko create = _Translations$create$ko._(_root);
	@override late final _Translations$leave_dialog$ko leave_dialog = _Translations$leave_dialog$ko._(_root);
	@override late final _Translations$splash$ko splash = _Translations$splash$ko._(_root);
	@override late final _Translations$onboarding$ko onboarding = _Translations$onboarding$ko._(_root);
	@override late final _Translations$dashboard$ko dashboard = _Translations$dashboard$ko._(_root);
	@override late final _Translations$profile$ko profile = _Translations$profile$ko._(_root);
	@override late final _Translations$home_new$ko home_new = _Translations$home_new$ko._(_root);
	@override late final _Translations$templates$ko templates = _Translations$templates$ko._(_root);
	@override late final _Translations$settings$ko settings = _Translations$settings$ko._(_root);
	@override late final _Translations$language$ko language = _Translations$language$ko._(_root);
	@override late final _Translations$premium$ko premium = _Translations$premium$ko._(_root);
	@override late final _Translations$generating$ko generating = _Translations$generating$ko._(_root);
	@override late final _Translations$result$ko result = _Translations$result$ko._(_root);
	@override late final _Translations$privacy_dialog$ko privacy_dialog = _Translations$privacy_dialog$ko._(_root);
	@override late final _Translations$report_dialog$ko report_dialog = _Translations$report_dialog$ko._(_root);
	@override late final _Translations$tips_sheet$ko tips_sheet = _Translations$tips_sheet$ko._(_root);
	@override late final _Translations$errors$ko errors = _Translations$errors$ko._(_root);
}

// Path: common
class _Translations$common$ko extends Translations$common$en {
	_Translations$common$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => '모두 보기';
	@override String get stay => '머무르기';
	@override String get leave => '나가기';
	@override String get camera => '카메라';
	@override String get gallery => '갤러리';
	@override String get generate => '생성하기';
}

// Path: home
class _Translations$home$ko extends Translations$home$en {
	_Translations$home$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '비디오 AI';
	@override String get trending => '트렌딩';
	@override String get new_section => '새로운';
	@override String get toy_box => '장난감 피규어 박스';
	@override String get epic_morph => '에픽 모프';
	@override String get anime => '애니메이션';
	@override String get discover => '발견';
}

// Path: create
class _Translations$create$ko extends Translations$create$en {
	_Translations$create$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => '셀피 아쿠아맨';
	@override String get tap_upload => '여기를 눌러 사진을 업로드하세요.';
	@override String get select_upload_title => '사진 업로드 방식 선택';
	@override String get upload_image => '이미지 업로드';
	@override String get custom_prompt => '커스텀 프롬프트';
	@override String get prompt_placeholder => '사실적인 여성 초상화, 클로즈업, 카메라 응시, 자연스러운 깜빡임, 블루 스튜디오 조명, 시네마틱, 초고화질';
	@override String get inspire_me => '아이디어 얻기';
	@override String get video_settings => '비디오 설정';
	@override String get quality => '화질';
	@override String get quality_desc => '비디오 화질 선택';
	@override String get hd => 'HD';
	@override String get full_hd => '풀 HD';
	@override String get duration => '길이';
	@override String get duration_desc => '비디오 재생 시간 선택';
	@override String get sec_4s => '4초';
	@override String get sec_8s => '8초';
	@override String get sec_5s => '5초';
	@override String get sec_10s => '10초';
	@override String get sec_15s => '15초';
	@override String get generate_title => '생성하기';
	@override String get upload_first_photo => '첫 번째 사진 업로드.';
	@override String get upload_last_photo => '마지막 사진 업로드.';
	@override String get upload_video_slot => '동영상 업로드.';
	@override String get upload_photo_slot => '사진 업로드.';
	@override String photo_slot_num({required Object num}) => '사진 ${num}';
	@override String get required_label => '필수';
	@override String get optional_label => '선택';
	@override String inspire_me_count({required Object count}) => '영감 주기 (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => '동영상 생성 중...';
	@override String get select_mock_media => '모크 미디어 선택';
	@override String get select_media_desc => '업로드를 시뮬레이션할 모크 파일 선택';
}

// Path: leave_dialog
class _Translations$leave_dialog$ko extends Translations$leave_dialog$en {
	_Translations$leave_dialog$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '저장하지 않고 나갈까요?';
	@override String get desc => '편집을 계속하시겠습니까, 아니면 지금 나가시겠습니까?';
}

// Path: splash
class _Translations$splash$ko extends Translations$splash$en {
	_Translations$splash$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get appName => '비디오 AI';
}

// Path: onboarding
class _Translations$onboarding$ko extends Translations$onboarding$en {
	_Translations$onboarding$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$ko page1 = _Translations$onboarding$page1$ko._(_root);
	@override late final _Translations$onboarding$page2$ko page2 = _Translations$onboarding$page2$ko._(_root);
	@override late final _Translations$onboarding$page3$ko page3 = _Translations$onboarding$page3$ko._(_root);
	@override late final _Translations$onboarding$page4$ko page4 = _Translations$onboarding$page4$ko._(_root);
	@override late final _Translations$onboarding$page5$ko page5 = _Translations$onboarding$page5$ko._(_root);
}

// Path: dashboard
class _Translations$dashboard$ko extends Translations$dashboard$en {
	_Translations$dashboard$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get home => '홈';
	@override String get user => '프로필';
	@override String get createVideo => '비디오 생성';
}

// Path: profile
class _Translations$profile$ko extends Translations$profile$en {
	_Translations$profile$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '프로필';
	@override String get upgradeTitle => '프리미엄 업그레이드';
	@override String get upgradeSubtitle => '크레딧 추가 - 워터마크 없음';
	@override String get goPremium => '프리미엄 가입';
	@override String get myVideo => '내 비디오';
	@override String get liked => '좋아요';
	@override String get noVideos => '아직 동영상이 없습니다';
	@override String get noVideosDesc => '첫 번째 AI 비디오를 만들면 여기에 표시됩니다.';
	@override String get deleteTitle => '이 동영상을 삭제하시겠습니까?';
	@override String get deleteDesc => '이 동영상을 정말로 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';
	@override String get cancel => '취소';
	@override String get delete => '삭제';
	@override String get generating => '생성 중...';
	@override String get imageGeneration => '이미지 생성';
}

// Path: home_new
class _Translations$home_new$ko extends Translations$home_new$en {
	_Translations$home_new$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => '비디오 AI에 오신 것을 환영합니다';
	@override String get imageToVideo => '이미지를\n비디오로';
	@override String get transitionVideo => '트랜지션\n비디오';
	@override String get imageToDance => '이미지를\n댄스로';
	@override String get unifiedVideo => '통합\n비디오';
}

// Path: templates
class _Translations$templates$ko extends Translations$templates$en {
	_Translations$templates$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '템플릿';
	@override String get all => '전체';
	@override String get pro => '프로';
}

// Path: settings
class _Translations$settings$ko extends Translations$settings$en {
	_Translations$settings$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '설정';
	@override String get language => '언어';
	@override String get termsOfService => '서비스 약관';
	@override String get privacyPolicy => '개인정보 처리방침';
	@override String get contactUs => '문의하기';
	@override String get version => '버전';
	@override String get myCredits => '내 크레딧';
	@override String get rateApp => '앱 평가하기';
	@override String get userCode => '사용자 코드';
	@override String get copied => '클립보드에 복사되었습니다!';
	@override String get termsOfUse => '이용 약관';
}

// Path: language
class _Translations$language$ko extends Translations$language$en {
	_Translations$language$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '언어';
	@override String get en => '영어';
	@override String get ar => '아랍어';
	@override String get de => '독일어';
	@override String get es => '스페인어';
	@override String get fr => '프랑스어';
	@override String get hi => '힌디어';
	@override String get id => '인도네시아어';
	@override String get ja => '일본어';
	@override String get ko => '한국어';
	@override String get pt => '포르투갈어';
	@override String get vi => '베트남어';
	@override String get zh => '중국어';
}

// Path: premium
class _Translations$premium$ko extends Translations$premium$en {
	_Translations$premium$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => '탭하여 잠금 해제';
	@override String get weekly => '주간';
	@override String get weekly_desc => '7일 무료 체험, 이후 249.000đ/주';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/주';
	@override String get annually => '연간';
	@override String get annually_desc => '주당 24.980đ 상당';
	@override String get annually_price => '1.299.000 đ';
	@override String get annually_suffix => '/년';
	@override String get best_value => '최고의 가치';
	@override String get save_80 => '80% 할인';
	@override String get start_free_trial => '무료 체험 시작';
	@override String get start_my_subscription => '구독 시작하기';
	@override String get auto_renewable => '자동 갱신. 언제든지 취소 가능.';
	@override String get privacy_policy => '개인정보 처리방침';
	@override String get terms_of_use => '이용 약관';
	@override String get restore => '구독 복원';
	@override String get unlock_templates => '200개 이상의 템플릿 잠금 해제';
	@override String get fast_generation => '빠른 비디오 생성';
	@override String get discount_packs => '크레딧 팩 50% 할인';
	@override String get videos_per_year => '연간 80개 비디오';
	@override String get buy_more_credit => '크레딧 추가 구매';
	@override String get credit_desc => '35 크레딧으로 비디오 1개 생성. 구매한 크레딧 사용 시 광고 없음.';
	@override String get credit_70 => '70 크레딧';
	@override String get credit_150 => '150 크레딧';
	@override String get credit_350 => '350 크레딧';
	@override String get credit_500 => '500 크레딧';
	@override String get credit_1000 => '1.000 크레딧';
	@override String get credit_6000 => '6.000 크레딧';
	@override String approx_videos({required Object count}) => '(~ ${count}개 비디오)';
	@override String get price_70 => '149.000 đ';
	@override String get price_150 => '299.000 đ';
	@override String get price_350 => '599.000 đ';
	@override String get price_500 => '799.000 đ';
	@override String get price_1000 => '1.499.000 đ';
	@override String get price_6000 => '5.999.000 đ';
	@override String get most_popular => '가장 인기 있음';
	@override String purchase_success({required Object item}) => '구매 완료: ${item}';
	@override String get purchase_failed => '구매 실패.';
	@override String get credit_packages => '크레딧 패키지';
	@override String get buy_credit_now => '지금 크레딧 구매';
	@override String get pro_title => '프로';
	@override String get discount_title => '50% 할인';
	@override String get discount_subtitle => '크레딧 가격';
}

// Path: generating
class _Translations$generating$ko extends Translations$generating$en {
	_Translations$generating$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '생성 중';
	@override String get your_video => '동영상 생성';
	@override String get desc => '몇 분 정도 걸릴 수 있습니다.\n잠시만 기다려 주세요...';
	@override String get notify_me => '완료 시 나에게 알림';
	@override String get notified => '동영상이 준비되면 알려드리겠습니다!';
	@override String get notification_denied => '알림 권한이 거부되었습니다. 설정에서 활성화해주세요.';
	@override String get failed => '비디오 생성에 실패했습니다. 다시 시도해 주세요.';
}

// Path: result
class _Translations$result$ko extends Translations$result$en {
	_Translations$result$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '결과 동영상';
	@override String ready_message({required Object title}) => '${title} 동영상이 준비되었습니다!';
	@override String get regenerate => '재생성';
	@override String get create_another => '다른 동영상 만들기';
	@override String get share => '공유';
	@override String get download => '다운로드';
	@override String get extend_video => '비디오 확장';
	@override String get extends_title => '확장';
	@override String get delete => '삭제';
	@override String get share_success => '공유할 비디오 링크가 복사되었습니다';
	@override String get download_success => '비디오가 갤러리에 저장되었습니다';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$ko extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '데이터 개인정보 보호';
	@override String get desc => '사진은 당사의 내부 AI 시스템에 의해 안전하게 처리됩니다. 당사는 귀하의 정보를 제3자에게 공유, 판매 또는 공개하지 않습니다.';
	@override String get cancel => '취소';
	@override String get confirm => '확인';
}

// Path: report_dialog
class _Translations$report_dialog$ko extends Translations$report_dialog$en {
	_Translations$report_dialog$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '신고';
	@override String get desc => '신고를 제출하시겠습니까?';
	@override String get cancel => '취소';
	@override String get submit => '제출';
	@override String get success => '동영상이 성공적으로 신고되었습니다';
}

// Path: tips_sheet
class _Translations$tips_sheet$ko extends Translations$tips_sheet$en {
	_Translations$tips_sheet$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '최상의 결과를 위한 팁';
	@override String get button_got_it => '알겠습니다!';
	@override String get use_photos => '이런 사진을 사용하세요';
	@override String get avoid_photos => '이런 사진은 피하세요';
	@override String get one_person => '한 사람';
	@override String get clear_face => '선명한 얼굴';
	@override String get half_body => '반신';
	@override String get hidden_face => '가려진 얼굴';
	@override String get multiple_people => '여러 사람';
	@override String get blurry_photo => '흐린 사진';
}

// Path: errors
class _Translations$errors$ko extends Translations$errors$en {
	_Translations$errors$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'An unexpected error occurred. Please try again.';
	@override String get unauthorized => 'Session expired. Please log in again.';
	@override String get validation_error => 'Invalid inputs. Please check your data.';
	@override String get password_incorrect => 'Incorrect password. Please try again.';
	@override String get account_not_found => 'Account not found.';
	@override String get email_template_already_exists => 'Email template already exists.';
	@override String get email_template_not_found => 'Email template not found.';
	@override String get account_email_limit_register => 'Registration limit reached for this email.';
	@override String get account_username_is_exist => 'Username is already taken.';
	@override String get token_invalid => 'Invalid session token. Please log in again.';
	@override String get already_enable_2fa => 'Two-factor authentication is already enabled.';
	@override String get account_are_not_enable_2fa => 'Two-factor authentication is not enabled.';
	@override String get ref_account_not_found => 'Referral account not found.';
	@override String get account_already_vip => 'Account is already VIP.';
	@override String get perm_not_found => 'Permission not found.';
	@override String get account_register_not_found => 'Registration details not found.';
	@override String get otp_invalid => 'Invalid OTP code. Please check and try again.';
	@override String get otp_expired => 'OTP code has expired. Please request a new one.';
	@override String get otp_to_many_request => 'Too many requests. Please wait before trying again.';
	@override String get account_info_not_found => 'Account information not found.';
	@override String get account_info_already_created => 'Account information is already created.';
	@override String get id_number_already_in_use => 'ID number is already in use.';
	@override String get account_info_can_not_update => 'Account information cannot be updated.';
	@override String get account_profile_is_processed => 'Account profile is currently being processed.';
	@override String get insufficient_fund => 'Insufficient funds or credits.';
	@override String get account_email_is_exist => 'Email is already registered.';
	@override String get proxy_error => 'Proxy connection error.';
	@override String get invalid_file_type => 'Invalid file type. Please use supported formats.';
	@override String get file_too_large => 'File size exceeds the 20MB limit.';
	@override String get account_banned => 'Your account has been banned.';
	@override String get login_failed => 'Login failed. Please check your credentials.';
	@override String get error_code => 'An error occurred with code validation.';
	@override String get user_not_found => 'User not found.';
	@override String get user_used_invite_code => 'Invite code has already been used.';
	@override String get get_me_failed => 'Failed to retrieve user profile.';
	@override String get user_cannot_use_own_invite_code => 'You cannot use your own invite code.';
	@override String get file_not_found => 'File not found.';
	@override String get file_upload_failed => 'Failed to upload file. Please try again.';
	@override String get upload_webp_failed => 'Failed to upload WEBP file.';
	@override String get create_theme_failed => 'Failed to create theme.';
	@override String get get_theme_failed => 'Failed to retrieve themes.';
	@override String get category_already_exists => 'Category already exists.';
	@override String get create_category_failed => 'Failed to create category.';
	@override String get invalid_ratio => 'Invalid video ratio.';
	@override String get create_media_failed => 'Failed to initiate video generation.';
	@override String get media_not_found => 'Video or image file not found.';
	@override String get callback_media_failed => 'Callback media processing failed.';
	@override String get get_media_detail_failed => 'Failed to retrieve video details.';
	@override String get get_media_failed => 'Failed to retrieve media list.';
	@override String get update_theme_failed => 'Failed to update theme.';
	@override String get delete_theme_failed => 'Failed to delete theme.';
	@override String get category_not_found => 'Category not found.';
	@override String get delete_category_failed => 'Failed to delete category.';
	@override String get media_not_owned => 'You do not own this media.';
	@override String get theme_already_exists => 'Theme already exists.';
	@override String get like_media_failed => 'Failed to update like status.';
	@override String get user_not_vip => 'This feature requires a VIP subscription.';
	@override String get not_enough_credit => 'Not enough credits. Please purchase more credits.';
	@override String get create_photo_enhance_failed => 'Photo enhancement failed.';
	@override String get remove_object_failed => 'Failed to remove object from photo.';
	@override String get get_suggestion_prompt_failed => 'Failed to suggest prompt.';
	@override String get get_tasks_failed => 'Failed to load tasks.';
	@override String get action_task_failed => 'Failed to perform task action.';
	@override String get task_not_found => 'Task not found.';
	@override String get task_already_claimed => 'Task reward already claimed.';
	@override String get task_already_started => 'Task has already been started.';
	@override String get task_not_completed => 'Task is not completed yet.';
	@override String get rate_app_failed => 'Rating app failed.';
	@override String get daily_login_task_not_found => 'Daily login task not found.';
	@override String get get_daily_login_failed => 'Failed to get daily login task.';
	@override String get today_login_reward_already_claimed => 'Today\'s reward already claimed.';
	@override String get take_login_reward_failed => 'Failed to claim login reward.';
	@override String get iap_receipt_already_exists => 'Purchase receipt already registered.';
	@override String get iap_verify_product_failed => 'Failed to verify purchase product.';
	@override String get iap_product_not_purchased => 'Product is not purchased.';
	@override String get iap_product_not_found => 'In-app purchase product not found.';
	@override String get iap_subscription_not_active => 'Subscription is not active.';
	@override String get iap_subscription_already_acknowledged => 'Subscription already acknowledged.';
	@override String get iap_verify_subscription_failed => 'Failed to verify subscription.';
	@override String get refill_subscription_credits_failed => 'Failed to refill subscription credits.';
	@override String get cancel_subscription_failed => 'Failed to cancel subscription.';
	@override String get plan_not_found => 'Subscription plan not found.';
	@override String get transaction_action_failed => 'Transaction action failed.';
	@override String get iap_verify_ios_product_failed => 'Failed to verify iOS purchase.';
	@override String get iap_subscription_invalid_type => 'Invalid subscription type.';
	@override String get subscription_not_active_for_refill => 'Subscription is not active for credit refill.';
	@override String get get_price_list_failed => 'Failed to retrieve credit price list.';
	@override String get iap_receipt_not_found => 'Purchase receipt not found.';
	@override String get iap_subscription_not_found => 'Subscription not found.';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$ko extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '비디오 AI에 오신 것을 환영합니다';
	@override String get subtitle => '당신의 창의적인 여정이 여기서 시작됩니다...';
	@override String get button => '시작하기';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$ko extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '이미지를 비디오로';
	@override String get subtitle => '이미지 업로드, 프롬프트 작성';
	@override String get button => '계속';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$ko extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '2개 이미지를 비디오로';
	@override String get subtitle => '이미지 2개 업로드, 프롬프트 작성';
	@override String get button => '계속';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$ko extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '이미지 댄스';
	@override String get subtitle => '비디오 1개, 사진 1장 업로드';
	@override String get button => '계속';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$ko extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '비디오 융합';
	@override String get subtitle => '사진 업로드';
	@override String get button => '계속';
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => '모두 보기',
			'common.stay' => '머무르기',
			'common.leave' => '나가기',
			'common.camera' => '카메라',
			'common.gallery' => '갤러리',
			'common.generate' => '생성하기',
			'home.title' => '비디오 AI',
			'home.trending' => '트렌딩',
			'home.new_section' => '새로운',
			'home.toy_box' => '장난감 피규어 박스',
			'home.epic_morph' => '에픽 모프',
			'home.anime' => '애니메이션',
			'home.discover' => '발견',
			'create.selfie_aquaman' => '셀피 아쿠아맨',
			'create.tap_upload' => '여기를 눌러 사진을 업로드하세요.',
			'create.select_upload_title' => '사진 업로드 방식 선택',
			'create.upload_image' => '이미지 업로드',
			'create.custom_prompt' => '커스텀 프롬프트',
			'create.prompt_placeholder' => '사실적인 여성 초상화, 클로즈업, 카메라 응시, 자연스러운 깜빡임, 블루 스튜디오 조명, 시네마틱, 초고화질',
			'create.inspire_me' => '아이디어 얻기',
			'create.video_settings' => '비디오 설정',
			'create.quality' => '화질',
			'create.quality_desc' => '비디오 화질 선택',
			'create.hd' => 'HD',
			'create.full_hd' => '풀 HD',
			'create.duration' => '길이',
			'create.duration_desc' => '비디오 재생 시간 선택',
			'create.sec_4s' => '4초',
			'create.sec_8s' => '8초',
			'create.sec_5s' => '5초',
			'create.sec_10s' => '10초',
			'create.sec_15s' => '15초',
			'create.generate_title' => '생성하기',
			'create.upload_first_photo' => '첫 번째 사진 업로드.',
			'create.upload_last_photo' => '마지막 사진 업로드.',
			'create.upload_video_slot' => '동영상 업로드.',
			'create.upload_photo_slot' => '사진 업로드.',
			'create.photo_slot_num' => ({required Object num}) => '사진 ${num}',
			'create.required_label' => '필수',
			'create.optional_label' => '선택',
			'create.inspire_me_count' => ({required Object count}) => '영감 주기 (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => '동영상 생성 중...',
			'create.select_mock_media' => '모크 미디어 선택',
			'create.select_media_desc' => '업로드를 시뮬레이션할 모크 파일 선택',
			'leave_dialog.title' => '저장하지 않고 나갈까요?',
			'leave_dialog.desc' => '편집을 계속하시겠습니까, 아니면 지금 나가시겠습니까?',
			'splash.appName' => '비디오 AI',
			'onboarding.page1.title' => '비디오 AI에 오신 것을 환영합니다',
			'onboarding.page1.subtitle' => '당신의 창의적인 여정이 여기서 시작됩니다...',
			'onboarding.page1.button' => '시작하기',
			'onboarding.page2.title' => '이미지를 비디오로',
			'onboarding.page2.subtitle' => '이미지 업로드, 프롬프트 작성',
			'onboarding.page2.button' => '계속',
			'onboarding.page3.title' => '2개 이미지를 비디오로',
			'onboarding.page3.subtitle' => '이미지 2개 업로드, 프롬프트 작성',
			'onboarding.page3.button' => '계속',
			'onboarding.page4.title' => '이미지 댄스',
			'onboarding.page4.subtitle' => '비디오 1개, 사진 1장 업로드',
			'onboarding.page4.button' => '계속',
			'onboarding.page5.title' => '비디오 융합',
			'onboarding.page5.subtitle' => '사진 업로드',
			'onboarding.page5.button' => '계속',
			'dashboard.home' => '홈',
			'dashboard.user' => '프로필',
			'dashboard.createVideo' => '비디오 생성',
			'profile.title' => '프로필',
			'profile.upgradeTitle' => '프리미엄 업그레이드',
			'profile.upgradeSubtitle' => '크레딧 추가 - 워터마크 없음',
			'profile.goPremium' => '프리미엄 가입',
			'profile.myVideo' => '내 비디오',
			'profile.liked' => '좋아요',
			'profile.noVideos' => '아직 동영상이 없습니다',
			'profile.noVideosDesc' => '첫 번째 AI 비디오를 만들면 여기에 표시됩니다.',
			'profile.deleteTitle' => '이 동영상을 삭제하시겠습니까?',
			'profile.deleteDesc' => '이 동영상을 정말로 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.',
			'profile.cancel' => '취소',
			'profile.delete' => '삭제',
			'profile.generating' => '생성 중...',
			'profile.imageGeneration' => '이미지 생성',
			'home_new.welcomeToAppName' => '비디오 AI에 오신 것을 환영합니다',
			'home_new.imageToVideo' => '이미지를\n비디오로',
			'home_new.transitionVideo' => '트랜지션\n비디오',
			'home_new.imageToDance' => '이미지를\n댄스로',
			'home_new.unifiedVideo' => '통합\n비디오',
			'templates.title' => '템플릿',
			'templates.all' => '전체',
			'templates.pro' => '프로',
			'settings.title' => '설정',
			'settings.language' => '언어',
			'settings.termsOfService' => '서비스 약관',
			'settings.privacyPolicy' => '개인정보 처리방침',
			'settings.contactUs' => '문의하기',
			'settings.version' => '버전',
			'settings.myCredits' => '내 크레딧',
			'settings.rateApp' => '앱 평가하기',
			'settings.userCode' => '사용자 코드',
			'settings.copied' => '클립보드에 복사되었습니다!',
			'settings.termsOfUse' => '이용 약관',
			'language.title' => '언어',
			'language.en' => '영어',
			'language.ar' => '아랍어',
			'language.de' => '독일어',
			'language.es' => '스페인어',
			'language.fr' => '프랑스어',
			'language.hi' => '힌디어',
			'language.id' => '인도네시아어',
			'language.ja' => '일본어',
			'language.ko' => '한국어',
			'language.pt' => '포르투갈어',
			'language.vi' => '베트남어',
			'language.zh' => '중국어',
			'premium.tap_to_reveal' => '탭하여 잠금 해제',
			'premium.weekly' => '주간',
			'premium.weekly_desc' => '7일 무료 체험, 이후 249.000đ/주',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/주',
			'premium.annually' => '연간',
			'premium.annually_desc' => '주당 24.980đ 상당',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/년',
			'premium.best_value' => '최고의 가치',
			'premium.save_80' => '80% 할인',
			'premium.start_free_trial' => '무료 체험 시작',
			'premium.start_my_subscription' => '구독 시작하기',
			'premium.auto_renewable' => '자동 갱신. 언제든지 취소 가능.',
			'premium.privacy_policy' => '개인정보 처리방침',
			'premium.terms_of_use' => '이용 약관',
			'premium.restore' => '구독 복원',
			'premium.unlock_templates' => '200개 이상의 템플릿 잠금 해제',
			'premium.fast_generation' => '빠른 비디오 생성',
			'premium.discount_packs' => '크레딧 팩 50% 할인',
			'premium.videos_per_year' => '연간 80개 비디오',
			'premium.buy_more_credit' => '크레딧 추가 구매',
			'premium.credit_desc' => '35 크레딧으로 비디오 1개 생성. 구매한 크레딧 사용 시 광고 없음.',
			'premium.credit_70' => '70 크레딧',
			'premium.credit_150' => '150 크레딧',
			'premium.credit_350' => '350 크레딧',
			'premium.credit_500' => '500 크레딧',
			'premium.credit_1000' => '1.000 크레딧',
			'premium.credit_6000' => '6.000 크레딧',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count}개 비디오)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => '가장 인기 있음',
			'premium.purchase_success' => ({required Object item}) => '구매 완료: ${item}',
			'premium.purchase_failed' => '구매 실패.',
			'premium.credit_packages' => '크레딧 패키지',
			'premium.buy_credit_now' => '지금 크레딧 구매',
			'premium.pro_title' => '프로',
			'premium.discount_title' => '50% 할인',
			'premium.discount_subtitle' => '크레딧 가격',
			'generating.title' => '생성 중',
			'generating.your_video' => '동영상 생성',
			'generating.desc' => '몇 분 정도 걸릴 수 있습니다.\n잠시만 기다려 주세요...',
			'generating.notify_me' => '완료 시 나에게 알림',
			'generating.notified' => '동영상이 준비되면 알려드리겠습니다!',
			'generating.notification_denied' => '알림 권한이 거부되었습니다. 설정에서 활성화해주세요.',
			'generating.failed' => '비디오 생성에 실패했습니다. 다시 시도해 주세요.',
			'result.title' => '결과 동영상',
			'result.ready_message' => ({required Object title}) => '${title} 동영상이 준비되었습니다!',
			'result.regenerate' => '재생성',
			'result.create_another' => '다른 동영상 만들기',
			'result.share' => '공유',
			'result.download' => '다운로드',
			'result.extend_video' => '비디오 확장',
			'result.extends_title' => '확장',
			'result.delete' => '삭제',
			'result.share_success' => '공유할 비디오 링크가 복사되었습니다',
			'result.download_success' => '비디오가 갤러리에 저장되었습니다',
			'privacy_dialog.title' => '데이터 개인정보 보호',
			'privacy_dialog.desc' => '사진은 당사의 내부 AI 시스템에 의해 안전하게 처리됩니다. 당사는 귀하의 정보를 제3자에게 공유, 판매 또는 공개하지 않습니다.',
			'privacy_dialog.cancel' => '취소',
			'privacy_dialog.confirm' => '확인',
			'report_dialog.title' => '신고',
			'report_dialog.desc' => '신고를 제출하시겠습니까?',
			'report_dialog.cancel' => '취소',
			'report_dialog.submit' => '제출',
			'report_dialog.success' => '동영상이 성공적으로 신고되었습니다',
			'tips_sheet.title' => '최상의 결과를 위한 팁',
			'tips_sheet.button_got_it' => '알겠습니다!',
			'tips_sheet.use_photos' => '이런 사진을 사용하세요',
			'tips_sheet.avoid_photos' => '이런 사진은 피하세요',
			'tips_sheet.one_person' => '한 사람',
			'tips_sheet.clear_face' => '선명한 얼굴',
			'tips_sheet.half_body' => '반신',
			'tips_sheet.hidden_face' => '가려진 얼굴',
			'tips_sheet.multiple_people' => '여러 사람',
			'tips_sheet.blurry_photo' => '흐린 사진',
			'errors.unknown' => 'An unexpected error occurred. Please try again.',
			'errors.unauthorized' => 'Session expired. Please log in again.',
			'errors.validation_error' => 'Invalid inputs. Please check your data.',
			'errors.password_incorrect' => 'Incorrect password. Please try again.',
			'errors.account_not_found' => 'Account not found.',
			'errors.email_template_already_exists' => 'Email template already exists.',
			'errors.email_template_not_found' => 'Email template not found.',
			'errors.account_email_limit_register' => 'Registration limit reached for this email.',
			'errors.account_username_is_exist' => 'Username is already taken.',
			'errors.token_invalid' => 'Invalid session token. Please log in again.',
			'errors.already_enable_2fa' => 'Two-factor authentication is already enabled.',
			'errors.account_are_not_enable_2fa' => 'Two-factor authentication is not enabled.',
			'errors.ref_account_not_found' => 'Referral account not found.',
			'errors.account_already_vip' => 'Account is already VIP.',
			'errors.perm_not_found' => 'Permission not found.',
			'errors.account_register_not_found' => 'Registration details not found.',
			'errors.otp_invalid' => 'Invalid OTP code. Please check and try again.',
			'errors.otp_expired' => 'OTP code has expired. Please request a new one.',
			'errors.otp_to_many_request' => 'Too many requests. Please wait before trying again.',
			'errors.account_info_not_found' => 'Account information not found.',
			'errors.account_info_already_created' => 'Account information is already created.',
			'errors.id_number_already_in_use' => 'ID number is already in use.',
			'errors.account_info_can_not_update' => 'Account information cannot be updated.',
			'errors.account_profile_is_processed' => 'Account profile is currently being processed.',
			'errors.insufficient_fund' => 'Insufficient funds or credits.',
			'errors.account_email_is_exist' => 'Email is already registered.',
			'errors.proxy_error' => 'Proxy connection error.',
			'errors.invalid_file_type' => 'Invalid file type. Please use supported formats.',
			'errors.file_too_large' => 'File size exceeds the 20MB limit.',
			'errors.account_banned' => 'Your account has been banned.',
			'errors.login_failed' => 'Login failed. Please check your credentials.',
			'errors.error_code' => 'An error occurred with code validation.',
			'errors.user_not_found' => 'User not found.',
			'errors.user_used_invite_code' => 'Invite code has already been used.',
			'errors.get_me_failed' => 'Failed to retrieve user profile.',
			'errors.user_cannot_use_own_invite_code' => 'You cannot use your own invite code.',
			'errors.file_not_found' => 'File not found.',
			'errors.file_upload_failed' => 'Failed to upload file. Please try again.',
			'errors.upload_webp_failed' => 'Failed to upload WEBP file.',
			'errors.create_theme_failed' => 'Failed to create theme.',
			'errors.get_theme_failed' => 'Failed to retrieve themes.',
			'errors.category_already_exists' => 'Category already exists.',
			'errors.create_category_failed' => 'Failed to create category.',
			'errors.invalid_ratio' => 'Invalid video ratio.',
			'errors.create_media_failed' => 'Failed to initiate video generation.',
			'errors.media_not_found' => 'Video or image file not found.',
			'errors.callback_media_failed' => 'Callback media processing failed.',
			'errors.get_media_detail_failed' => 'Failed to retrieve video details.',
			'errors.get_media_failed' => 'Failed to retrieve media list.',
			'errors.update_theme_failed' => 'Failed to update theme.',
			'errors.delete_theme_failed' => 'Failed to delete theme.',
			'errors.category_not_found' => 'Category not found.',
			'errors.delete_category_failed' => 'Failed to delete category.',
			'errors.media_not_owned' => 'You do not own this media.',
			'errors.theme_already_exists' => 'Theme already exists.',
			'errors.like_media_failed' => 'Failed to update like status.',
			'errors.user_not_vip' => 'This feature requires a VIP subscription.',
			'errors.not_enough_credit' => 'Not enough credits. Please purchase more credits.',
			'errors.create_photo_enhance_failed' => 'Photo enhancement failed.',
			'errors.remove_object_failed' => 'Failed to remove object from photo.',
			'errors.get_suggestion_prompt_failed' => 'Failed to suggest prompt.',
			'errors.get_tasks_failed' => 'Failed to load tasks.',
			'errors.action_task_failed' => 'Failed to perform task action.',
			'errors.task_not_found' => 'Task not found.',
			'errors.task_already_claimed' => 'Task reward already claimed.',
			'errors.task_already_started' => 'Task has already been started.',
			'errors.task_not_completed' => 'Task is not completed yet.',
			'errors.rate_app_failed' => 'Rating app failed.',
			'errors.daily_login_task_not_found' => 'Daily login task not found.',
			'errors.get_daily_login_failed' => 'Failed to get daily login task.',
			'errors.today_login_reward_already_claimed' => 'Today\'s reward already claimed.',
			'errors.take_login_reward_failed' => 'Failed to claim login reward.',
			'errors.iap_receipt_already_exists' => 'Purchase receipt already registered.',
			'errors.iap_verify_product_failed' => 'Failed to verify purchase product.',
			'errors.iap_product_not_purchased' => 'Product is not purchased.',
			'errors.iap_product_not_found' => 'In-app purchase product not found.',
			'errors.iap_subscription_not_active' => 'Subscription is not active.',
			'errors.iap_subscription_already_acknowledged' => 'Subscription already acknowledged.',
			'errors.iap_verify_subscription_failed' => 'Failed to verify subscription.',
			'errors.refill_subscription_credits_failed' => 'Failed to refill subscription credits.',
			'errors.cancel_subscription_failed' => 'Failed to cancel subscription.',
			'errors.plan_not_found' => 'Subscription plan not found.',
			'errors.transaction_action_failed' => 'Transaction action failed.',
			'errors.iap_verify_ios_product_failed' => 'Failed to verify iOS purchase.',
			'errors.iap_subscription_invalid_type' => 'Invalid subscription type.',
			'errors.subscription_not_active_for_refill' => 'Subscription is not active for credit refill.',
			'errors.get_price_list_failed' => 'Failed to retrieve credit price list.',
			'errors.iap_receipt_not_found' => 'Purchase receipt not found.',
			'errors.iap_subscription_not_found' => 'Subscription not found.',
			_ => null,
		};
	}
}
