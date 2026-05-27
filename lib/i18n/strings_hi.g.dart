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
			'leave_dialog.title' => 'बिना सहेजे छोड़ें?',
			'leave_dialog.desc' => 'क्या आप संपादन जारी रखना चाहते हैं या अभी छोड़ना चाहते हैं?',
			'splash.appName' => 'वीडियो एआई',
			_ => null,
		};
	}
}
