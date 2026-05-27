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
class TranslationsJa extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$ja common = _Translations$common$ja._(_root);
	@override late final _Translations$home$ja home = _Translations$home$ja._(_root);
	@override late final _Translations$create$ja create = _Translations$create$ja._(_root);
	@override late final _Translations$leave_dialog$ja leave_dialog = _Translations$leave_dialog$ja._(_root);
	@override late final _Translations$splash$ja splash = _Translations$splash$ja._(_root);
}

// Path: common
class _Translations$common$ja extends Translations$common$en {
	_Translations$common$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'すべて見る';
	@override String get stay => '留まる';
	@override String get leave => '退出';
	@override String get camera => 'カメラ';
	@override String get gallery => 'ギャラリー';
	@override String get generate => '生成する';
}

// Path: home
class _Translations$home$ja extends Translations$home$en {
	_Translations$home$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ビデオAI';
	@override String get trending => 'トレンド';
	@override String get new_section => '新規';
	@override String get toy_box => 'トイフィギュアボックス';
	@override String get epic_morph => 'エピックモーフ';
	@override String get anime => 'アニメ';
	@override String get discover => '発見';
}

// Path: create
class _Translations$create$ja extends Translations$create$en {
	_Translations$create$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'セルフィーアクアマン';
	@override String get tap_upload => 'タップして写真をアップロードします。';
	@override String get select_upload_title => '写真をアップロードする方法を選択';
	@override String get upload_image => '画像をアップロード';
	@override String get custom_prompt => 'カスタムプロンプト';
	@override String get prompt_placeholder => 'リアルな女性の肖像画、クローズアップ、カメラを見る、自然な瞬き、青いスタジオ照明、シネマティック、超詳細';
	@override String get inspire_me => 'ひらめきを得る';
	@override String get video_settings => 'ビデオ設定';
	@override String get quality => '画質';
	@override String get quality_desc => 'ビデオの画質を選択';
	@override String get hd => 'HD';
	@override String get full_hd => 'フルHD';
	@override String get duration => '再生時間';
	@override String get duration_desc => 'ビデオの長さを選択';
	@override String get sec_4s => '4秒';
	@override String get sec_8s => '8秒';
	@override String get sec_5s => '5秒';
	@override String get sec_10s => '10秒';
	@override String get sec_15s => '15秒';
}

// Path: leave_dialog
class _Translations$leave_dialog$ja extends Translations$leave_dialog$en {
	_Translations$leave_dialog$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '保存せずに終了しますか？';
	@override String get desc => '編集を続けますか、それとも今終了しますか？';
}

// Path: splash
class _Translations$splash$ja extends Translations$splash$en {
	_Translations$splash$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appName => 'ビデオAI';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'すべて見る',
			'common.stay' => '留まる',
			'common.leave' => '退出',
			'common.camera' => 'カメラ',
			'common.gallery' => 'ギャラリー',
			'common.generate' => '生成する',
			'home.title' => 'ビデオAI',
			'home.trending' => 'トレンド',
			'home.new_section' => '新規',
			'home.toy_box' => 'トイフィギュアボックス',
			'home.epic_morph' => 'エピックモーフ',
			'home.anime' => 'アニメ',
			'home.discover' => '発見',
			'create.selfie_aquaman' => 'セルフィーアクアマン',
			'create.tap_upload' => 'タップして写真をアップロードします。',
			'create.select_upload_title' => '写真をアップロードする方法を選択',
			'create.upload_image' => '画像をアップロード',
			'create.custom_prompt' => 'カスタムプロンプト',
			'create.prompt_placeholder' => 'リアルな女性の肖像画、クローズアップ、カメラを見る、自然な瞬き、青いスタジオ照明、シネマティック、超詳細',
			'create.inspire_me' => 'ひらめきを得る',
			'create.video_settings' => 'ビデオ設定',
			'create.quality' => '画質',
			'create.quality_desc' => 'ビデオの画質を選択',
			'create.hd' => 'HD',
			'create.full_hd' => 'フルHD',
			'create.duration' => '再生時間',
			'create.duration_desc' => 'ビデオの長さを選択',
			'create.sec_4s' => '4秒',
			'create.sec_8s' => '8秒',
			'create.sec_5s' => '5秒',
			'create.sec_10s' => '10秒',
			'create.sec_15s' => '15秒',
			'leave_dialog.title' => '保存せずに終了しますか？',
			'leave_dialog.desc' => '編集を続けますか、それとも今終了しますか？',
			'splash.appName' => 'ビデオAI',
			_ => null,
		};
	}
}
