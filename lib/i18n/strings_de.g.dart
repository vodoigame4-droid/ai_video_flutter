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
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$de common = _Translations$common$de._(_root);
	@override late final _Translations$home$de home = _Translations$home$de._(_root);
	@override late final _Translations$create$de create = _Translations$create$de._(_root);
	@override late final _Translations$leave_dialog$de leave_dialog = _Translations$leave_dialog$de._(_root);
}

// Path: common
class _Translations$common$de extends Translations$common$en {
	_Translations$common$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'Alle anzeigen';
	@override String get stay => 'Bleiben';
	@override String get leave => 'Verlassen';
	@override String get camera => 'Kamera';
	@override String get gallery => 'Galerie';
	@override String get generate => 'Generieren';
}

// Path: home
class _Translations$home$de extends Translations$home$en {
	_Translations$home$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video KI';
	@override String get trending => 'Angesagt';
	@override String get new_section => 'Neu';
	@override String get toy_box => 'Spielzeugfiguren-Box';
	@override String get epic_morph => 'Epic Morph';
	@override String get anime => 'Anime';
	@override String get discover => 'Entdecken';
}

// Path: create
class _Translations$create$de extends Translations$create$en {
	_Translations$create$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'Selfie Aquaman';
	@override String get tap_upload => 'Hier tippen, um Foto hochzuladen.';
	@override String get select_upload_title => 'Auswählen, um Foto hochzuladen';
	@override String get upload_image => 'Bild hochladen';
	@override String get custom_prompt => 'Benutzerdefinierter Prompt';
	@override String get prompt_placeholder => 'Realistisches Frauenporträt, Nahaufnahme, Blick in die Kamera, natürliches Blinken, blaue Studiobeleuchtung, cineastisch, extrem detailliert';
	@override String get inspire_me => 'Inspiriere mich';
	@override String get video_settings => 'Video-Einstellungen';
	@override String get quality => 'Qualität';
	@override String get quality_desc => 'Videoqualität auswählen';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'Dauer';
	@override String get duration_desc => 'Videolänge auswählen';
	@override String get sec_4s => '4s';
	@override String get sec_8s => '8s';
	@override String get sec_5s => '5s';
	@override String get sec_10s => '10s';
	@override String get sec_15s => '15s';
}

// Path: leave_dialog
class _Translations$leave_dialog$de extends Translations$leave_dialog$en {
	_Translations$leave_dialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verlassen ohne zu speichern?';
	@override String get desc => 'Möchten Sie die Bearbeitung fortsetzen oder jetzt verlassen?';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'Alle anzeigen',
			'common.stay' => 'Bleiben',
			'common.leave' => 'Verlassen',
			'common.camera' => 'Kamera',
			'common.gallery' => 'Galerie',
			'common.generate' => 'Generieren',
			'home.title' => 'Video KI',
			'home.trending' => 'Angesagt',
			'home.new_section' => 'Neu',
			'home.toy_box' => 'Spielzeugfiguren-Box',
			'home.epic_morph' => 'Epic Morph',
			'home.anime' => 'Anime',
			'home.discover' => 'Entdecken',
			'create.selfie_aquaman' => 'Selfie Aquaman',
			'create.tap_upload' => 'Hier tippen, um Foto hochzuladen.',
			'create.select_upload_title' => 'Auswählen, um Foto hochzuladen',
			'create.upload_image' => 'Bild hochladen',
			'create.custom_prompt' => 'Benutzerdefinierter Prompt',
			'create.prompt_placeholder' => 'Realistisches Frauenporträt, Nahaufnahme, Blick in die Kamera, natürliches Blinken, blaue Studiobeleuchtung, cineastisch, extrem detailliert',
			'create.inspire_me' => 'Inspiriere mich',
			'create.video_settings' => 'Video-Einstellungen',
			'create.quality' => 'Qualität',
			'create.quality_desc' => 'Videoqualität auswählen',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Dauer',
			'create.duration_desc' => 'Videolänge auswählen',
			'create.sec_4s' => '4s',
			'create.sec_8s' => '8s',
			'create.sec_5s' => '5s',
			'create.sec_10s' => '10s',
			'create.sec_15s' => '15s',
			'leave_dialog.title' => 'Verlassen ohne zu speichern?',
			'leave_dialog.desc' => 'Möchten Sie die Bearbeitung fortsetzen oder jetzt verlassen?',
			_ => null,
		};
	}
}
