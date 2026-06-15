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
	@override late final _Translations$errors$hi errors = _Translations$errors$hi._(_root);
	@override late final _Translations$guide$hi guide = _Translations$guide$hi._(_root);
	@override late final _Translations$checkin$hi checkin = _Translations$checkin$hi._(_root);
	@override late final _Translations$connectivity$hi connectivity = _Translations$connectivity$hi._(_root);
	@override late final _Translations$notification$hi notification = _Translations$notification$hi._(_root);
	@override late final _Translations$rating_dialog$hi rating_dialog = _Translations$rating_dialog$hi._(_root);
	@override late final _Translations$debug$hi debug = _Translations$debug$hi._(_root);
	@override late final _Translations$permission$hi permission = _Translations$permission$hi._(_root);
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
	@override String get processing => 'प्रक्रिया जारी है...';
	@override String get ok => 'ठीक है';
	@override String get btn_continue => 'जारी रखें';
}

// Path: home
class _Translations$home$hi extends Translations$home$en {
	_Translations$home$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'VidoVerse';
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
	@override String get tap_upload => 'अपनी फ़ोटो अपलोड करें और कुछ ही सेकंड में अपना एआई वीडियो बनाएं।';
	@override String get tap_to_upload_photo => 'अपनी फ़ोटो अपलोड करने के लिए यहाँ टैप करें।';
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
	@override String get inspiring => 'एआई सोच रहा है...';
	@override String get limit_dialog_title => 'मुफ़्त सुझाव समाप्त';
	@override String get limit_dialog_desc => 'आपने सभी 3 मुफ़्त सुझावों का उपयोग कर लिया है। कृपया असीमित सुझावों का आनंद लेने के लिए VIP में अपग्रेड करें!';
	@override String get limit_dialog_btn => 'VIP में अपग्रेड करें';
	@override String get limit_dialog_cancel => 'बाद में';
	@override String get inspire_me_pro => 'मुझे प्रेरित करें (PRO)';
	@override String get trim_title => 'वीडियो काटें';
	@override String get trim_save => 'सहेजें';
	@override String get trimming_loading => 'वीडियो काटा जा रहा है...';
	@override String get please_add_image_first => 'कृपया पहले एक छवि जोड़ें';
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
	@override String get appName => 'VidoVerse';
	@override String get loading => 'लोड हो रहा है...';
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
	@override String get imageGeneration => 'वीडियो निर्माण';
}

// Path: home_new
class _Translations$home_new$hi extends Translations$home_new$en {
	_Translations$home_new$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'VidoVerse में आपका स्वागत है';
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
	@override String weekly_desc({required Object price}) => '7-दिन का असीमित एक्सेस, फिर ${price}/सप्ताह';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/सप्ताह';
	@override String get annually => 'वार्षिक';
	@override String annually_desc({required Object price}) => 'केवल ${price}/सप्ताह';
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
	@override String get claim_discount => 'छूट प्राप्त करें';
	@override String get no_thanks => 'नहीं, धन्यवाद';
	@override String get buy_now => 'अभी खरीदें';
	@override String get sub_discount_banner => 'सदस्यता के साथ 50% तक की छूट';
	@override String get unlock_premium_desc => 'विशेष छूट पर सभी प्रीमियम सुविधाओं को अनलॉक करें';
	@override String get credit_5000 => '5.000 क्रेडिट';
	@override String get price_5000 => '5.999.000 đ';
	@override String get itunes_disclaimer => 'यदि आप सदस्यता लेते हैं, तो खरीदारी की पुष्टि होने पर आपके iTunes खाते में भुगतान चार्ज किया जाएगा। आपकी सदस्यता स्वचालित रूप से नवीनीकृत होगी जब तक कि वर्तमान बिलिंग अवधि समाप्त होने से कम से कम 24 घंटे पहले रद्द न कर दी जाए। ऑटो-नवीनीकरण को आपके iTunes Store खाता सेटिंग्स में कभी भी प्रबंधित किया जा सकता है।';
	@override String get buy_credit => 'क्रेडिट खरीदें';
	@override String save_up_to({required Object percent}) => '${percent}% तक बचाएं';
	@override String get discount_price => '799.000';
	@override String get discount_price_suffix => '/वर्ष';
	@override String billed_yearly({required Object price}) => '${price}/वर्ष बिल किया गया - कभी भी रद्द करें';
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
	@override String get failed => 'वीडियो बनाने में विफल। कृपया पुनः प्रयास करें।';
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
	@override String get bottom_sheet_title => 'वीडियो की रिपोर्ट करें';
	@override String get option_offensive => 'आपत्तिजनक या अनुचित सामग्री';
	@override String get option_quality => 'खराब गुणवत्ता या विकृत चेहरे';
	@override String get option_copyright => 'कॉपीराइट का उल्लंघन';
	@override String get option_bug => 'वीडियो निर्माण त्रुटि या क्रैश';
	@override String get option_other => 'अन्य समस्याएं';
	@override String get thanks_msg => 'आपकी रिपोर्ट के लिए धन्यवाद, हम इसकी समीक्षा करेंगे और सुधार करेंगे।';
	@override String get hint_other => 'कृपया समस्या का विस्तार से वर्णन करें...';
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

// Path: errors
class _Translations$errors$hi extends Translations$errors$en {
	_Translations$errors$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

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
	@override String get not_enough_suggestion_free => 'पर्याप्त मुफ्त सुझाव नहीं हैं, कृपया वीआईपी में अपग्रेड करें';
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
	@override String get video_too_long => 'वीडियो 10 सेकंड से कम का होना चाहिए।';
	@override String get iap_purchase_cancelled => 'खरीद रद्द कर दी गई।';
	@override String get iap_purchase_in_progress => 'खरीद पहले से ही प्रगति पर है।';
	@override String get iap_purchase_failed => 'खरीद विफल।';
}

// Path: guide
class _Translations$guide$hi extends Translations$guide$en {
	_Translations$guide$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get step_1 => 'चरण 1';
	@override String get step_2 => 'चरण 2';
	@override String get upload_photo => 'फोटो अपलोड करें';
	@override String get got_it => 'मुझे समझ आ गया!';
	@override String get write_prompt => 'प्रॉम्ट लिखें';
	@override String get upload_2_photos => '2 फ़ोटो अपलोड करें';
	@override String get generate => 'बनाएं';
	@override String get upload_portrait => 'पोर्ट्रेट अपलोड करें';
	@override String get choose_style => 'शैली चुनें';
	@override String get add_assets => 'एसेट जोड़ें';
}

// Path: checkin
class _Translations$checkin$hi extends Translations$checkin$en {
	_Translations$checkin$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'दैनिक हाजिरी';
	@override String get subtitle => 'रोजाना इनाम पाएं!';
	@override String get today => 'आज';
	@override String day({required Object n}) => 'दिन ${n}';
	@override String get check_in_btn => 'हाजिri लगाएं';
	@override String get daily_bonus_notification => 'दैनिक सूचना';
	@override String get disable_notification_title => 'चेक-इन सूचनाएं अक्षम करें?';
	@override String get disable_notification_desc => 'आप दैनिक लॉगिन पुरस्कार और अन्य रोमांचक बोनस खो देंगे। क्या आप वाकई अक्षम करना चाहते हैं?';
	@override String get disable_notification_keep => 'सक्षम रखें';
	@override String get disable_notification_disable => 'अक्षम करें';
	@override String check_in_success({required Object credits}) => '+${credits} क्रेडिट! दैनिक चेक-इन सफलतापूर्वक पूरा हुआ।';
}

// Path: connectivity
class _Translations$connectivity$hi extends Translations$connectivity$en {
	_Translations$connectivity$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get no_internet_title => 'कोई कनेक्शन नहीं';
	@override String get no_internet_desc => 'कृपया ऐप का उपयोग जारी रखने के लिए अपने इंटरनेट कनेक्शन की जांच करें।';
	@override String get retry_button => 'पुनः प्रयास करें';
}

// Path: notification
class _Translations$notification$hi extends Translations$notification$en {
	_Translations$notification$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get channel_name => 'महत्वपूर्ण सूचनाएं';
	@override String get channel_description => 'इस चैनल का उपयोग महत्वपूर्ण सूचनाओं के लिए किया जाता है।';
	@override String get checkin_title => 'दैनिक चेक-इन अनुस्मारक 🎁';
	@override String get checkin_body => 'अपने दैनिक मुफ्त क्रेडिट का दावा करने का समय आ गया है! अभी ऐप खोलें।';
	@override String get test_notification => 'परीक्षण';
}

// Path: rating_dialog
class _Translations$rating_dialog$hi extends Translations$rating_dialog$en {
	_Translations$rating_dialog$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'क्या आप ऐप का आनंद ले रहे हैं?';
	@override String get desc => 'कृपया हमें रेट करें और अपना अनुभव बेहतर बनाने में हमारी मदद करें। धन्यवाद!';
	@override String get support_us => 'हमारा समर्थन करें';
	@override String get encourage_us => 'हमें प्रोत्साहित करें';
	@override String get rate_on_store => 'स्टोर पर रेट करें';
	@override String get maybe_later => 'शायद बाद में';
	@override String get success => 'आपके समर्थन के लिए धन्यवाद!';
}

// Path: debug
class _Translations$debug$hi extends Translations$debug$en {
	_Translations$debug$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'डीबग मेनू';
	@override String get iap_page => 'आईएपी पेज';
	@override String get buy_credits => 'क्रेडिट खरीदें';
	@override String get generation_iap => 'जेनरेशन आईएपी';
	@override String get generation_buy_credits => 'जेनरेशन क्रेडिट खरीदें';
	@override String get discount => 'डिस्काउंट पेज';
	@override String get paywall_video => 'पेवॉल वीडियो पेज';
	@override String get generating_page => 'जेनरेटिंग पेज पूर्वावलोकन';
}

// Path: permission
class _Translations$permission$hi extends Translations$permission$en {
	_Translations$permission$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get camera_title => 'कैमरा अनुमति आवश्यक है';
	@override String get camera_desc => 'कैमरा अनुमति आवश्यक है। इस सुविधा का उपयोग करने के लिए कृपया इसे सेटिंग्स में सक्षम करें।';
	@override String get photos_title => 'फ़ोटो अनुमति';
	@override String get photos_desc => 'फ़ोटो या वीडियो सहेजने के लिए स्टोरेज अनुमति आवश्यक है। कृपया इसे सेटिंग्स में सक्षम करें।';
	@override String get microphone_title => 'माइक्रोफ़ोन अनुमति';
	@override String get microphone_desc => 'वीडियो ध्वनि रिकॉर्डिंग के लिए माइक्रोफ़ोन अनुमति आवश्यक है। कृपया इसे सेटिंग्स में सक्षम करें।';
	@override String get notification_title => 'अधिसूचना अनुमति';
	@override String get notification_desc => 'दैनिक चेक-इन अनुस्मारक प्राप्त करने के लिए अधिसूचना अनुमति आवश्यक है। कृपया इसे सेटिंग्स में सक्षम करें।';
	@override String get settings => 'सेटिंग्स';
	@override String get cancel => 'रद्द करें';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$hi extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$hi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'VidoVerse में आपका स्वागत है';
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
			'common.processing' => 'प्रक्रिया जारी है...',
			'common.ok' => 'ठीक है',
			'common.btn_continue' => 'जारी रखें',
			'home.title' => 'VidoVerse',
			'home.trending' => 'ट्रेंडिंग',
			'home.new_section' => 'नया',
			'home.toy_box' => 'खिलौना आकृति बॉक्स',
			'home.epic_morph' => 'महाकाव्य रूप',
			'home.anime' => 'एनिमे',
			'home.discover' => 'खोजें',
			'create.selfie_aquaman' => 'सेल्फी एक्वामैन',
			'create.tap_upload' => 'अपनी फ़ोटो अपलोड करें और कुछ ही सेकंड में अपना एआई वीडियो बनाएं।',
			'create.tap_to_upload_photo' => 'अपनी फ़ोटो अपलोड करने के लिए यहाँ टैप करें।',
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
			'create.inspiring' => 'एआई सोच रहा है...',
			'create.limit_dialog_title' => 'मुफ़्त सुझाव समाप्त',
			'create.limit_dialog_desc' => 'आपने सभी 3 मुफ़्त सुझावों का उपयोग कर लिया है। कृपया असीमित सुझावों का आनंद लेने के लिए VIP में अपग्रेड करें!',
			'create.limit_dialog_btn' => 'VIP में अपग्रेड करें',
			'create.limit_dialog_cancel' => 'बाद में',
			'create.inspire_me_pro' => 'मुझे प्रेरित करें (PRO)',
			'create.trim_title' => 'वीडियो काटें',
			'create.trim_save' => 'सहेजें',
			'create.trimming_loading' => 'वीडियो काटा जा रहा है...',
			'create.please_add_image_first' => 'कृपया पहले एक छवि जोड़ें',
			'leave_dialog.title' => 'बिना सहेजे छोड़ें?',
			'leave_dialog.desc' => 'क्या आप संपादन जारी रखना चाहते हैं या अभी छोड़ना चाहते हैं?',
			'splash.appName' => 'VidoVerse',
			'splash.loading' => 'लोड हो रहा है...',
			'onboarding.page1.title' => 'VidoVerse में आपका स्वागत है',
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
			'profile.imageGeneration' => 'वीडियो निर्माण',
			'home_new.welcomeToAppName' => 'VidoVerse में आपका स्वागत है',
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
			'premium.weekly_desc' => ({required Object price}) => '7-दिन का असीमित एक्सेस, फिर ${price}/सप्ताह',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/सप्ताह',
			'premium.annually' => 'वार्षिक',
			'premium.annually_desc' => ({required Object price}) => 'केवल ${price}/सप्ताह',
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
			'premium.claim_discount' => 'छूट प्राप्त करें',
			'premium.no_thanks' => 'नहीं, धन्यवाद',
			'premium.buy_now' => 'अभी खरीदें',
			'premium.sub_discount_banner' => 'सदस्यता के साथ 50% तक की छूट',
			'premium.unlock_premium_desc' => 'विशेष छूट पर सभी प्रीमियम सुविधाओं को अनलॉक करें',
			'premium.credit_5000' => '5.000 क्रेडिट',
			'premium.price_5000' => '5.999.000 đ',
			'premium.itunes_disclaimer' => 'यदि आप सदस्यता लेते हैं, तो खरीदारी की पुष्टि होने पर आपके iTunes खाते में भुगतान चार्ज किया जाएगा। आपकी सदस्यता स्वचालित रूप से नवीनीकृत होगी जब तक कि वर्तमान बिलिंग अवधि समाप्त होने से कम से कम 24 घंटे पहले रद्द न कर दी जाए। ऑटो-नवीनीकरण को आपके iTunes Store खाता सेटिंग्स में कभी भी प्रबंधित किया जा सकता है।',
			'premium.buy_credit' => 'क्रेडिट खरीदें',
			'premium.save_up_to' => ({required Object percent}) => '${percent}% तक बचाएं',
			'premium.discount_price' => '799.000',
			'premium.discount_price_suffix' => '/वर्ष',
			'premium.billed_yearly' => ({required Object price}) => '${price}/वर्ष बिल किया गया - कभी भी रद्द करें',
			'generating.title' => 'बनाया जा रहा है',
			'generating.your_video' => 'आपका वीडियो',
			'generating.desc' => 'इसमें कुछ मिनट लग सकते हैं।\nकृपया प्रतीक्षा करें...',
			'generating.notify_me' => 'पूरा होने पर मुझे सूचित करें',
			'generating.notified' => 'आपका वीडियो तैयार होने पर हम आपको सूचित करेंगे!',
			'generating.notification_denied' => 'सूचना अनुमति अस्वीकार कर दी गई। कृपया सेटिंग्स में इसे सक्षम करें।',
			'generating.failed' => 'वीडियो बनाने में विफल। कृपया पुनः प्रयास करें।',
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
			'report_dialog.bottom_sheet_title' => 'वीडियो की रिपोर्ट करें',
			'report_dialog.option_offensive' => 'आपत्तिजनक या अनुचित सामग्री',
			'report_dialog.option_quality' => 'खराब गुणवत्ता या विकृत चेहरे',
			'report_dialog.option_copyright' => 'कॉपीराइट का उल्लंघन',
			'report_dialog.option_bug' => 'वीडियो निर्माण त्रुटि या क्रैश',
			'report_dialog.option_other' => 'अन्य समस्याएं',
			'report_dialog.thanks_msg' => 'आपकी रिपोर्ट के लिए धन्यवाद, हम इसकी समीक्षा करेंगे और सुधार करेंगे।',
			'report_dialog.hint_other' => 'कृपया समस्या का विस्तार से वर्णन करें...',
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
			'errors.not_enough_suggestion_free' => 'पर्याप्त मुफ्त सुझाव नहीं हैं, कृपया वीआईपी में अपग्रेड करें',
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
			'errors.video_too_long' => 'वीडियो 10 सेकंड से कम का होना चाहिए।',
			'errors.iap_purchase_cancelled' => 'खरीद रद्द कर दी गई।',
			'errors.iap_purchase_in_progress' => 'खरीद पहले से ही प्रगति पर है।',
			'errors.iap_purchase_failed' => 'खरीद विफल।',
			'guide.step_1' => 'चरण 1',
			'guide.step_2' => 'चरण 2',
			'guide.upload_photo' => 'फोटो अपलोड करें',
			'guide.got_it' => 'मुझे समझ आ गया!',
			'guide.write_prompt' => 'प्रॉम्ट लिखें',
			'guide.upload_2_photos' => '2 फ़ोटो अपलोड करें',
			'guide.generate' => 'बनाएं',
			'guide.upload_portrait' => 'पोर्ट्रेट अपलोड करें',
			'guide.choose_style' => 'शैली चुनें',
			'guide.add_assets' => 'एसेट जोड़ें',
			'checkin.title' => 'दैनिक हाजिरी',
			'checkin.subtitle' => 'रोजाना इनाम पाएं!',
			'checkin.today' => 'आज',
			'checkin.day' => ({required Object n}) => 'दिन ${n}',
			'checkin.check_in_btn' => 'हाजिri लगाएं',
			'checkin.daily_bonus_notification' => 'दैनिक सूचना',
			'checkin.disable_notification_title' => 'चेक-इन सूचनाएं अक्षम करें?',
			'checkin.disable_notification_desc' => 'आप दैनिक लॉगिन पुरस्कार और अन्य रोमांचक बोनस खो देंगे। क्या आप वाकई अक्षम करना चाहते हैं?',
			'checkin.disable_notification_keep' => 'सक्षम रखें',
			'checkin.disable_notification_disable' => 'अक्षम करें',
			'checkin.check_in_success' => ({required Object credits}) => '+${credits} क्रेडिट! दैनिक चेक-इन सफलतापूर्वक पूरा हुआ।',
			'connectivity.no_internet_title' => 'कोई कनेक्शन नहीं',
			'connectivity.no_internet_desc' => 'कृपया ऐप का उपयोग जारी रखने के लिए अपने इंटरनेट कनेक्शन की जांच करें।',
			'connectivity.retry_button' => 'पुनः प्रयास करें',
			'notification.channel_name' => 'महत्वपूर्ण सूचनाएं',
			'notification.channel_description' => 'इस चैनल का उपयोग महत्वपूर्ण सूचनाओं के लिए किया जाता है।',
			'notification.checkin_title' => 'दैनिक चेक-इन अनुस्मारक 🎁',
			'notification.checkin_body' => 'अपने दैनिक मुफ्त क्रेडिट का दावा करने का समय आ गया है! अभी ऐप खोलें।',
			'notification.test_notification' => 'परीक्षण',
			'rating_dialog.title' => 'क्या आप ऐप का आनंद ले रहे हैं?',
			'rating_dialog.desc' => 'कृपया हमें रेट करें और अपना अनुभव बेहतर बनाने में हमारी मदद करें। धन्यवाद!',
			'rating_dialog.support_us' => 'हमारा समर्थन करें',
			'rating_dialog.encourage_us' => 'हमें प्रोत्साहित करें',
			'rating_dialog.rate_on_store' => 'स्टोर पर रेट करें',
			'rating_dialog.maybe_later' => 'शायद बाद में',
			'rating_dialog.success' => 'आपके समर्थन के लिए धन्यवाद!',
			'debug.title' => 'डीबग मेनू',
			'debug.iap_page' => 'आईएपी पेज',
			'debug.buy_credits' => 'क्रेडिट खरीदें',
			'debug.generation_iap' => 'जेनरेशन आईएपी',
			'debug.generation_buy_credits' => 'जेनरेशन क्रेडिट खरीदें',
			'debug.discount' => 'डिस्काउंट पेज',
			'debug.paywall_video' => 'पेवॉल वीडियो पेज',
			'debug.generating_page' => 'जेनरेटिंग पेज पूर्वावलोकन',
			'permission.camera_title' => 'कैमरा अनुमति आवश्यक है',
			'permission.camera_desc' => 'कैमरा अनुमति आवश्यक है। इस सुविधा का उपयोग करने के लिए कृपया इसे सेटिंग्स में सक्षम करें।',
			'permission.photos_title' => 'फ़ोटो अनुमति',
			'permission.photos_desc' => 'फ़ोटो या वीडियो सहेजने के लिए स्टोरेज अनुमति आवश्यक है। कृपया इसे सेटिंग्स में सक्षम करें।',
			'permission.microphone_title' => 'माइक्रोफ़ोन अनुमति',
			'permission.microphone_desc' => 'वीडियो ध्वनि रिकॉर्डिंग के लिए माइक्रोफ़ोन अनुमति आवश्यक है। कृपया इसे सेटिंग्स में सक्षम करें।',
			'permission.notification_title' => 'अधिसूचना अनुमति',
			'permission.notification_desc' => 'दैनिक चेक-इन अनुस्मारक प्राप्त करने के लिए अधिसूचना अनुमति आवश्यक है। कृपया इसे सेटिंग्स में सक्षम करें।',
			'permission.settings' => 'सेटिंग्स',
			'permission.cancel' => 'रद्द करें',
			_ => null,
		};
	}
}
