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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
	@override late final _Translations$home$ar home = _Translations$home$ar._(_root);
	@override late final _Translations$create$ar create = _Translations$create$ar._(_root);
	@override late final _Translations$leave_dialog$ar leave_dialog = _Translations$leave_dialog$ar._(_root);
}

// Path: common
class _Translations$common$ar extends Translations$common$en {
	_Translations$common$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get pro => 'برو';
	@override String get see_all => 'عرض الكل';
	@override String get stay => 'البقاء';
	@override String get leave => 'مغادرة';
	@override String get camera => 'الكاميرا';
	@override String get gallery => 'المعرض';
	@override String get generate => 'توليد';
}

// Path: home
class _Translations$home$ar extends Translations$home$en {
	_Translations$home$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'فيديو الذكاء الاصطناعي';
	@override String get trending => 'شائع';
	@override String get new_section => 'جديد';
	@override String get toy_box => 'صندوق ألعاب مجسمات';
	@override String get epic_morph => 'تحول ملحمي';
	@override String get anime => 'أنيمي';
	@override String get discover => 'اكتشاف';
}

// Path: create
class _Translations$create$ar extends Translations$create$en {
	_Translations$create$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'سيلفي أكوامان';
	@override String get tap_upload => 'اضغط هنا لتحميل صورتك.';
	@override String get select_upload_title => 'حدد لتحميل صورتك';
	@override String get upload_image => 'تحميل الصورة';
	@override String get custom_prompt => 'موجّه مخصص';
	@override String get prompt_placeholder => 'صورة واقعية لامرأة، لقطة مقربة، تنظر إلى الكاميرا، ترمش بشكل طبيعي، إضاءة استوديو زرقاء، سينمائية، فائقة التفاصيل';
	@override String get inspire_me => 'ألهمني';
	@override String get video_settings => 'إعدادات الفيديو';
	@override String get quality => 'الجودة';
	@override String get quality_desc => 'اختر جودة الفيديو';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'المدة';
	@override String get duration_desc => 'اختر طول الفيديو';
	@override String get sec_4s => '٤ ثواني';
	@override String get sec_8s => '٨ ثواني';
	@override String get sec_5s => '٥ ثواني';
	@override String get sec_10s => '١٠ ثواني';
	@override String get sec_15s => '١٥ ثانية';
}

// Path: leave_dialog
class _Translations$leave_dialog$ar extends Translations$leave_dialog$en {
	_Translations$leave_dialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'هل تريد المغادرة دون حفظ؟';
	@override String get desc => 'هل تريد متابعة التحرير أم المغادرة الآن؟';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'برو',
			'common.see_all' => 'عرض الكل',
			'common.stay' => 'البقاء',
			'common.leave' => 'مغادرة',
			'common.camera' => 'الكاميرا',
			'common.gallery' => 'المعرض',
			'common.generate' => 'توليد',
			'home.title' => 'فيديو الذكاء الاصطناعي',
			'home.trending' => 'شائع',
			'home.new_section' => 'جديد',
			'home.toy_box' => 'صندوق ألعاب مجسمات',
			'home.epic_morph' => 'تحول ملحمي',
			'home.anime' => 'أنيمي',
			'home.discover' => 'اكتشاف',
			'create.selfie_aquaman' => 'سيلفي أكوامان',
			'create.tap_upload' => 'اضغط هنا لتحميل صورتك.',
			'create.select_upload_title' => 'حدد لتحميل صورتك',
			'create.upload_image' => 'تحميل الصورة',
			'create.custom_prompt' => 'موجّه مخصص',
			'create.prompt_placeholder' => 'صورة واقعية لامرأة، لقطة مقربة، تنظر إلى الكاميرا، ترمش بشكل طبيعي، إضاءة استوديو زرقاء، سينمائية، فائقة التفاصيل',
			'create.inspire_me' => 'ألهمني',
			'create.video_settings' => 'إعدادات الفيديو',
			'create.quality' => 'الجودة',
			'create.quality_desc' => 'اختر جودة الفيديو',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'المدة',
			'create.duration_desc' => 'اختر طول الفيديو',
			'create.sec_4s' => '٤ ثواني',
			'create.sec_8s' => '٨ ثواني',
			'create.sec_5s' => '٥ ثواني',
			'create.sec_10s' => '١٠ ثواني',
			'create.sec_15s' => '١٥ ثانية',
			'leave_dialog.title' => 'هل تريد المغادرة دون حفظ؟',
			'leave_dialog.desc' => 'هل تريد متابعة التحرير أم المغادرة الآن؟',
			_ => null,
		};
	}
}
