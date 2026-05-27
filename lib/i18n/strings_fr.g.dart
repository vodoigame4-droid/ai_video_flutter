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
	@override late final _Translations$onboarding$fr onboarding = _Translations$onboarding$fr._(_root);
	@override late final _Translations$dashboard$fr dashboard = _Translations$dashboard$fr._(_root);
	@override late final _Translations$profile$fr profile = _Translations$profile$fr._(_root);
	@override late final _Translations$home_new$fr home_new = _Translations$home_new$fr._(_root);
	@override late final _Translations$templates$fr templates = _Translations$templates$fr._(_root);
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

// Path: onboarding
class _Translations$onboarding$fr extends Translations$onboarding$en {
	_Translations$onboarding$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$fr page1 = _Translations$onboarding$page1$fr._(_root);
	@override late final _Translations$onboarding$page2$fr page2 = _Translations$onboarding$page2$fr._(_root);
	@override late final _Translations$onboarding$page3$fr page3 = _Translations$onboarding$page3$fr._(_root);
	@override late final _Translations$onboarding$page4$fr page4 = _Translations$onboarding$page4$fr._(_root);
	@override late final _Translations$onboarding$page5$fr page5 = _Translations$onboarding$page5$fr._(_root);
}

// Path: dashboard
class _Translations$dashboard$fr extends Translations$dashboard$en {
	_Translations$dashboard$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get user => 'Profil';
	@override String get createVideo => 'Créer Vidéo';
}

// Path: profile
class _Translations$profile$fr extends Translations$profile$en {
	_Translations$profile$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get upgradeTitle => 'Mise à niveau Premium';
	@override String get upgradeSubtitle => 'Ajouter des crédits - Sans filigrane';
	@override String get goPremium => 'Passer Premium';
	@override String get myVideo => 'Ma Vidéo';
	@override String get liked => 'Aimé';
	@override String get noVideos => 'Pas encore de vidéos';
	@override String get noVideosDesc => 'Créez votre première vidéo IA et elle apparaîtra ici.';
}

// Path: home_new
class _Translations$home_new$fr extends Translations$home_new$en {
	_Translations$home_new$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'Bienvenue sur Video AI';
	@override String get imageToVideo => 'Image en\nVidéo';
	@override String get transitionVideo => 'Transition\nVidéo';
	@override String get imageToDance => 'Image en\nDanse';
	@override String get unifiedVideo => 'Vidéo\nUnifiée';
}

// Path: templates
class _Translations$templates$fr extends Translations$templates$en {
	_Translations$templates$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modèles';
	@override String get all => 'Tout';
	@override String get pro => 'PRO';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$fr extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bienvenue sur Video AI';
	@override String get subtitle => 'Votre voyage créatif commence ici...';
	@override String get button => 'Commencer';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$fr extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Image en vidéo';
	@override String get subtitle => 'Téléchargez une image, écrivez une description';
	@override String get button => 'Continuer';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$fr extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => '2 images en vidéo';
	@override String get subtitle => 'Téléchargez 2 images, écrivez une description';
	@override String get button => 'Continuer';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$fr extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Danse d\'image';
	@override String get subtitle => 'Téléchargez 1 vidéo, 1 photo';
	@override String get button => 'Continuer';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$fr extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fusion de vidéos';
	@override String get subtitle => 'Téléchargez vos photos';
	@override String get button => 'Continuer';
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
			'onboarding.page1.title' => 'Bienvenue sur Video AI',
			'onboarding.page1.subtitle' => 'Votre voyage créatif commence ici...',
			'onboarding.page1.button' => 'Commencer',
			'onboarding.page2.title' => 'Image en vidéo',
			'onboarding.page2.subtitle' => 'Téléchargez une image, écrivez une description',
			'onboarding.page2.button' => 'Continuer',
			'onboarding.page3.title' => '2 images en vidéo',
			'onboarding.page3.subtitle' => 'Téléchargez 2 images, écrivez une description',
			'onboarding.page3.button' => 'Continuer',
			'onboarding.page4.title' => 'Danse d\'image',
			'onboarding.page4.subtitle' => 'Téléchargez 1 vidéo, 1 photo',
			'onboarding.page4.button' => 'Continuer',
			'onboarding.page5.title' => 'Fusion de vidéos',
			'onboarding.page5.subtitle' => 'Téléchargez vos photos',
			'onboarding.page5.button' => 'Continuer',
			'dashboard.home' => 'Accueil',
			'dashboard.user' => 'Profil',
			'dashboard.createVideo' => 'Créer Vidéo',
			'profile.title' => 'Profil',
			'profile.upgradeTitle' => 'Mise à niveau Premium',
			'profile.upgradeSubtitle' => 'Ajouter des crédits - Sans filigrane',
			'profile.goPremium' => 'Passer Premium',
			'profile.myVideo' => 'Ma Vidéo',
			'profile.liked' => 'Aimé',
			'profile.noVideos' => 'Pas encore de vidéos',
			'profile.noVideosDesc' => 'Créez votre première vidéo IA et elle apparaîtra ici.',
			'home_new.welcomeToAppName' => 'Bienvenue sur Video AI',
			'home_new.imageToVideo' => 'Image en\nVidéo',
			'home_new.transitionVideo' => 'Transition\nVidéo',
			'home_new.imageToDance' => 'Image en\nDanse',
			'home_new.unifiedVideo' => 'Vidéo\nUnifiée',
			'templates.title' => 'Modèles',
			'templates.all' => 'Tout',
			'templates.pro' => 'PRO',
			_ => null,
		};
	}
}
