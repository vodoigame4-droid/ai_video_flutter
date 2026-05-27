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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$fr common = _Translations$common$fr._(_root);
	@override late final _Translations$home$fr home = _Translations$home$fr._(_root);
	@override late final _Translations$create$fr create = _Translations$create$fr._(_root);
	@override late final _Translations$leave_dialog$fr leave_dialog = _Translations$leave_dialog$fr._(_root);
	@override late final _Translations$splash$fr splash = _Translations$splash$fr._(_root);
}

// Path: common
class _Translations$common$fr extends Translations$common$en {
	_Translations$common$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'Voir tout';
	@override String get stay => 'Rester';
	@override String get leave => 'Quitter';
	@override String get camera => 'Appareil photo';
	@override String get gallery => 'Galerie';
	@override String get generate => 'Générer';
}

// Path: home
class _Translations$home$fr extends Translations$home$en {
	_Translations$home$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vidéo IA';
	@override String get trending => 'Tendances';
	@override String get new_section => 'Nouveau';
	@override String get toy_box => 'Boîte de figurines';
	@override String get epic_morph => 'Morphing épique';
	@override String get anime => 'Animé';
	@override String get discover => 'Découvrir';
}

// Path: create
class _Translations$create$fr extends Translations$create$en {
	_Translations$create$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'Selfie Aquaman';
	@override String get tap_upload => 'Appuyez ici pour télécharger votre photo.';
	@override String get select_upload_title => 'Sélectionnez pour télécharger votre photo';
	@override String get upload_image => 'Télécharger l\'image';
	@override String get custom_prompt => 'Invite personnalisée';
	@override String get prompt_placeholder => 'Portrait de femme réaliste, gros plan, regardant la caméra, clignant des yeux naturellement, éclairage de studio bleu, cinématographique, ultra détaillé';
	@override String get inspire_me => 'Inspirez-moi';
	@override String get video_settings => 'Paramètres vidéo';
	@override String get quality => 'Qualité';
	@override String get quality_desc => 'Choisissez la qualité vidéo';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'Durée';
	@override String get duration_desc => 'Choisissez la longueur de la vidéo';
	@override String get sec_4s => '4s';
	@override String get sec_8s => '8s';
	@override String get sec_5s => '5s';
	@override String get sec_10s => '10s';
	@override String get sec_15s => '15s';
}

// Path: leave_dialog
class _Translations$leave_dialog$fr extends Translations$leave_dialog$en {
	_Translations$leave_dialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quitter sans sauvegarder ?';
	@override String get desc => 'Voulez-vous continuer l\'édition ou partir maintenant ?';
}

// Path: splash
class _Translations$splash$fr extends Translations$splash$en {
	_Translations$splash$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Video AI';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'Voir tout',
			'common.stay' => 'Rester',
			'common.leave' => 'Quitter',
			'common.camera' => 'Appareil photo',
			'common.gallery' => 'Galerie',
			'common.generate' => 'Générer',
			'home.title' => 'Vidéo IA',
			'home.trending' => 'Tendances',
			'home.new_section' => 'Nouveau',
			'home.toy_box' => 'Boîte de figurines',
			'home.epic_morph' => 'Morphing épique',
			'home.anime' => 'Animé',
			'home.discover' => 'Découvrir',
			'create.selfie_aquaman' => 'Selfie Aquaman',
			'create.tap_upload' => 'Appuyez ici pour télécharger votre photo.',
			'create.select_upload_title' => 'Sélectionnez pour télécharger votre photo',
			'create.upload_image' => 'Télécharger l\'image',
			'create.custom_prompt' => 'Invite personnalisée',
			'create.prompt_placeholder' => 'Portrait de femme réaliste, gros plan, regardant la caméra, clignant des yeux naturellement, éclairage de studio bleu, cinématographique, ultra détaillé',
			'create.inspire_me' => 'Inspirez-moi',
			'create.video_settings' => 'Paramètres vidéo',
			'create.quality' => 'Qualité',
			'create.quality_desc' => 'Choisissez la qualité vidéo',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Durée',
			'create.duration_desc' => 'Choisissez la longueur de la vidéo',
			'create.sec_4s' => '4s',
			'create.sec_8s' => '8s',
			'create.sec_5s' => '5s',
			'create.sec_10s' => '10s',
			'create.sec_15s' => '15s',
			'leave_dialog.title' => 'Quitter sans sauvegarder ?',
			'leave_dialog.desc' => 'Voulez-vous continuer l\'édition ou partir maintenant ?',
			'splash.appName' => 'Video AI',
			_ => null,
		};
	}
}
