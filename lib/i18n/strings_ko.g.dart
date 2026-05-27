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
			_ => null,
		};
	}
}
