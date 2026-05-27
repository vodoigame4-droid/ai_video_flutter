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
			'home_new.welcomeToAppName' => '비디오 AI에 오신 것을 환영합니다',
			'home_new.imageToVideo' => '이미지를\n비디오로',
			'home_new.transitionVideo' => '트랜지션\n비디오',
			'home_new.imageToDance' => '이미지를\n댄스로',
			'home_new.unifiedVideo' => '통합\n비디오',
			_ => null,
		};
	}
}
