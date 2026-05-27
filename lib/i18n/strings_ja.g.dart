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
	@override late final _Translations$onboarding$ja onboarding = _Translations$onboarding$ja._(_root);
	@override late final _Translations$dashboard$ja dashboard = _Translations$dashboard$ja._(_root);
	@override late final _Translations$profile$ja profile = _Translations$profile$ja._(_root);
	@override late final _Translations$home_new$ja home_new = _Translations$home_new$ja._(_root);
	@override late final _Translations$templates$ja templates = _Translations$templates$ja._(_root);
	@override late final _Translations$settings$ja settings = _Translations$settings$ja._(_root);
	@override late final _Translations$language$ja language = _Translations$language$ja._(_root);
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

// Path: onboarding
class _Translations$onboarding$ja extends Translations$onboarding$en {
	_Translations$onboarding$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$ja page1 = _Translations$onboarding$page1$ja._(_root);
	@override late final _Translations$onboarding$page2$ja page2 = _Translations$onboarding$page2$ja._(_root);
	@override late final _Translations$onboarding$page3$ja page3 = _Translations$onboarding$page3$ja._(_root);
	@override late final _Translations$onboarding$page4$ja page4 = _Translations$onboarding$page4$ja._(_root);
	@override late final _Translations$onboarding$page5$ja page5 = _Translations$onboarding$page5$ja._(_root);
}

// Path: dashboard
class _Translations$dashboard$ja extends Translations$dashboard$en {
	_Translations$dashboard$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get user => 'マイページ';
	@override String get createVideo => '動画作成';
}

// Path: profile
class _Translations$profile$ja extends Translations$profile$en {
	_Translations$profile$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'プロフィール';
	@override String get upgradeTitle => 'プレミアムアップグレード';
	@override String get upgradeSubtitle => 'クレジット追加 - ウォーターマークなし';
	@override String get goPremium => 'プレミアムにする';
	@override String get myVideo => 'マイビデオ';
	@override String get liked => 'いいね';
	@override String get noVideos => '動画はまだありません';
	@override String get noVideosDesc => '最初のAI動画を作成すると、ここに表示されます。';
	@override String get deleteTitle => 'この動画を削除しますか？';
	@override String get deleteDesc => 'この動画を削除してもよろしいですか？この操作は取り消せません。';
	@override String get cancel => 'キャンセル';
	@override String get delete => '削除';
	@override String get generating => '生成中...';
	@override String get imageGeneration => '画像生成';
}

// Path: home_new
class _Translations$home_new$ja extends Translations$home_new$en {
	_Translations$home_new$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'ビデオAIへようこそ';
	@override String get imageToVideo => '画像から\nビデオ';
	@override String get transitionVideo => 'トランジション\n動画';
	@override String get imageToDance => '画像から\nダンス';
	@override String get unifiedVideo => '統合\n動画';
}

// Path: templates
class _Translations$templates$ja extends Translations$templates$en {
	_Translations$templates$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'テンプレート';
	@override String get all => 'すべて';
	@override String get pro => 'プロ';
}

// Path: settings
class _Translations$settings$ja extends Translations$settings$en {
	_Translations$settings$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override String get language => '言語';
	@override String get termsOfService => '利用規約';
	@override String get privacyPolicy => 'プライバシーポリシー';
	@override String get contactUs => 'お問い合わせ';
	@override String get version => 'バージョン';
	@override String get myCredits => '保有クレジット';
	@override String get rateApp => 'アプリを評価';
	@override String get userCode => 'ユーザーコード';
	@override String get copied => 'クリップボードにコピーされました！';
	@override String get termsOfUse => '利用規約';
}

// Path: language
class _Translations$language$ja extends Translations$language$en {
	_Translations$language$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '言語';
	@override String get en => '英語';
	@override String get ar => 'アラビア語';
	@override String get de => 'ドイツ語';
	@override String get es => 'スペイン語';
	@override String get fr => 'フランス語';
	@override String get hi => 'ヒンディー語';
	@override String get id => 'インドネシア語';
	@override String get ja => '日本語';
	@override String get ko => '韓国語';
	@override String get pt => 'ポルトガル語';
	@override String get vi => 'ベトナム語';
	@override String get zh => '中国語';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$ja extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ビデオAIへようこそ';
	@override String get subtitle => 'あなたのクリエイティブな旅がここから始まる...';
	@override String get button => '始める';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$ja extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '画像からビデオへ';
	@override String get subtitle => '画像をアップロードし、プロンプトを入力';
	@override String get button => '次へ';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$ja extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '2枚 of 画像からビデオへ';
	@override String get subtitle => '2枚 of 画像をアップロードし、プロンプトを入力';
	@override String get button => '次へ';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$ja extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'イメージダンス';
	@override String get subtitle => '動画1本、写真1枚をアップロード';
	@override String get button => '次へ';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$ja extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ビデオの融合';
	@override String get subtitle => '写真をアップロードする';
	@override String get button => '次へ';
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
			'onboarding.page1.title' => 'ビデオAIへようこそ',
			'onboarding.page1.subtitle' => 'あなたのクリエイティブな旅がここから始まる...',
			'onboarding.page1.button' => '始める',
			'onboarding.page2.title' => '画像からビデオへ',
			'onboarding.page2.subtitle' => '画像をアップロードし、プロンプトを入力',
			'onboarding.page2.button' => '次へ',
			'onboarding.page3.title' => '2枚 of 画像からビデオへ',
			'onboarding.page3.subtitle' => '2枚 of 画像をアップロードし、プロンプトを入力',
			'onboarding.page3.button' => '次へ',
			'onboarding.page4.title' => 'イメージダンス',
			'onboarding.page4.subtitle' => '動画1本、写真1枚をアップロード',
			'onboarding.page4.button' => '次へ',
			'onboarding.page5.title' => 'ビデオの融合',
			'onboarding.page5.subtitle' => '写真をアップロードする',
			'onboarding.page5.button' => '次へ',
			'dashboard.home' => 'ホーム',
			'dashboard.user' => 'マイページ',
			'dashboard.createVideo' => '動画作成',
			'profile.title' => 'プロフィール',
			'profile.upgradeTitle' => 'プレミアムアップグレード',
			'profile.upgradeSubtitle' => 'クレジット追加 - ウォーターマークなし',
			'profile.goPremium' => 'プレミアムにする',
			'profile.myVideo' => 'マイビデオ',
			'profile.liked' => 'いいね',
			'profile.noVideos' => '動画はまだありません',
			'profile.noVideosDesc' => '最初のAI動画を作成すると、ここに表示されます。',
			'profile.deleteTitle' => 'この動画を削除しますか？',
			'profile.deleteDesc' => 'この動画を削除してもよろしいですか？この操作は取り消せません。',
			'profile.cancel' => 'キャンセル',
			'profile.delete' => '削除',
			'profile.generating' => '生成中...',
			'profile.imageGeneration' => '画像生成',
			'home_new.welcomeToAppName' => 'ビデオAIへようこそ',
			'home_new.imageToVideo' => '画像から\nビデオ',
			'home_new.transitionVideo' => 'トランジション\n動画',
			'home_new.imageToDance' => '画像から\nダンス',
			'home_new.unifiedVideo' => '統合\n動画',
			'templates.title' => 'テンプレート',
			'templates.all' => 'すべて',
			'templates.pro' => 'プロ',
			'settings.title' => '設定',
			'settings.language' => '言語',
			'settings.termsOfService' => '利用規約',
			'settings.privacyPolicy' => 'プライバシーポリシー',
			'settings.contactUs' => 'お問い合わせ',
			'settings.version' => 'バージョン',
			'settings.myCredits' => '保有クレジット',
			'settings.rateApp' => 'アプリを評価',
			'settings.userCode' => 'ユーザーコード',
			'settings.copied' => 'クリップボードにコピーされました！',
			'settings.termsOfUse' => '利用規約',
			'language.title' => '言語',
			'language.en' => '英語',
			'language.ar' => 'アラビア語',
			'language.de' => 'ドイツ語',
			'language.es' => 'スペイン語',
			'language.fr' => 'フランス語',
			'language.hi' => 'ヒンディー語',
			'language.id' => 'インドネシア語',
			'language.ja' => '日本語',
			'language.ko' => '韓国語',
			'language.pt' => 'ポルトガル語',
			'language.vi' => 'ベトナム語',
			'language.zh' => '中国語',
			_ => null,
		};
	}
}
