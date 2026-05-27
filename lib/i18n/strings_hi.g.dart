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
class TranslationsHi extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHi _root = this; // ignore: unused_field

	@override 
	TranslationsHi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHi(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$hi common = _Translations$common$hi._(_root);
	@override late final _Translations$home$hi home = _Translations$home$hi._(_root);
	@override late final _Translations$create$hi create = _Translations$create$hi._(_root);
	@override late final _Translations$leave_dialog$hi leave_dialog = _Translations$leave_dialog$hi._(_root);
	@override late final _Translations$splash$hi splash = _Translations$splash$hi._(_root);
	@override late final _Translations$onboarding$hi onboarding = _Translations$onboarding$hi._(_root);
	@override late final _Translations$dashboard$hi dashboard = _Translations$dashboard$hi._(_root);
	@override late final _Translations$profile$hi profile = _Translations$profile$hi._(_root);
	@override late final _Translations$home_new$hi home_new = _Translations$home_new$hi._(_root);
	@override late final _Translations$templates$hi templates = _Translations$templates$hi._(_root);
	@override late final _Translations$settings$hi settings = _Translations$settings$hi._(_root);
	@override late final _Translations$language$hi language = _Translations$language$hi._(_root);
}

// Path: common
class _Translations$common$hi extends Translations$common$en {
	_Translations$common$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get pro => 'प्रो';
	@override String get see_all => 'सभी देखें';
	@override String get stay => 'रहें';
	@override String get leave => 'छोड़ें';
	@override String get camera => 'कैमरा';
	@override String get gallery => 'गैलरी';
	@override String get generate => 'उत्पन्न करें';
}

// Path: home
class _Translations$home$hi extends Translations$home$en {
	_Translations$home$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'वीडियो एआई';
	@override String get trending => 'ट्रेंडिंग';
	@override String get new_section => 'नया';
	@override String get toy_box => 'खिलौना आकृति बॉक्स';
	@override String get epic_morph => 'महाकाव्य रूप';
	@override String get anime => 'एनिमे';
	@override String get discover => 'खोजें';
}

// Path: create
class _Translations$create$hi extends Translations$create$en {
	_Translations$create$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'सेल्फी एक्वामैन';
	@override String get tap_upload => 'अपनी फोटो अपलोड करने के लिए यहां टैप करें।';
	@override String get select_upload_title => 'अपनी फोटो अपलोड करने के लिए चुनें';
	@override String get upload_image => 'छवि अपलोड करें';
	@override String get custom_prompt => 'कस्टम प्रॉम्प्ट';
	@override String get prompt_placeholder => 'यथार्थवादी महिला चित्र, क्लोज़-अप, कैमरे की ओर देखना, प्राकृतिक रूप से पलकें झपकना, नीली स्टूडियो लाइटिंग, सिनेमाई, अत्यधिक विस्तृत';
	@override String get inspire_me => 'मुझे प्रेरित करें';
	@override String get video_settings => 'वीडियो सेटिंग्स';
	@override String get quality => 'गुणवत्ता';
	@override String get quality_desc => 'वीडियो की गुणवत्ता चुनें';
	@override String get hd => 'एचडी';
	@override String get full_hd => 'फुल एचडी';
	@override String get duration => 'अवधि';
	@override String get duration_desc => 'वीडियो की लंबाई चुनें';
	@override String get sec_4s => '४ सेकंड';
	@override String get sec_8s => '८ सेकंड';
	@override String get sec_5s => '५ सेकंड';
	@override String get sec_10s => '१० सेकंड';
	@override String get sec_15s => '१५ सेकंड';
	@override String get generate_title => 'बनाएं';
	@override String get upload_first_photo => 'पहला फोटो अपलोड करें।';
	@override String get upload_last_photo => 'अंतिम फोटो अपलोड करें।';
	@override String get upload_video_slot => 'वीडियो अपलोड करें।';
	@override String get upload_photo_slot => 'फोटो अपलोड करें।';
	@override String photo_slot_num({required Object num}) => 'फोटो ${num}';
	@override String get required_label => 'आवश्यक';
	@override String get optional_label => 'वैकल्पिक';
	@override String inspire_me_count({required Object count}) => 'मुझे प्रेरित करें (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => 'आपका वीडियो बनाया जा रहा है...';
	@override String get select_mock_media => 'नकली मीडिया चुनें';
	@override String get select_media_desc => 'अपलोड अनुकरण करने के लिए एक नकली फ़ाइल चुनें';
}

// Path: leave_dialog
class _Translations$leave_dialog$hi extends Translations$leave_dialog$en {
	_Translations$leave_dialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'बिना सहेजे छोड़ें?';
	@override String get desc => 'क्या आप संपादन जारी रखना चाहते हैं या अभी छोड़ना चाहते हैं?';
}

// Path: splash
class _Translations$splash$hi extends Translations$splash$en {
	_Translations$splash$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get appName => 'वीडियो एआई';
}

// Path: onboarding
class _Translations$onboarding$hi extends Translations$onboarding$en {
	_Translations$onboarding$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$hi page1 = _Translations$onboarding$page1$hi._(_root);
	@override late final _Translations$onboarding$page2$hi page2 = _Translations$onboarding$page2$hi._(_root);
	@override late final _Translations$onboarding$page3$hi page3 = _Translations$onboarding$page3$hi._(_root);
	@override late final _Translations$onboarding$page4$hi page4 = _Translations$onboarding$page4$hi._(_root);
	@override late final _Translations$onboarding$page5$hi page5 = _Translations$onboarding$page5$hi._(_root);
}

// Path: dashboard
class _Translations$dashboard$hi extends Translations$dashboard$en {
	_Translations$dashboard$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get home => 'होम';
	@override String get user => 'प्रोफाइल';
	@override String get createVideo => 'वीडियो बनाएं';
}

// Path: profile
class _Translations$profile$hi extends Translations$profile$en {
	_Translations$profile$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'प्रोफ़ाइल';
	@override String get upgradeTitle => 'प्रीमियम अपग्रेड';
	@override String get upgradeSubtitle => 'क्रेडिट जोड़ें - कोई वॉटरमार्क नहीं';
	@override String get goPremium => 'प्रीमियम बनें';
	@override String get myVideo => 'मेरा वीडियो';
	@override String get liked => 'पसंद किया गया';
	@override String get noVideos => 'अभी कोई वीडियो नहीं';
	@override String get noVideosDesc => 'अपना पहला एआई वीडियो बनाएं और यह यहां दिखाई देगा।';
	@override String get deleteTitle => 'यह वीडियो हटाएं?';
	@override String get deleteDesc => 'क्या आप वाकई इस वीडियो को हटाना चाहते हैं? यह कार्रवाई पूर्ववत नहीं की जा सकती।';
	@override String get cancel => 'रद्द करें';
	@override String get delete => 'हटाएं';
	@override String get generating => 'बनाया जा रहा है...';
	@override String get imageGeneration => 'छवि निर्माण';
}

// Path: home_new
class _Translations$home_new$hi extends Translations$home_new$en {
	_Translations$home_new$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'वीडियो एआई में आपका स्वागत है';
	@override String get imageToVideo => 'छवि से\nवीडियो';
	@override String get transitionVideo => 'संक्रमण\nवीडियो';
	@override String get imageToDance => 'छवि से\nनृत्य';
	@override String get unifiedVideo => 'एकीकृत\nवीडियो';
}

// Path: templates
class _Translations$templates$hi extends Translations$templates$en {
	_Translations$templates$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'टेम्पलेट्स';
	@override String get all => 'सभी';
	@override String get pro => 'प्रो';
}

// Path: settings
class _Translations$settings$hi extends Translations$settings$en {
	_Translations$settings$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सेटिंग्स';
	@override String get language => 'भाषा';
	@override String get termsOfService => 'सेवा की शर्तें';
	@override String get privacyPolicy => 'गोपनीयता नीति';
	@override String get contactUs => 'हमसे संपर्क करें';
	@override String get version => 'संस्करण';
	@override String get myCredits => 'मेरे क्रेडिट';
	@override String get rateApp => 'ऐप रेट करें';
	@override String get userCode => 'उपयोगकर्ता कोड';
	@override String get copied => 'क्लिपबोर्ड पर कॉपी किया गया!';
	@override String get termsOfUse => 'उपयोग की शर्तें';
}

// Path: language
class _Translations$language$hi extends Translations$language$en {
	_Translations$language$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'भाषा';
	@override String get en => 'अंग्रेज़ी';
	@override String get ar => 'अरबी';
	@override String get de => 'जर्मन';
	@override String get es => 'स्पैनिश';
	@override String get fr => 'फ़्रेंच';
	@override String get hi => 'हिन्दी';
	@override String get id => 'इंडोनेशियाई';
	@override String get ja => 'जापानी';
	@override String get ko => 'कोरियाई';
	@override String get pt => 'पुर्तगाली';
	@override String get vi => 'वियतनामी';
	@override String get zh => 'चीनी';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$hi extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'वीडियो एआई में आपका स्वागत है';
	@override String get subtitle => 'आपकी रचनात्मक यात्रा यहाँ शुरू होती है...';
	@override String get button => 'शुरू करें';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$hi extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'छवि से वीडियो';
	@override String get subtitle => 'छवि अपलोड करें, प्रॉम्प्ट लिखें';
	@override String get button => 'जारी रखें';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$hi extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => '2 छवि से वीडियो';
	@override String get subtitle => '2 छवि अपलोड करें, प्रॉम्प्ट लिखें';
	@override String get button => 'जारी रखें';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$hi extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'छवि नृत्य';
	@override String get subtitle => '1 वीडियो, 1 फोटो अपलोड करें';
	@override String get button => 'जारी रखें';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$hi extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'वीडियो संलयन';
	@override String get subtitle => 'अपनी तस्वीरें अपलोड करें';
	@override String get button => 'जारी रखें';
}

/// The flat map containing all translations for locale <hi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'प्रो',
			'common.see_all' => 'सभी देखें',
			'common.stay' => 'रहें',
			'common.leave' => 'छोड़ें',
			'common.camera' => 'कैमरा',
			'common.gallery' => 'गैलरी',
			'common.generate' => 'उत्पन्न करें',
			'home.title' => 'वीडियो एआई',
			'home.trending' => 'ट्रेंडिंग',
			'home.new_section' => 'नया',
			'home.toy_box' => 'खिलौना आकृति बॉक्स',
			'home.epic_morph' => 'महाकाव्य रूप',
			'home.anime' => 'एनिमे',
			'home.discover' => 'खोजें',
			'create.selfie_aquaman' => 'सेल्फी एक्वामैन',
			'create.tap_upload' => 'अपनी फोटो अपलोड करने के लिए यहां टैप करें।',
			'create.select_upload_title' => 'अपनी फोटो अपलोड करने के लिए चुनें',
			'create.upload_image' => 'छवि अपलोड करें',
			'create.custom_prompt' => 'कस्टम प्रॉम्प्ट',
			'create.prompt_placeholder' => 'यथार्थवादी महिला चित्र, क्लोज़-अप, कैमरे की ओर देखना, प्राकृतिक रूप से पलकें झपकना, नीली स्टूडियो लाइटिंग, सिनेमाई, अत्यधिक विस्तृत',
			'create.inspire_me' => 'मुझे प्रेरित करें',
			'create.video_settings' => 'वीडियो सेटिंग्स',
			'create.quality' => 'गुणवत्ता',
			'create.quality_desc' => 'वीडियो की गुणवत्ता चुनें',
			'create.hd' => 'एचडी',
			'create.full_hd' => 'फुल एचडी',
			'create.duration' => 'अवधि',
			'create.duration_desc' => 'वीडियो की लंबाई चुनें',
			'create.sec_4s' => '४ सेकंड',
			'create.sec_8s' => '८ सेकंड',
			'create.sec_5s' => '५ सेकंड',
			'create.sec_10s' => '१० सेकंड',
			'create.sec_15s' => '१५ सेकंड',
			'create.generate_title' => 'बनाएं',
			'create.upload_first_photo' => 'पहला फोटो अपलोड करें।',
			'create.upload_last_photo' => 'अंतिम फोटो अपलोड करें।',
			'create.upload_video_slot' => 'वीडियो अपलोड करें।',
			'create.upload_photo_slot' => 'फोटो अपलोड करें।',
			'create.photo_slot_num' => ({required Object num}) => 'फोटो ${num}',
			'create.required_label' => 'आवश्यक',
			'create.optional_label' => 'वैकल्पिक',
			'create.inspire_me_count' => ({required Object count}) => 'मुझे प्रेरित करें (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'आपका वीडियो बनाया जा रहा है...',
			'create.select_mock_media' => 'नकली मीडिया चुनें',
			'create.select_media_desc' => 'अपलोड अनुकरण करने के लिए एक नकली फ़ाइल चुनें',
			'leave_dialog.title' => 'बिना सहेजे छोड़ें?',
			'leave_dialog.desc' => 'क्या आप संपादन जारी रखना चाहते हैं या अभी छोड़ना चाहते हैं?',
			'splash.appName' => 'वीडियो एआई',
			'onboarding.page1.title' => 'वीडियो एआई में आपका स्वागत है',
			'onboarding.page1.subtitle' => 'आपकी रचनात्मक यात्रा यहाँ शुरू होती है...',
			'onboarding.page1.button' => 'शुरू करें',
			'onboarding.page2.title' => 'छवि से वीडियो',
			'onboarding.page2.subtitle' => 'छवि अपलोड करें, प्रॉम्प्ट लिखें',
			'onboarding.page2.button' => 'जारी रखें',
			'onboarding.page3.title' => '2 छवि से वीडियो',
			'onboarding.page3.subtitle' => '2 छवि अपलोड करें, प्रॉम्प्ट लिखें',
			'onboarding.page3.button' => 'जारी रखें',
			'onboarding.page4.title' => 'छवि नृत्य',
			'onboarding.page4.subtitle' => '1 वीडियो, 1 फोटो अपलोड करें',
			'onboarding.page4.button' => 'जारी रखें',
			'onboarding.page5.title' => 'वीडियो संलयन',
			'onboarding.page5.subtitle' => 'अपनी तस्वीरें अपलोड करें',
			'onboarding.page5.button' => 'जारी रखें',
			'dashboard.home' => 'होम',
			'dashboard.user' => 'प्रोफाइल',
			'dashboard.createVideo' => 'वीडियो बनाएं',
			'profile.title' => 'प्रोफ़ाइल',
			'profile.upgradeTitle' => 'प्रीमियम अपग्रेड',
			'profile.upgradeSubtitle' => 'क्रेडिट जोड़ें - कोई वॉटरमार्क नहीं',
			'profile.goPremium' => 'प्रीमियम बनें',
			'profile.myVideo' => 'मेरा वीडियो',
			'profile.liked' => 'पसंद किया गया',
			'profile.noVideos' => 'अभी कोई वीडियो नहीं',
			'profile.noVideosDesc' => 'अपना पहला एआई वीडियो बनाएं और यह यहां दिखाई देगा।',
			'profile.deleteTitle' => 'यह वीडियो हटाएं?',
			'profile.deleteDesc' => 'क्या आप वाकई इस वीडियो को हटाना चाहते हैं? यह कार्रवाई पूर्ववत नहीं की जा सकती।',
			'profile.cancel' => 'रद्द करें',
			'profile.delete' => 'हटाएं',
			'profile.generating' => 'बनाया जा रहा है...',
			'profile.imageGeneration' => 'छवि निर्माण',
			'home_new.welcomeToAppName' => 'वीडियो एआई में आपका स्वागत है',
			'home_new.imageToVideo' => 'छवि से\nवीडियो',
			'home_new.transitionVideo' => 'संक्रमण\nवीडियो',
			'home_new.imageToDance' => 'छवि से\nनृत्य',
			'home_new.unifiedVideo' => 'एकीकृत\nवीडियो',
			'templates.title' => 'टेम्पलेट्स',
			'templates.all' => 'सभी',
			'templates.pro' => 'प्रो',
			'settings.title' => 'सेटिंग्स',
			'settings.language' => 'भाषा',
			'settings.termsOfService' => 'सेवा की शर्तें',
			'settings.privacyPolicy' => 'गोपनीयता नीति',
			'settings.contactUs' => 'हमसे संपर्क करें',
			'settings.version' => 'संस्करण',
			'settings.myCredits' => 'मेरे क्रेडिट',
			'settings.rateApp' => 'ऐप रेट करें',
			'settings.userCode' => 'उपयोगकर्ता कोड',
			'settings.copied' => 'क्लिपबोर्ड पर कॉपी किया गया!',
			'settings.termsOfUse' => 'उपयोग की शर्तें',
			'language.title' => 'भाषा',
			'language.en' => 'अंग्रेज़ी',
			'language.ar' => 'अरबी',
			'language.de' => 'जर्मन',
			'language.es' => 'स्पैनिश',
			'language.fr' => 'फ़्रेंच',
			'language.hi' => 'हिन्दी',
			'language.id' => 'इंडोनेशियाई',
			'language.ja' => 'जापानी',
			'language.ko' => 'कोरियाई',
			'language.pt' => 'पुर्तगाली',
			'language.vi' => 'वियतनामी',
			'language.zh' => 'चीनी',
			_ => null,
		};
	}
}
