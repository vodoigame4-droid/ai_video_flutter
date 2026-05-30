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
	@override late final _Translations$splash$ar splash = _Translations$splash$ar._(_root);
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
	@override late final _Translations$dashboard$ar dashboard = _Translations$dashboard$ar._(_root);
	@override late final _Translations$profile$ar profile = _Translations$profile$ar._(_root);
	@override late final _Translations$home_new$ar home_new = _Translations$home_new$ar._(_root);
	@override late final _Translations$templates$ar templates = _Translations$templates$ar._(_root);
	@override late final _Translations$settings$ar settings = _Translations$settings$ar._(_root);
	@override late final _Translations$language$ar language = _Translations$language$ar._(_root);
	@override late final _Translations$premium$ar premium = _Translations$premium$ar._(_root);
	@override late final _Translations$generating$ar generating = _Translations$generating$ar._(_root);
	@override late final _Translations$result$ar result = _Translations$result$ar._(_root);
	@override late final _Translations$privacy_dialog$ar privacy_dialog = _Translations$privacy_dialog$ar._(_root);
	@override late final _Translations$report_dialog$ar report_dialog = _Translations$report_dialog$ar._(_root);
	@override late final _Translations$tips_sheet$ar tips_sheet = _Translations$tips_sheet$ar._(_root);
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
	@override String get generate_title => 'إنشاء';
	@override String get upload_first_photo => 'تحميل الصورة الأولى.';
	@override String get upload_last_photo => 'تحميل الصورة الأخيرة.';
	@override String get upload_video_slot => 'تحميل الفيديو.';
	@override String get upload_photo_slot => 'تحميل الصورة.';
	@override String photo_slot_num({required Object num}) => 'صورة ${num}';
	@override String get required_label => 'مطلوب';
	@override String get optional_label => 'اختياري';
	@override String inspire_me_count({required Object count}) => 'ألهمني (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => 'جاري إنشاء الفيديو الخاص بك...';
	@override String get select_mock_media => 'حدد وسائط وهمية';
	@override String get select_media_desc => 'حدد ملفًا وهميًا لمحاكاة التحميل';
}

// Path: leave_dialog
class _Translations$leave_dialog$ar extends Translations$leave_dialog$en {
	_Translations$leave_dialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'هل تريد المغادرة دون حفظ؟';
	@override String get desc => 'هل تريد متابعة التحرير أم المغادرة الآن؟';
}

// Path: splash
class _Translations$splash$ar extends Translations$splash$en {
	_Translations$splash$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get appName => 'فيديو ذكاء اصطناعي';
}

// Path: onboarding
class _Translations$onboarding$ar extends Translations$onboarding$en {
	_Translations$onboarding$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$ar page1 = _Translations$onboarding$page1$ar._(_root);
	@override late final _Translations$onboarding$page2$ar page2 = _Translations$onboarding$page2$ar._(_root);
	@override late final _Translations$onboarding$page3$ar page3 = _Translations$onboarding$page3$ar._(_root);
	@override late final _Translations$onboarding$page4$ar page4 = _Translations$onboarding$page4$ar._(_root);
	@override late final _Translations$onboarding$page5$ar page5 = _Translations$onboarding$page5$ar._(_root);
}

// Path: dashboard
class _Translations$dashboard$ar extends Translations$dashboard$en {
	_Translations$dashboard$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الرئيسية';
	@override String get user => 'حسابي';
	@override String get createVideo => 'إنشاء فيديو';
}

// Path: profile
class _Translations$profile$ar extends Translations$profile$en {
	_Translations$profile$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الحساب الشخصي';
	@override String get upgradeTitle => 'الترقية للمميز';
	@override String get upgradeSubtitle => 'إضافة رصيد - بدون علامة مائية';
	@override String get goPremium => 'اشترك في المميز';
	@override String get myVideo => 'فيديوهاتي';
	@override String get liked => 'أعجبني';
	@override String get noVideos => 'لا توجد فيديوهات بعد';
	@override String get noVideosDesc => 'أنشئ أول فيديو ذكاء اصطناعي لك وسيظهر هنا.';
	@override String get deleteTitle => 'حذف هذا الفيديو؟';
	@override String get deleteDesc => 'هل أنت متأكد أنك تريد حذف هذا الفيديو؟ لا يمكن التراجع عن هذا الإجراء.';
	@override String get cancel => 'إلغاء';
	@override String get delete => 'حذف';
	@override String get generating => 'جاري الإنشاء...';
	@override String get imageGeneration => 'إنشاء الصور';
}

// Path: home_new
class _Translations$home_new$ar extends Translations$home_new$en {
	_Translations$home_new$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'مرحبًا بك في فيديو ذكاء اصطناعي';
	@override String get imageToVideo => 'صورة إلى\nفيديو';
	@override String get transitionVideo => 'فيديو\nانتقالي';
	@override String get imageToDance => 'صورة إلى\nرقص';
	@override String get unifiedVideo => 'فيديو\nموحد';
}

// Path: templates
class _Translations$templates$ar extends Translations$templates$en {
	_Translations$templates$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'القوالب';
	@override String get all => 'الكل';
	@override String get pro => 'برو';
}

// Path: settings
class _Translations$settings$ar extends Translations$settings$en {
	_Translations$settings$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override String get language => 'اللغة';
	@override String get termsOfService => 'شروط الخدمة';
	@override String get privacyPolicy => 'سياسة الخصوصية';
	@override String get contactUs => 'اتصل بنا';
	@override String get version => 'الإصدار';
	@override String get myCredits => 'رصيدي';
	@override String get rateApp => 'قيم التطبيق';
	@override String get userCode => 'رمز المستخدم';
	@override String get copied => 'تم النسخ إلى الحافظة!';
	@override String get termsOfUse => 'شروط الاستخدام';
}

// Path: language
class _Translations$language$ar extends Translations$language$en {
	_Translations$language$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اللغة';
	@override String get en => 'الإنجليزية';
	@override String get ar => 'العربية';
	@override String get de => 'الألمانية';
	@override String get es => 'الإسبانية';
	@override String get fr => 'الفرنسية';
	@override String get hi => 'الهندية';
	@override String get id => 'الإندونيسية';
	@override String get ja => 'اليابانية';
	@override String get ko => 'الكورية';
	@override String get pt => 'البرتغالية';
	@override String get vi => 'الفيتنامية';
	@override String get zh => 'الصينية';
}

// Path: premium
class _Translations$premium$ar extends Translations$premium$en {
	_Translations$premium$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => 'اضغط للكشف';
	@override String get weekly => 'أسبوعي';
	@override String get weekly_desc => 'وصول غير محدود لمدة 7 أيام، ثم 249.000đ/أسبوع';
	@override String get weekly_price => '199.000 د.إ';
	@override String get weekly_suffix => '/أسبوع';
	@override String get annually => 'سنوي';
	@override String get annually_desc => 'فقط 24.980đ/أسبوع';
	@override String get annually_price => '1.299.000 د.إ';
	@override String get annually_suffix => '/سنة';
	@override String get best_value => 'أفضل قيمة';
	@override String get save_80 => 'وفر 80%';
	@override String get start_free_trial => 'ابدأ الفترة التجريبية المجانية';
	@override String get start_my_subscription => 'ابدأ اشتراكي';
	@override String get auto_renewable => 'يتجدد تلقائياً. يمكنك الإلغاء في أي وقت.';
	@override String get privacy_policy => 'سياسة الخصوصية';
	@override String get terms_of_use => 'شروط الاستخدام';
	@override String get restore => 'استعادة';
	@override String get unlock_templates => 'فتح أكثر من 200 قالب';
	@override String get fast_generation => 'إنشاء فيديو سريع';
	@override String get discount_packs => 'خصم 50% على حزم الرصيد';
	@override String get videos_per_year => '80 فيديو سنوياً';
	@override String get buy_more_credit => 'شراء المزيد من الرصيد';
	@override String get credit_desc => '35 رصيد ينشئ فيديو واحد. لا توجد إعلانات أثناء استخدام الرصيد المشترى.';
	@override String get credit_70 => '70 رصيد';
	@override String get credit_150 => '150 رصيد';
	@override String get credit_350 => '350 رصيد';
	@override String get credit_500 => '500 رصيد';
	@override String get credit_1000 => '1.000 رصيد';
	@override String get credit_6000 => '6.000 رصيد';
	@override String approx_videos({required Object count}) => '(~ ${count} فيديو)';
	@override String get price_70 => '149.000 د.إ';
	@override String get price_150 => '299.000 د.إ';
	@override String get price_350 => '599.000 د.إ';
	@override String get price_500 => '799.000 د.إ';
	@override String get price_1000 => '1.499.000 د.إ';
	@override String get price_6000 => '5.999.000 د.إ';
	@override String get most_popular => 'الأكثر شيوعاً';
	@override String purchase_success({required Object item}) => 'تم الشراء بنجاح: ${item}';
	@override String get purchase_failed => 'فشلت عملية الشراء.';
	@override String get credit_packages => 'حزم الرصيد';
	@override String get buy_credit_now => 'شراء رصيد الآن';
	@override String get pro_title => 'بريميوم';
	@override String get discount_title => 'خصم 50%';
	@override String get discount_subtitle => 'أسعار الرصيد';
}

// Path: generating
class _Translations$generating$ar extends Translations$generating$en {
	_Translations$generating$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'جاري الإنشاء';
	@override String get your_video => 'الفيديو الخاص بك';
	@override String get desc => 'قد يستغرق هذا بضع دقائق.\nيرجى الانتظار...';
	@override String get notify_me => 'أبلغني عند الانتهاء';
	@override String get notified => 'سنقوم بإخطارك عندما يكون الفيديو الخاص بك جاهزًا!';
	@override String get notification_denied => 'تم رفض إذن الإشعارات. يرجى تفعيله من الإعدادات.';
}

// Path: result
class _Translations$result$ar extends Translations$result$en {
	_Translations$result$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'فيديو النتيجة';
	@override String ready_message({required Object title}) => 'الفيديو الخاص بك ${title} جاهز!';
	@override String get regenerate => 'إعادة التوليد';
	@override String get create_another => 'إنشاء فيديو آخر';
	@override String get share => 'مشاركة';
	@override String get download => 'تنزيل';
	@override String get extend_video => 'تمديد الفيديو';
	@override String get extends_title => 'امتدادات';
	@override String get delete => 'حذف';
	@override String get share_success => 'تم نسخ رابط الفيديو للمشاركة';
	@override String get download_success => 'تم حفظ الفيديو في المعرض';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$ar extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خصوصية البيانات';
	@override String get desc => 'يتم معالجة صورك بأمان بواسطة أنظمة الذكاء الاصطناعي الداخلية لدينا. نحن لا نشارك أو نبيع أو نكشف عن معلوماتك لأي طرف ثالث.';
	@override String get cancel => 'إلغاء';
	@override String get confirm => 'تأكيد';
}

// Path: report_dialog
class _Translations$report_dialog$ar extends Translations$report_dialog$en {
	_Translations$report_dialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إبلاغ';
	@override String get desc => 'هل أنت متأكد أنك تريد إرسال الإبلاغ؟';
	@override String get cancel => 'إلغاء';
	@override String get submit => 'إرسال';
	@override String get success => 'تم الإبلاغ عن الفيديو بنجاح';
}

// Path: tips_sheet
class _Translations$tips_sheet$ar extends Translations$tips_sheet$en {
	_Translations$tips_sheet$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'نصائح لأفضل النتائج';
	@override String get button_got_it => 'فهمت ذلك!';
	@override String get use_photos => 'استخدم صوراً مثل هذه';
	@override String get avoid_photos => 'تجنب صوراً مثل هذه';
	@override String get one_person => 'شخص واحد';
	@override String get clear_face => 'وجه واضح';
	@override String get half_body => 'نصف الجسم';
	@override String get hidden_face => 'وجه مخفي';
	@override String get multiple_people => 'عدة أشخاص';
	@override String get blurry_photo => 'صورة ضبابية';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$ar extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مرحبًا بك في فيديو ذكاء اصطناعي';
	@override String get subtitle => 'رحلتك الإبداعية تبدأ من هنا...';
	@override String get button => 'البدء';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$ar extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'صورة إلى فيديو';
	@override String get subtitle => 'تحميل الصورة، كتابة المطالبة';
	@override String get button => 'متابعة';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$ar extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'صورتين إلى فيديو';
	@override String get subtitle => 'تحميل صورتين، كتابة المطالبة';
	@override String get button => 'متابعة';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$ar extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'رقص الصورة';
	@override String get subtitle => 'تحميل فيديو واحد وصورة واحدة';
	@override String get button => 'متابعة';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$ar extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'دمج الفيديو';
	@override String get subtitle => 'تحميل صورك';
	@override String get button => 'متابعة';
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
			'create.generate_title' => 'إنشاء',
			'create.upload_first_photo' => 'تحميل الصورة الأولى.',
			'create.upload_last_photo' => 'تحميل الصورة الأخيرة.',
			'create.upload_video_slot' => 'تحميل الفيديو.',
			'create.upload_photo_slot' => 'تحميل الصورة.',
			'create.photo_slot_num' => ({required Object num}) => 'صورة ${num}',
			'create.required_label' => 'مطلوب',
			'create.optional_label' => 'اختياري',
			'create.inspire_me_count' => ({required Object count}) => 'ألهمني (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'جاري إنشاء الفيديو الخاص بك...',
			'create.select_mock_media' => 'حدد وسائط وهمية',
			'create.select_media_desc' => 'حدد ملفًا وهميًا لمحاكاة التحميل',
			'leave_dialog.title' => 'هل تريد المغادرة دون حفظ؟',
			'leave_dialog.desc' => 'هل تريد متابعة التحرير أم المغادرة الآن؟',
			'splash.appName' => 'فيديو ذكاء اصطناعي',
			'onboarding.page1.title' => 'مرحبًا بك في فيديو ذكاء اصطناعي',
			'onboarding.page1.subtitle' => 'رحلتك الإبداعية تبدأ من هنا...',
			'onboarding.page1.button' => 'البدء',
			'onboarding.page2.title' => 'صورة إلى فيديو',
			'onboarding.page2.subtitle' => 'تحميل الصورة، كتابة المطالبة',
			'onboarding.page2.button' => 'متابعة',
			'onboarding.page3.title' => 'صورتين إلى فيديو',
			'onboarding.page3.subtitle' => 'تحميل صورتين، كتابة المطالبة',
			'onboarding.page3.button' => 'متابعة',
			'onboarding.page4.title' => 'رقص الصورة',
			'onboarding.page4.subtitle' => 'تحميل فيديو واحد وصورة واحدة',
			'onboarding.page4.button' => 'متابعة',
			'onboarding.page5.title' => 'دمج الفيديو',
			'onboarding.page5.subtitle' => 'تحميل صورك',
			'onboarding.page5.button' => 'متابعة',
			'dashboard.home' => 'الرئيسية',
			'dashboard.user' => 'حسابي',
			'dashboard.createVideo' => 'إنشاء فيديو',
			'profile.title' => 'الحساب الشخصي',
			'profile.upgradeTitle' => 'الترقية للمميز',
			'profile.upgradeSubtitle' => 'إضافة رصيد - بدون علامة مائية',
			'profile.goPremium' => 'اشترك في المميز',
			'profile.myVideo' => 'فيديوهاتي',
			'profile.liked' => 'أعجبني',
			'profile.noVideos' => 'لا توجد فيديوهات بعد',
			'profile.noVideosDesc' => 'أنشئ أول فيديو ذكاء اصطناعي لك وسيظهر هنا.',
			'profile.deleteTitle' => 'حذف هذا الفيديو؟',
			'profile.deleteDesc' => 'هل أنت متأكد أنك تريد حذف هذا الفيديو؟ لا يمكن التراجع عن هذا الإجراء.',
			'profile.cancel' => 'إلغاء',
			'profile.delete' => 'حذف',
			'profile.generating' => 'جاري الإنشاء...',
			'profile.imageGeneration' => 'إنشاء الصور',
			'home_new.welcomeToAppName' => 'مرحبًا بك في فيديو ذكاء اصطناعي',
			'home_new.imageToVideo' => 'صورة إلى\nفيديو',
			'home_new.transitionVideo' => 'فيديو\nانتقالي',
			'home_new.imageToDance' => 'صورة إلى\nرقص',
			'home_new.unifiedVideo' => 'فيديو\nموحد',
			'templates.title' => 'القوالب',
			'templates.all' => 'الكل',
			'templates.pro' => 'برو',
			'settings.title' => 'الإعدادات',
			'settings.language' => 'اللغة',
			'settings.termsOfService' => 'شروط الخدمة',
			'settings.privacyPolicy' => 'سياسة الخصوصية',
			'settings.contactUs' => 'اتصل بنا',
			'settings.version' => 'الإصدار',
			'settings.myCredits' => 'رصيدي',
			'settings.rateApp' => 'قيم التطبيق',
			'settings.userCode' => 'رمز المستخدم',
			'settings.copied' => 'تم النسخ إلى الحافظة!',
			'settings.termsOfUse' => 'شروط الاستخدام',
			'language.title' => 'اللغة',
			'language.en' => 'الإنجليزية',
			'language.ar' => 'العربية',
			'language.de' => 'الألمانية',
			'language.es' => 'الإسبانية',
			'language.fr' => 'الفرنسية',
			'language.hi' => 'الهندية',
			'language.id' => 'الإندونيسية',
			'language.ja' => 'اليابانية',
			'language.ko' => 'الكورية',
			'language.pt' => 'البرتغالية',
			'language.vi' => 'الفيتنامية',
			'language.zh' => 'الصينية',
			'premium.tap_to_reveal' => 'اضغط للكشف',
			'premium.weekly' => 'أسبوعي',
			'premium.weekly_desc' => 'وصول غير محدود لمدة 7 أيام، ثم 249.000đ/أسبوع',
			'premium.weekly_price' => '199.000 د.إ',
			'premium.weekly_suffix' => '/أسبوع',
			'premium.annually' => 'سنوي',
			'premium.annually_desc' => 'فقط 24.980đ/أسبوع',
			'premium.annually_price' => '1.299.000 د.إ',
			'premium.annually_suffix' => '/سنة',
			'premium.best_value' => 'أفضل قيمة',
			'premium.save_80' => 'وفر 80%',
			'premium.start_free_trial' => 'ابدأ الفترة التجريبية المجانية',
			'premium.start_my_subscription' => 'ابدأ اشتراكي',
			'premium.auto_renewable' => 'يتجدد تلقائياً. يمكنك الإلغاء في أي وقت.',
			'premium.privacy_policy' => 'سياسة الخصوصية',
			'premium.terms_of_use' => 'شروط الاستخدام',
			'premium.restore' => 'استعادة',
			'premium.unlock_templates' => 'فتح أكثر من 200 قالب',
			'premium.fast_generation' => 'إنشاء فيديو سريع',
			'premium.discount_packs' => 'خصم 50% على حزم الرصيد',
			'premium.videos_per_year' => '80 فيديو سنوياً',
			'premium.buy_more_credit' => 'شراء المزيد من الرصيد',
			'premium.credit_desc' => '35 رصيد ينشئ فيديو واحد. لا توجد إعلانات أثناء استخدام الرصيد المشترى.',
			'premium.credit_70' => '70 رصيد',
			'premium.credit_150' => '150 رصيد',
			'premium.credit_350' => '350 رصيد',
			'premium.credit_500' => '500 رصيد',
			'premium.credit_1000' => '1.000 رصيد',
			'premium.credit_6000' => '6.000 رصيد',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} فيديو)',
			'premium.price_70' => '149.000 د.إ',
			'premium.price_150' => '299.000 د.إ',
			'premium.price_350' => '599.000 د.إ',
			'premium.price_500' => '799.000 د.إ',
			'premium.price_1000' => '1.499.000 د.إ',
			'premium.price_6000' => '5.999.000 د.إ',
			'premium.most_popular' => 'الأكثر شيوعاً',
			'premium.purchase_success' => ({required Object item}) => 'تم الشراء بنجاح: ${item}',
			'premium.purchase_failed' => 'فشلت عملية الشراء.',
			'premium.credit_packages' => 'حزم الرصيد',
			'premium.buy_credit_now' => 'شراء رصيد الآن',
			'premium.pro_title' => 'بريميوم',
			'premium.discount_title' => 'خصم 50%',
			'premium.discount_subtitle' => 'أسعار الرصيد',
			'generating.title' => 'جاري الإنشاء',
			'generating.your_video' => 'الفيديو الخاص بك',
			'generating.desc' => 'قد يستغرق هذا بضع دقائق.\nيرجى الانتظار...',
			'generating.notify_me' => 'أبلغني عند الانتهاء',
			'generating.notified' => 'سنقوم بإخطارك عندما يكون الفيديو الخاص بك جاهزًا!',
			'generating.notification_denied' => 'تم رفض إذن الإشعارات. يرجى تفعيله من الإعدادات.',
			'result.title' => 'فيديو النتيجة',
			'result.ready_message' => ({required Object title}) => 'الفيديو الخاص بك ${title} جاهز!',
			'result.regenerate' => 'إعادة التوليد',
			'result.create_another' => 'إنشاء فيديو آخر',
			'result.share' => 'مشاركة',
			'result.download' => 'تنزيل',
			'result.extend_video' => 'تمديد الفيديو',
			'result.extends_title' => 'امتدادات',
			'result.delete' => 'حذف',
			'result.share_success' => 'تم نسخ رابط الفيديو للمشاركة',
			'result.download_success' => 'تم حفظ الفيديو في المعرض',
			'privacy_dialog.title' => 'خصوصية البيانات',
			'privacy_dialog.desc' => 'يتم معالجة صورك بأمان بواسطة أنظمة الذكاء الاصطناعي الداخلية لدينا. نحن لا نشارك أو نبيع أو نكشف عن معلوماتك لأي طرف ثالث.',
			'privacy_dialog.cancel' => 'إلغاء',
			'privacy_dialog.confirm' => 'تأكيد',
			'report_dialog.title' => 'إبلاغ',
			'report_dialog.desc' => 'هل أنت متأكد أنك تريد إرسال الإبلاغ؟',
			'report_dialog.cancel' => 'إلغاء',
			'report_dialog.submit' => 'إرسال',
			'report_dialog.success' => 'تم الإبلاغ عن الفيديو بنجاح',
			'tips_sheet.title' => 'نصائح لأفضل النتائج',
			'tips_sheet.button_got_it' => 'فهمت ذلك!',
			'tips_sheet.use_photos' => 'استخدم صوراً مثل هذه',
			'tips_sheet.avoid_photos' => 'تجنب صوراً مثل هذه',
			'tips_sheet.one_person' => 'شخص واحد',
			'tips_sheet.clear_face' => 'وجه واضح',
			'tips_sheet.half_body' => 'نصف الجسم',
			'tips_sheet.hidden_face' => 'وجه مخفي',
			'tips_sheet.multiple_people' => 'عدة أشخاص',
			'tips_sheet.blurry_photo' => 'صورة ضبابية',
			_ => null,
		};
	}
}
