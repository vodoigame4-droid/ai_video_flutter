///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$common$en common = Translations$common$en.internal(_root);
	late final Translations$home$en home = Translations$home$en.internal(_root);
	late final Translations$create$en create = Translations$create$en.internal(_root);
	late final Translations$leave_dialog$en leave_dialog = Translations$leave_dialog$en.internal(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'PRO'
	String get pro => 'PRO';

	/// en: 'See all'
	String get see_all => 'See all';

	/// en: 'Stay'
	String get stay => 'Stay';

	/// en: 'Leave'
	String get leave => 'Leave';

	/// en: 'Camera'
	String get camera => 'Camera';

	/// en: 'Gallery'
	String get gallery => 'Gallery';

	/// en: 'Generate'
	String get generate => 'Generate';
}

// Path: home
class Translations$home$en {
	Translations$home$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Video AI'
	String get title => 'Video AI';

	/// en: 'Trending'
	String get trending => 'Trending';

	/// en: 'New'
	String get new_section => 'New';

	/// en: 'Toy Figura Box'
	String get toy_box => 'Toy Figura Box';

	/// en: 'Epic Morph'
	String get epic_morph => 'Epic Morph';

	/// en: 'Anime'
	String get anime => 'Anime';

	/// en: 'Discover'
	String get discover => 'Discover';
}

// Path: create
class Translations$create$en {
	Translations$create$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Selfie Aquaman'
	String get selfie_aquaman => 'Selfie Aquaman';

	/// en: 'Tap here to upload your photo.'
	String get tap_upload => 'Tap here to upload your photo.';

	/// en: 'Select to Upload Your Photo'
	String get select_upload_title => 'Select to Upload Your Photo';

	/// en: 'Upload Image'
	String get upload_image => 'Upload Image';

	/// en: 'Custom Prompt'
	String get custom_prompt => 'Custom Prompt';

	/// en: 'Realistic female portrait, close-up, looking at camera, blinking naturally, blue studio lighting, cinematic, ultra detailed'
	String get prompt_placeholder => 'Realistic female portrait, close-up, looking at camera, blinking naturally, blue studio lighting, cinematic, ultra detailed';

	/// en: 'Inspire me'
	String get inspire_me => 'Inspire me';

	/// en: 'Video Settings'
	String get video_settings => 'Video Settings';

	/// en: 'Quality'
	String get quality => 'Quality';

	/// en: 'Choose video quality'
	String get quality_desc => 'Choose video quality';

	/// en: 'HD'
	String get hd => 'HD';

	/// en: 'Full HD'
	String get full_hd => 'Full HD';

	/// en: 'Duration'
	String get duration => 'Duration';

	/// en: 'Choose video length'
	String get duration_desc => 'Choose video length';

	/// en: '4s'
	String get sec_4s => '4s';

	/// en: '8s'
	String get sec_8s => '8s';

	/// en: '5s'
	String get sec_5s => '5s';

	/// en: '10s'
	String get sec_10s => '10s';

	/// en: '15s'
	String get sec_15s => '15s';
}

// Path: leave_dialog
class Translations$leave_dialog$en {
	Translations$leave_dialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Leave without saving?'
	String get title => 'Leave without saving?';

	/// en: 'Do you want to continue editing or leave now?'
	String get desc => 'Do you want to continue editing or leave now?';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'See all',
			'common.stay' => 'Stay',
			'common.leave' => 'Leave',
			'common.camera' => 'Camera',
			'common.gallery' => 'Gallery',
			'common.generate' => 'Generate',
			'home.title' => 'Video AI',
			'home.trending' => 'Trending',
			'home.new_section' => 'New',
			'home.toy_box' => 'Toy Figura Box',
			'home.epic_morph' => 'Epic Morph',
			'home.anime' => 'Anime',
			'home.discover' => 'Discover',
			'create.selfie_aquaman' => 'Selfie Aquaman',
			'create.tap_upload' => 'Tap here to upload your photo.',
			'create.select_upload_title' => 'Select to Upload Your Photo',
			'create.upload_image' => 'Upload Image',
			'create.custom_prompt' => 'Custom Prompt',
			'create.prompt_placeholder' => 'Realistic female portrait, close-up, looking at camera, blinking naturally, blue studio lighting, cinematic, ultra detailed',
			'create.inspire_me' => 'Inspire me',
			'create.video_settings' => 'Video Settings',
			'create.quality' => 'Quality',
			'create.quality_desc' => 'Choose video quality',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Duration',
			'create.duration_desc' => 'Choose video length',
			'create.sec_4s' => '4s',
			'create.sec_8s' => '8s',
			'create.sec_5s' => '5s',
			'create.sec_10s' => '10s',
			'create.sec_15s' => '15s',
			'leave_dialog.title' => 'Leave without saving?',
			'leave_dialog.desc' => 'Do you want to continue editing or leave now?',
			_ => null,
		};
	}
}
