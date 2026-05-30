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
	@override late final _Translations$settings$fr settings = _Translations$settings$fr._(_root);
	@override late final _Translations$language$fr language = _Translations$language$fr._(_root);
	@override late final _Translations$premium$fr premium = _Translations$premium$fr._(_root);
	@override late final _Translations$generating$fr generating = _Translations$generating$fr._(_root);
	@override late final _Translations$result$fr result = _Translations$result$fr._(_root);
	@override late final _Translations$privacy_dialog$fr privacy_dialog = _Translations$privacy_dialog$fr._(_root);
	@override late final _Translations$report_dialog$fr report_dialog = _Translations$report_dialog$fr._(_root);
	@override late final _Translations$tips_sheet$fr tips_sheet = _Translations$tips_sheet$fr._(_root);
	@override late final _Translations$errors$fr errors = _Translations$errors$fr._(_root);
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
	@override String get generate_title => 'Générer';
	@override String get upload_first_photo => 'Télécharger la première photo.';
	@override String get upload_last_photo => 'Télécharger la dernière photo.';
	@override String get upload_video_slot => 'Télécharger la vidéo.';
	@override String get upload_photo_slot => 'Télécharger la photo.';
	@override String photo_slot_num({required Object num}) => 'Photo ${num}';
	@override String get required_label => 'Obligatoire';
	@override String get optional_label => 'Optionnel';
	@override String inspire_me_count({required Object count}) => 'Inspirez-moi (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => 'Génération de votre vidéo...';
	@override String get select_mock_media => 'Sélectionner un média fictif';
	@override String get select_media_desc => 'Sélectionnez un fichier fictif pour simuler le téléchargement';
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
	@override String get deleteTitle => 'Supprimer cette vidéo ?';
	@override String get deleteDesc => 'Voulez-vous vraiment supprimer cette vidéo ? Cette action est irréversible.';
	@override String get cancel => 'Annuler';
	@override String get delete => 'Supprimer';
	@override String get generating => 'Génération...';
	@override String get imageGeneration => 'Génération d\'images';
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

// Path: settings
class _Translations$settings$fr extends Translations$settings$en {
	_Translations$settings$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override String get language => 'Langue';
	@override String get termsOfService => 'Conditions d\'utilisation';
	@override String get privacyPolicy => 'Politique de confidentialité';
	@override String get contactUs => 'Contactez-nous';
	@override String get version => 'Version';
	@override String get myCredits => 'Mes Crédits';
	@override String get rateApp => 'Évaluer l\'application';
	@override String get userCode => 'Code d\'utilisateur';
	@override String get copied => 'Copié dans le presse-papiers !';
	@override String get termsOfUse => 'Conditions d\'utilisation';
}

// Path: language
class _Translations$language$fr extends Translations$language$en {
	_Translations$language$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Langue';
	@override String get en => 'Anglais';
	@override String get ar => 'Arabe';
	@override String get de => 'Allemand';
	@override String get es => 'Espagnol';
	@override String get fr => 'Français';
	@override String get hi => 'Hindi';
	@override String get id => 'Indonésien';
	@override String get ja => 'Japonais';
	@override String get ko => 'Coréen';
	@override String get pt => 'Portugais';
	@override String get vi => 'Vietnamien';
	@override String get zh => 'Chinois';
}

// Path: premium
class _Translations$premium$fr extends Translations$premium$en {
	_Translations$premium$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => 'Appuyez pour révéler';
	@override String get weekly => 'Hebdomadaire';
	@override String get weekly_desc => 'Accès illimité de 7 jours, puis 249.000đ/semaine';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/semaine';
	@override String get annually => 'Annuel';
	@override String get annually_desc => 'Seulement 24.980đ/semaine';
	@override String get annually_price => '1.299.000 đ';
	@override String get annually_suffix => '/an';
	@override String get best_value => 'Meilleur prix';
	@override String get save_80 => 'Économisez 80%';
	@override String get start_free_trial => 'Commencer l\'essai gratuit';
	@override String get start_my_subscription => 'Commencer mon abonnement';
	@override String get auto_renewable => 'Renouvellement automatique. Annulez à tout moment.';
	@override String get privacy_policy => 'Politique de confidentialité';
	@override String get terms_of_use => 'Conditions d\'utilisation';
	@override String get restore => 'Restaurer';
	@override String get unlock_templates => 'Débloquez plus de 200 modèles';
	@override String get fast_generation => 'Génération de vidéo rapide';
	@override String get discount_packs => '50% de réduction sur les packs de crédits';
	@override String get videos_per_year => '80 vidéos par an';
	@override String get buy_more_credit => 'Acheter plus de crédits';
	@override String get credit_desc => '35 crédits génèrent 1 vidéo. Pas de publicité pendant l\'utilisation des crédits achetés.';
	@override String get credit_70 => '70 crédits';
	@override String get credit_150 => '150 crédits';
	@override String get credit_350 => '350 crédits';
	@override String get credit_500 => '500 crédits';
	@override String get credit_1000 => '1.000 crédits';
	@override String get credit_6000 => '6.000 crédits';
	@override String approx_videos({required Object count}) => '(~ ${count} vidéo)';
	@override String get price_70 => '149.000 đ';
	@override String get price_150 => '299.000 đ';
	@override String get price_350 => '599.000 đ';
	@override String get price_500 => '799.000 đ';
	@override String get price_1000 => '1.499.000 đ';
	@override String get price_6000 => '5.999.000 đ';
	@override String get most_popular => 'Le plus populaire';
	@override String purchase_success({required Object item}) => 'Achat réussi: ${item}';
	@override String get purchase_failed => 'Échec de l\'achat.';
	@override String get credit_packages => 'Packs de crédits';
	@override String get buy_credit_now => 'Acheter des crédits';
	@override String get pro_title => 'PRO';
	@override String get discount_title => '50% DE RÉDUCTION';
	@override String get discount_subtitle => 'PRIX DES CRÉDITS';
}

// Path: generating
class _Translations$generating$fr extends Translations$generating$en {
	_Translations$generating$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Génération';
	@override String get your_video => 'de votre vidéo';
	@override String get desc => 'Cela peut prendre quelques minutes.\nVeuillez patienter...';
	@override String get notify_me => 'M\'avertir une fois terminé';
	@override String get notified => 'Nous vous informerons lorsque votre vidéo sera prête !';
	@override String get notification_denied => 'Autorisation de notification refusée. Veuillez l\'activer dans les Paramètres.';
	@override String get failed => 'Échec de la génération de la vidéo. Veuillez réessayer.';
}

// Path: result
class _Translations$result$fr extends Translations$result$en {
	_Translations$result$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vidéo finale';
	@override String ready_message({required Object title}) => 'Votre vidéo de ${title} est prête !';
	@override String get regenerate => 'Régénérer';
	@override String get create_another => 'Créer une autre vidéo';
	@override String get share => 'Partager';
	@override String get download => 'Télécharger';
	@override String get extend_video => 'Prolonger la vidéo';
	@override String get extends_title => 'Extensions';
	@override String get delete => 'Supprimer';
	@override String get share_success => 'Lien vidéo copié pour partager';
	@override String get download_success => 'Vidéo enregistrée dans la galerie';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$fr extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Confidentialité des données';
	@override String get desc => 'Vos photos sont traitées en toute sécurité par nos systèmes d\'IA internes. Nous ne partageons, ne vendons ni ne divulguons vos informations à des tiers.';
	@override String get cancel => 'Annuler';
	@override String get confirm => 'Confirmer';
}

// Path: report_dialog
class _Translations$report_dialog$fr extends Translations$report_dialog$en {
	_Translations$report_dialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Signaler';
	@override String get desc => 'Êtes-vous sûr de vouloir envoyer le signalement ?';
	@override String get cancel => 'Annuler';
	@override String get submit => 'Signaler';
	@override String get success => 'Vidéo signalée avec succès';
}

// Path: tips_sheet
class _Translations$tips_sheet$fr extends Translations$tips_sheet$en {
	_Translations$tips_sheet$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Conseils pour de meilleurs résultats';
	@override String get button_got_it => 'J\'ai compris !';
	@override String get use_photos => 'Utilisez des photos comme celles-ci';
	@override String get avoid_photos => 'Évitez les photos comme celles-ci';
	@override String get one_person => 'Une personne';
	@override String get clear_face => 'Visage clair';
	@override String get half_body => 'Demi-corps';
	@override String get hidden_face => 'Visage masqué';
	@override String get multiple_people => 'Plusieurs personnes';
	@override String get blurry_photo => 'Photo floue';
}

// Path: errors
class _Translations$errors$fr extends Translations$errors$en {
	_Translations$errors$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

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
			'create.generate_title' => 'Générer',
			'create.upload_first_photo' => 'Télécharger la première photo.',
			'create.upload_last_photo' => 'Télécharger la dernière photo.',
			'create.upload_video_slot' => 'Télécharger la vidéo.',
			'create.upload_photo_slot' => 'Télécharger la photo.',
			'create.photo_slot_num' => ({required Object num}) => 'Photo ${num}',
			'create.required_label' => 'Obligatoire',
			'create.optional_label' => 'Optionnel',
			'create.inspire_me_count' => ({required Object count}) => 'Inspirez-moi (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'Génération de votre vidéo...',
			'create.select_mock_media' => 'Sélectionner un média fictif',
			'create.select_media_desc' => 'Sélectionnez un fichier fictif pour simuler le téléchargement',
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
			'profile.deleteTitle' => 'Supprimer cette vidéo ?',
			'profile.deleteDesc' => 'Voulez-vous vraiment supprimer cette vidéo ? Cette action est irréversible.',
			'profile.cancel' => 'Annuler',
			'profile.delete' => 'Supprimer',
			'profile.generating' => 'Génération...',
			'profile.imageGeneration' => 'Génération d\'images',
			'home_new.welcomeToAppName' => 'Bienvenue sur Video AI',
			'home_new.imageToVideo' => 'Image en\nVidéo',
			'home_new.transitionVideo' => 'Transition\nVidéo',
			'home_new.imageToDance' => 'Image en\nDanse',
			'home_new.unifiedVideo' => 'Vidéo\nUnifiée',
			'templates.title' => 'Modèles',
			'templates.all' => 'Tout',
			'templates.pro' => 'PRO',
			'settings.title' => 'Paramètres',
			'settings.language' => 'Langue',
			'settings.termsOfService' => 'Conditions d\'utilisation',
			'settings.privacyPolicy' => 'Politique de confidentialité',
			'settings.contactUs' => 'Contactez-nous',
			'settings.version' => 'Version',
			'settings.myCredits' => 'Mes Crédits',
			'settings.rateApp' => 'Évaluer l\'application',
			'settings.userCode' => 'Code d\'utilisateur',
			'settings.copied' => 'Copié dans le presse-papiers !',
			'settings.termsOfUse' => 'Conditions d\'utilisation',
			'language.title' => 'Langue',
			'language.en' => 'Anglais',
			'language.ar' => 'Arabe',
			'language.de' => 'Allemand',
			'language.es' => 'Espagnol',
			'language.fr' => 'Français',
			'language.hi' => 'Hindi',
			'language.id' => 'Indonésien',
			'language.ja' => 'Japonais',
			'language.ko' => 'Coréen',
			'language.pt' => 'Portugais',
			'language.vi' => 'Vietnamien',
			'language.zh' => 'Chinois',
			'premium.tap_to_reveal' => 'Appuyez pour révéler',
			'premium.weekly' => 'Hebdomadaire',
			'premium.weekly_desc' => 'Accès illimité de 7 jours, puis 249.000đ/semaine',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/semaine',
			'premium.annually' => 'Annuel',
			'premium.annually_desc' => 'Seulement 24.980đ/semaine',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/an',
			'premium.best_value' => 'Meilleur prix',
			'premium.save_80' => 'Économisez 80%',
			'premium.start_free_trial' => 'Commencer l\'essai gratuit',
			'premium.start_my_subscription' => 'Commencer mon abonnement',
			'premium.auto_renewable' => 'Renouvellement automatique. Annulez à tout moment.',
			'premium.privacy_policy' => 'Politique de confidentialité',
			'premium.terms_of_use' => 'Conditions d\'utilisation',
			'premium.restore' => 'Restaurer',
			'premium.unlock_templates' => 'Débloquez plus de 200 modèles',
			'premium.fast_generation' => 'Génération de vidéo rapide',
			'premium.discount_packs' => '50% de réduction sur les packs de crédits',
			'premium.videos_per_year' => '80 vidéos par an',
			'premium.buy_more_credit' => 'Acheter plus de crédits',
			'premium.credit_desc' => '35 crédits génèrent 1 vidéo. Pas de publicité pendant l\'utilisation des crédits achetés.',
			'premium.credit_70' => '70 crédits',
			'premium.credit_150' => '150 crédits',
			'premium.credit_350' => '350 crédits',
			'premium.credit_500' => '500 crédits',
			'premium.credit_1000' => '1.000 crédits',
			'premium.credit_6000' => '6.000 crédits',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} vidéo)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => 'Le plus populaire',
			'premium.purchase_success' => ({required Object item}) => 'Achat réussi: ${item}',
			'premium.purchase_failed' => 'Échec de l\'achat.',
			'premium.credit_packages' => 'Packs de crédits',
			'premium.buy_credit_now' => 'Acheter des crédits',
			'premium.pro_title' => 'PRO',
			'premium.discount_title' => '50% DE RÉDUCTION',
			'premium.discount_subtitle' => 'PRIX DES CRÉDITS',
			'generating.title' => 'Génération',
			'generating.your_video' => 'de votre vidéo',
			'generating.desc' => 'Cela peut prendre quelques minutes.\nVeuillez patienter...',
			'generating.notify_me' => 'M\'avertir une fois terminé',
			'generating.notified' => 'Nous vous informerons lorsque votre vidéo sera prête !',
			'generating.notification_denied' => 'Autorisation de notification refusée. Veuillez l\'activer dans les Paramètres.',
			'generating.failed' => 'Échec de la génération de la vidéo. Veuillez réessayer.',
			'result.title' => 'Vidéo finale',
			'result.ready_message' => ({required Object title}) => 'Votre vidéo de ${title} est prête !',
			'result.regenerate' => 'Régénérer',
			'result.create_another' => 'Créer une autre vidéo',
			'result.share' => 'Partager',
			'result.download' => 'Télécharger',
			'result.extend_video' => 'Prolonger la vidéo',
			'result.extends_title' => 'Extensions',
			'result.delete' => 'Supprimer',
			'result.share_success' => 'Lien vidéo copié pour partager',
			'result.download_success' => 'Vidéo enregistrée dans la galerie',
			'privacy_dialog.title' => 'Confidentialité des données',
			'privacy_dialog.desc' => 'Vos photos sont traitées en toute sécurité par nos systèmes d\'IA internes. Nous ne partageons, ne vendons ni ne divulguons vos informations à des tiers.',
			'privacy_dialog.cancel' => 'Annuler',
			'privacy_dialog.confirm' => 'Confirmer',
			'report_dialog.title' => 'Signaler',
			'report_dialog.desc' => 'Êtes-vous sûr de vouloir envoyer le signalement ?',
			'report_dialog.cancel' => 'Annuler',
			'report_dialog.submit' => 'Signaler',
			'report_dialog.success' => 'Vidéo signalée avec succès',
			'tips_sheet.title' => 'Conseils pour de meilleurs résultats',
			'tips_sheet.button_got_it' => 'J\'ai compris !',
			'tips_sheet.use_photos' => 'Utilisez des photos comme celles-ci',
			'tips_sheet.avoid_photos' => 'Évitez les photos comme celles-ci',
			'tips_sheet.one_person' => 'Une personne',
			'tips_sheet.clear_face' => 'Visage clair',
			'tips_sheet.half_body' => 'Demi-corps',
			'tips_sheet.hidden_face' => 'Visage masqué',
			'tips_sheet.multiple_people' => 'Plusieurs personnes',
			'tips_sheet.blurry_photo' => 'Photo floue',
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
			_ => null,
		};
	}
}
