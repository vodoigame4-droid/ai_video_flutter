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
	@override late final _Translations$premium$hi premium = _Translations$premium$hi._(_root);
	@override late final _Translations$generating$hi generating = _Translations$generating$hi._(_root);
	@override late final _Translations$result$hi result = _Translations$result$hi._(_root);
	@override late final _Translations$privacy_dialog$hi privacy_dialog = _Translations$privacy_dialog$hi._(_root);
	@override late final _Translations$report_dialog$hi report_dialog = _Translations$report_dialog$hi._(_root);
	@override late final _Translations$tips_sheet$hi tips_sheet = _Translations$tips_sheet$hi._(_root);
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

// Path: premium
class _Translations$premium$hi extends Translations$premium$en {
	_Translations$premium$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => 'दिखाने के लिए टैप करें';
	@override String get weekly => 'साप्ताहिक';
	@override String get weekly_desc => '7-दिन का असीमित एक्सेस, फिर 249.000đ/सप्ताह';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/सप्ताह';
	@override String get annually => 'वार्षिक';
	@override String get annually_desc => 'केवल 24.980đ/सप्ताह';
	@override String get annually_price => '1.299.000 đ';
	@override String get annually_suffix => '/वर्ष';
	@override String get best_value => 'सर्वोत्तम मूल्य';
	@override String get save_80 => '80% बचाएं';
	@override String get start_free_trial => 'मुफ़्त ट्रायल शुरू करें';
	@override String get start_my_subscription => 'मेरा सब्सक्रिप्शन शुरू करें';
	@override String get auto_renewable => 'ऑटो-रिन्यूएबल। किसी भी समय रद्द करें।';
	@override String get privacy_policy => 'गोपनीयता नीति';
	@override String get terms_of_use => 'उपयोग की शर्तें';
	@override String get restore => 'पुनर्स्थापित करें';
	@override String get unlock_templates => '200+ टेम्प्लेट अनलॉक करें';
	@override String get fast_generation => 'तेज़ वीडियो जनरेशन';
	@override String get discount_packs => 'क्रेडिट पैक पर 50% छूट';
	@override String get videos_per_year => 'प्रति वर्ष 80 वीडियो';
	@override String get buy_more_credit => 'और क्रेडिट खरीदें';
	@override String get credit_desc => '35 क्रेडिट 1 वीडियो बनाते हैं। खरीदे गए क्रेडिट का उपयोग करते समय कोई विज्ञापन नहीं।';
	@override String get credit_70 => '70 क्रेडिट';
	@override String get credit_150 => '150 क्रेडिट';
	@override String get credit_350 => '350 क्रेडिट';
	@override String get credit_500 => '500 क्रेडिट';
	@override String get credit_1000 => '1.000 क्रेडिट';
	@override String get credit_6000 => '6.000 क्रेडिट';
	@override String approx_videos({required Object count}) => '(~ ${count} वीडियो)';
	@override String get price_70 => '149.000 đ';
	@override String get price_150 => '299.000 đ';
	@override String get price_350 => '599.000 đ';
	@override String get price_500 => '799.000 đ';
	@override String get price_1000 => '1.499.000 đ';
	@override String get price_6000 => '5.999.000 đ';
	@override String get most_popular => 'सबसे लोकप्रिय';
	@override String purchase_success({required Object item}) => 'खरीद सफल: ${item}';
	@override String get purchase_failed => 'खरीद विफल रही।';
	@override String get credit_packages => 'क्रेडिट पैकेज';
	@override String get buy_credit_now => 'अभी क्रेडिट खरीदें';
	@override String get pro_title => 'प्रो';
	@override String get discount_title => '50% छूट';
	@override String get discount_subtitle => 'क्रेडिट की कीमतें';
}

// Path: generating
class _Translations$generating$hi extends Translations$generating$en {
	_Translations$generating$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'बनाया जा रहा है';
	@override String get your_video => 'आपका वीडियो';
	@override String get desc => 'इसमें कुछ मिनट लग सकते हैं।\nकृपया प्रतीक्षा करें...';
	@override String get notify_me => 'पूरा होने पर मुझे सूचित करें';
	@override String get notified => 'आपका वीडियो तैयार होने पर हम आपको सूचित करेंगे!';
	@override String get notification_denied => 'सूचना अनुमति अस्वीकार कर दी गई। कृपया सेटिंग्स में इसे सक्षम करें।';
}

// Path: result
class _Translations$result$hi extends Translations$result$en {
	_Translations$result$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'परिणाम वीडियो';
	@override String ready_message({required Object title}) => 'आपका ${title} वीडियो तैयार है!';
	@override String get regenerate => 'पुनः उत्पन्न करें';
	@override String get create_another => 'दूसरा वीडियो बनाएं';
	@override String get share => 'साझा करें';
	@override String get download => 'डाउनलोड करें';
	@override String get extend_video => 'वीडियो बढ़ाएं';
	@override String get extends_title => 'विस्तार';
	@override String get delete => 'हटाएं';
	@override String get share_success => 'साझा करने के लिए वीडियो लिंक कॉपी किया गया';
	@override String get download_success => 'वीडियो गैलरी में सहेजा गया';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$hi extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'डेटा गोपनीयता';
	@override String get desc => 'आपकी तस्वीरों को हमारे आंतरिक एआई सिस्टम द्वारा सुरक्षित रूप से संसाधित किया जाता है। हम आपकी जानकारी किसी भी तीसरे पक्ष के साथ साझा, बेच या प्रकट नहीं करते हैं।';
	@override String get cancel => 'रद्द करें';
	@override String get confirm => 'पुष्टि करें';
}

// Path: report_dialog
class _Translations$report_dialog$hi extends Translations$report_dialog$en {
	_Translations$report_dialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'रिपोर्ट करें';
	@override String get desc => 'क्या आप वाकई रिपोर्ट सबमिट करना चाहते हैं?';
	@override String get cancel => 'रद्द करें';
	@override String get submit => 'सबमिट करें';
	@override String get success => 'वीडियो की सफलतापूर्वक रिपोर्ट की गई';
}

// Path: tips_sheet
class _Translations$tips_sheet$hi extends Translations$tips_sheet$en {
	_Translations$tips_sheet$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सर्वोत्तम परिणामों के लिए सुझाव';
	@override String get button_got_it => 'समझ गया!';
	@override String get use_photos => 'इस तरह की तस्वीरों का उपयोग करें';
	@override String get avoid_photos => 'इस तरह की तस्वीरों से बचें';
	@override String get one_person => 'एक व्यक्ति';
	@override String get clear_face => 'स्पष्ट चेहरा';
	@override String get half_body => 'आधा शरीर';
	@override String get hidden_face => 'छिपा हुआ चेहरा';
	@override String get multiple_people => 'कई लोग';
	@override String get blurry_photo => 'धुंधली तस्वीर';
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
			'premium.tap_to_reveal' => 'दिखाने के लिए टैप करें',
			'premium.weekly' => 'साप्ताहिक',
			'premium.weekly_desc' => '7-दिन का असीमित एक्सेस, फिर 249.000đ/सप्ताह',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/सप्ताह',
			'premium.annually' => 'वार्षिक',
			'premium.annually_desc' => 'केवल 24.980đ/सप्ताह',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/वर्ष',
			'premium.best_value' => 'सर्वोत्तम मूल्य',
			'premium.save_80' => '80% बचाएं',
			'premium.start_free_trial' => 'मुफ़्त ट्रायल शुरू करें',
			'premium.start_my_subscription' => 'मेरा सब्सक्रिप्शन शुरू करें',
			'premium.auto_renewable' => 'ऑटो-रिन्यूएबल। किसी भी समय रद्द करें।',
			'premium.privacy_policy' => 'गोपनीयता नीति',
			'premium.terms_of_use' => 'उपयोग की शर्तें',
			'premium.restore' => 'पुनर्स्थापित करें',
			'premium.unlock_templates' => '200+ टेम्प्लेट अनलॉक करें',
			'premium.fast_generation' => 'तेज़ वीडियो जनरेशन',
			'premium.discount_packs' => 'क्रेडिट पैक पर 50% छूट',
			'premium.videos_per_year' => 'प्रति वर्ष 80 वीडियो',
			'premium.buy_more_credit' => 'और क्रेडिट खरीदें',
			'premium.credit_desc' => '35 क्रेडिट 1 वीडियो बनाते हैं। खरीदे गए क्रेडिट का उपयोग करते समय कोई विज्ञापन नहीं।',
			'premium.credit_70' => '70 क्रेडिट',
			'premium.credit_150' => '150 क्रेडिट',
			'premium.credit_350' => '350 क्रेडिट',
			'premium.credit_500' => '500 क्रेडिट',
			'premium.credit_1000' => '1.000 क्रेडिट',
			'premium.credit_6000' => '6.000 क्रेडिट',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} वीडियो)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => 'सबसे लोकप्रिय',
			'premium.purchase_success' => ({required Object item}) => 'खरीद सफल: ${item}',
			'premium.purchase_failed' => 'खरीद विफल रही।',
			'premium.credit_packages' => 'क्रेडिट पैकेज',
			'premium.buy_credit_now' => 'अभी क्रेडिट खरीदें',
			'premium.pro_title' => 'प्रो',
			'premium.discount_title' => '50% छूट',
			'premium.discount_subtitle' => 'क्रेडिट की कीमतें',
			'generating.title' => 'बनाया जा रहा है',
			'generating.your_video' => 'आपका वीडियो',
			'generating.desc' => 'इसमें कुछ मिनट लग सकते हैं।\nकृपया प्रतीक्षा करें...',
			'generating.notify_me' => 'पूरा होने पर मुझे सूचित करें',
			'generating.notified' => 'आपका वीडियो तैयार होने पर हम आपको सूचित करेंगे!',
			'generating.notification_denied' => 'सूचना अनुमति अस्वीकार कर दी गई। कृपया सेटिंग्स में इसे सक्षम करें।',
			'result.title' => 'परिणाम वीडियो',
			'result.ready_message' => ({required Object title}) => 'आपका ${title} वीडियो तैयार है!',
			'result.regenerate' => 'पुनः उत्पन्न करें',
			'result.create_another' => 'दूसरा वीडियो बनाएं',
			'result.share' => 'साझा करें',
			'result.download' => 'डाउनलोड करें',
			'result.extend_video' => 'वीडियो बढ़ाएं',
			'result.extends_title' => 'विस्तार',
			'result.delete' => 'हटाएं',
			'result.share_success' => 'साझा करने के लिए वीडियो लिंक कॉपी किया गया',
			'result.download_success' => 'वीडियो गैलरी में सहेजा गया',
			'privacy_dialog.title' => 'डेटा गोपनीयता',
			'privacy_dialog.desc' => 'आपकी तस्वीरों को हमारे आंतरिक एआई सिस्टम द्वारा सुरक्षित रूप से संसाधित किया जाता है। हम आपकी जानकारी किसी भी तीसरे पक्ष के साथ साझा, बेच या प्रकट नहीं करते हैं।',
			'privacy_dialog.cancel' => 'रद्द करें',
			'privacy_dialog.confirm' => 'पुष्टि करें',
			'report_dialog.title' => 'रिपोर्ट करें',
			'report_dialog.desc' => 'क्या आप वाकई रिपोर्ट सबमिट करना चाहते हैं?',
			'report_dialog.cancel' => 'रद्द करें',
			'report_dialog.submit' => 'सबमिट करें',
			'report_dialog.success' => 'वीडियो की सफलतापूर्वक रिपोर्ट की गई',
			'tips_sheet.title' => 'सर्वोत्तम परिणामों के लिए सुझाव',
			'tips_sheet.button_got_it' => 'समझ गया!',
			'tips_sheet.use_photos' => 'इस तरह की तस्वीरों का उपयोग करें',
			'tips_sheet.avoid_photos' => 'इस तरह की तस्वीरों से बचें',
			'tips_sheet.one_person' => 'एक व्यक्ति',
			'tips_sheet.clear_face' => 'स्पष्ट चेहरा',
			'tips_sheet.half_body' => 'आधा शरीर',
			'tips_sheet.hidden_face' => 'छिपा हुआ चेहरा',
			'tips_sheet.multiple_people' => 'कई लोग',
			'tips_sheet.blurry_photo' => 'धुंधली तस्वीर',
			_ => null,
		};
	}
}
