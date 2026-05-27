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
	@override late final _Translations$splash$de splash = _Translations$splash$de._(_root);
	@override late final _Translations$onboarding$de onboarding = _Translations$onboarding$de._(_root);
	@override late final _Translations$dashboard$de dashboard = _Translations$dashboard$de._(_root);
	@override late final _Translations$profile$de profile = _Translations$profile$de._(_root);
	@override late final _Translations$home_new$de home_new = _Translations$home_new$de._(_root);
	@override late final _Translations$templates$de templates = _Translations$templates$de._(_root);
	@override late final _Translations$settings$de settings = _Translations$settings$de._(_root);
	@override late final _Translations$language$de language = _Translations$language$de._(_root);
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
	@override String get generate_title => 'Generieren';
	@override String get upload_first_photo => 'Erstes Foto hochladen.';
	@override String get upload_last_photo => 'Letztes Foto hochladen.';
	@override String get upload_video_slot => 'Video hochladen.';
	@override String get upload_photo_slot => 'Foto hochladen.';
	@override String photo_slot_num({required Object num}) => 'Foto ${num}';
	@override String get required_label => 'Erforderlich';
	@override String get optional_label => 'Optional';
	@override String inspire_me_count({required Object count}) => 'Inspiriere mich (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => 'Video wird generiert...';
	@override String get select_mock_media => 'Mock-Medien auswählen';
	@override String get select_media_desc => 'Wählen Sie eine Mock-Datei aus, um den Upload zu simulieren';
}

// Path: leave_dialog
class _Translations$leave_dialog$de extends Translations$leave_dialog$en {
	_Translations$leave_dialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verlassen ohne zu speichern?';
	@override String get desc => 'Möchten Sie die Bearbeitung fortsetzen oder jetzt verlassen?';
}

// Path: splash
class _Translations$splash$de extends Translations$splash$en {
	_Translations$splash$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Video AI';
}

// Path: onboarding
class _Translations$onboarding$de extends Translations$onboarding$en {
	_Translations$onboarding$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$de page1 = _Translations$onboarding$page1$de._(_root);
	@override late final _Translations$onboarding$page2$de page2 = _Translations$onboarding$page2$de._(_root);
	@override late final _Translations$onboarding$page3$de page3 = _Translations$onboarding$page3$de._(_root);
	@override late final _Translations$onboarding$page4$de page4 = _Translations$onboarding$page4$de._(_root);
	@override late final _Translations$onboarding$page5$de page5 = _Translations$onboarding$page5$de._(_root);
}

// Path: dashboard
class _Translations$dashboard$de extends Translations$dashboard$en {
	_Translations$dashboard$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Startseite';
	@override String get user => 'Profil';
	@override String get createVideo => 'Video erstellen';
}

// Path: profile
class _Translations$profile$de extends Translations$profile$en {
	_Translations$profile$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get upgradeTitle => 'Premium-Upgrade';
	@override String get upgradeSubtitle => 'Guthaben hinzufügen - Kein Wasserzeichen';
	@override String get goPremium => 'Premium holen';
	@override String get myVideo => 'Mein Video';
	@override String get liked => 'Gefällt mir';
	@override String get noVideos => 'Noch keine Videos';
	@override String get noVideosDesc => 'Erstelle dein erstes KI-Video, und es wird hier angezeigt.';
	@override String get deleteTitle => 'Dieses Video löschen?';
	@override String get deleteDesc => 'Sind Sie sicher, dass Sie dieses Video löschen möchten? Dies kann nicht rückgängig gemacht werden.';
	@override String get cancel => 'Abbrechen';
	@override String get delete => 'Löschen';
	@override String get generating => 'Generieren...';
	@override String get imageGeneration => 'Bildgenerierung';
}

// Path: home_new
class _Translations$home_new$de extends Translations$home_new$en {
	_Translations$home_new$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'Willkommen bei Video AI';
	@override String get imageToVideo => 'Bild zu\nVideo';
	@override String get transitionVideo => 'Übergangs-\nvideo';
	@override String get imageToDance => 'Bild zu\nTanz';
	@override String get unifiedVideo => 'Einheitliches\nVideo';
}

// Path: templates
class _Translations$templates$de extends Translations$templates$en {
	_Translations$templates$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vorlagen';
	@override String get all => 'Alle';
	@override String get pro => 'PRO';
}

// Path: settings
class _Translations$settings$de extends Translations$settings$en {
	_Translations$settings$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Einstellungen';
	@override String get language => 'Sprache';
	@override String get termsOfService => 'Nutzungsbedingungen';
	@override String get privacyPolicy => 'Datenschutzrichtlinie';
	@override String get contactUs => 'Kontaktieren Sie uns';
	@override String get version => 'Version';
	@override String get myCredits => 'Meine Credits';
	@override String get rateApp => 'App bewerten';
	@override String get userCode => 'Benutzercode';
	@override String get copied => 'In die Zwischenablage kopiert!';
	@override String get termsOfUse => 'Nutzungsbedingungen';
}

// Path: language
class _Translations$language$de extends Translations$language$en {
	_Translations$language$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sprache';
	@override String get en => 'Englisch';
	@override String get ar => 'Arabisch';
	@override String get de => 'Deutsch';
	@override String get es => 'Spanisch';
	@override String get fr => 'Französisch';
	@override String get hi => 'Hindi';
	@override String get id => 'Indonesisch';
	@override String get ja => 'Japanisch';
	@override String get ko => 'Koreanisch';
	@override String get pt => 'Portugiesisch';
	@override String get vi => 'Vietnamesisch';
	@override String get zh => 'Chinesisch';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$de extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Willkommen bei Video AI';
	@override String get subtitle => 'Deine kreative Reise beginnt hier...';
	@override String get button => 'Loslegen';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$de extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bild zu Video';
	@override String get subtitle => 'Bild hochladen, Prompt schreiben';
	@override String get button => 'Weiter';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$de extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => '2 Bilder zu Video';
	@override String get subtitle => '2 Bilder hochladen, Prompt schreiben';
	@override String get button => 'Weiter';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$de extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildtanz';
	@override String get subtitle => '1 Video, 1 Foto hochladen';
	@override String get button => 'Weiter';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$de extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video-Fusion';
	@override String get subtitle => 'Deine Fotos hochladen';
	@override String get button => 'Weiter';
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
			'create.generate_title' => 'Generieren',
			'create.upload_first_photo' => 'Erstes Foto hochladen.',
			'create.upload_last_photo' => 'Letztes Foto hochladen.',
			'create.upload_video_slot' => 'Video hochladen.',
			'create.upload_photo_slot' => 'Foto hochladen.',
			'create.photo_slot_num' => ({required Object num}) => 'Foto ${num}',
			'create.required_label' => 'Erforderlich',
			'create.optional_label' => 'Optional',
			'create.inspire_me_count' => ({required Object count}) => 'Inspiriere mich (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'Video wird generiert...',
			'create.select_mock_media' => 'Mock-Medien auswählen',
			'create.select_media_desc' => 'Wählen Sie eine Mock-Datei aus, um den Upload zu simulieren',
			'leave_dialog.title' => 'Verlassen ohne zu speichern?',
			'leave_dialog.desc' => 'Möchten Sie die Bearbeitung fortsetzen oder jetzt verlassen?',
			'splash.appName' => 'Video AI',
			'onboarding.page1.title' => 'Willkommen bei Video AI',
			'onboarding.page1.subtitle' => 'Deine kreative Reise beginnt hier...',
			'onboarding.page1.button' => 'Loslegen',
			'onboarding.page2.title' => 'Bild zu Video',
			'onboarding.page2.subtitle' => 'Bild hochladen, Prompt schreiben',
			'onboarding.page2.button' => 'Weiter',
			'onboarding.page3.title' => '2 Bilder zu Video',
			'onboarding.page3.subtitle' => '2 Bilder hochladen, Prompt schreiben',
			'onboarding.page3.button' => 'Weiter',
			'onboarding.page4.title' => 'Bildtanz',
			'onboarding.page4.subtitle' => '1 Video, 1 Foto hochladen',
			'onboarding.page4.button' => 'Weiter',
			'onboarding.page5.title' => 'Video-Fusion',
			'onboarding.page5.subtitle' => 'Deine Fotos hochladen',
			'onboarding.page5.button' => 'Weiter',
			'dashboard.home' => 'Startseite',
			'dashboard.user' => 'Profil',
			'dashboard.createVideo' => 'Video erstellen',
			'profile.title' => 'Profil',
			'profile.upgradeTitle' => 'Premium-Upgrade',
			'profile.upgradeSubtitle' => 'Guthaben hinzufügen - Kein Wasserzeichen',
			'profile.goPremium' => 'Premium holen',
			'profile.myVideo' => 'Mein Video',
			'profile.liked' => 'Gefällt mir',
			'profile.noVideos' => 'Noch keine Videos',
			'profile.noVideosDesc' => 'Erstelle dein erstes KI-Video, und es wird hier angezeigt.',
			'profile.deleteTitle' => 'Dieses Video löschen?',
			'profile.deleteDesc' => 'Sind Sie sicher, dass Sie dieses Video löschen möchten? Dies kann nicht rückgängig gemacht werden.',
			'profile.cancel' => 'Abbrechen',
			'profile.delete' => 'Löschen',
			'profile.generating' => 'Generieren...',
			'profile.imageGeneration' => 'Bildgenerierung',
			'home_new.welcomeToAppName' => 'Willkommen bei Video AI',
			'home_new.imageToVideo' => 'Bild zu\nVideo',
			'home_new.transitionVideo' => 'Übergangs-\nvideo',
			'home_new.imageToDance' => 'Bild zu\nTanz',
			'home_new.unifiedVideo' => 'Einheitliches\nVideo',
			'templates.title' => 'Vorlagen',
			'templates.all' => 'Alle',
			'templates.pro' => 'PRO',
			'settings.title' => 'Einstellungen',
			'settings.language' => 'Sprache',
			'settings.termsOfService' => 'Nutzungsbedingungen',
			'settings.privacyPolicy' => 'Datenschutzrichtlinie',
			'settings.contactUs' => 'Kontaktieren Sie uns',
			'settings.version' => 'Version',
			'settings.myCredits' => 'Meine Credits',
			'settings.rateApp' => 'App bewerten',
			'settings.userCode' => 'Benutzercode',
			'settings.copied' => 'In die Zwischenablage kopiert!',
			'settings.termsOfUse' => 'Nutzungsbedingungen',
			'language.title' => 'Sprache',
			'language.en' => 'Englisch',
			'language.ar' => 'Arabisch',
			'language.de' => 'Deutsch',
			'language.es' => 'Spanisch',
			'language.fr' => 'Französisch',
			'language.hi' => 'Hindi',
			'language.id' => 'Indonesisch',
			'language.ja' => 'Japanisch',
			'language.ko' => 'Koreanisch',
			'language.pt' => 'Portugiesisch',
			'language.vi' => 'Vietnamesisch',
			'language.zh' => 'Chinesisch',
			_ => null,
		};
	}
}
