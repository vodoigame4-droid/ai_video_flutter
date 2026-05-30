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
	@override late final _Translations$premium$de premium = _Translations$premium$de._(_root);
	@override late final _Translations$generating$de generating = _Translations$generating$de._(_root);
	@override late final _Translations$result$de result = _Translations$result$de._(_root);
	@override late final _Translations$privacy_dialog$de privacy_dialog = _Translations$privacy_dialog$de._(_root);
	@override late final _Translations$report_dialog$de report_dialog = _Translations$report_dialog$de._(_root);
	@override late final _Translations$tips_sheet$de tips_sheet = _Translations$tips_sheet$de._(_root);
	@override late final _Translations$errors$de errors = _Translations$errors$de._(_root);
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

// Path: premium
class _Translations$premium$de extends Translations$premium$en {
	_Translations$premium$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => 'Tippen zum Enthüllen';
	@override String get weekly => 'Wöchentlich';
	@override String get weekly_desc => '7 Tage unbegrenzter Zugriff, dann 249.000đ/Woche';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/Woche';
	@override String get annually => 'Jährlich';
	@override String get annually_desc => 'Nur 24.980đ/Woche';
	@override String get annually_price => '1.299.000 đ';
	@override String get annually_suffix => '/Jahr';
	@override String get best_value => 'Bester Wert';
	@override String get save_80 => '80% sparen';
	@override String get start_free_trial => 'Kostenlose Testversion starten';
	@override String get start_my_subscription => 'Mein Abonnement starten';
	@override String get auto_renewable => 'Automatisch verlängerbar. Jederzeit kündbar.';
	@override String get privacy_policy => 'Datenschutz-Bestimmungen';
	@override String get terms_of_use => 'Nutzungsbedingungen';
	@override String get restore => 'Wiederherstellen';
	@override String get unlock_templates => 'Schalte über 200 Vorlagen frei';
	@override String get fast_generation => 'Schnelle Videogenerierung';
	@override String get discount_packs => '50% Rabatt auf Guthabenpakete';
	@override String get videos_per_year => '80 Videos pro Jahr';
	@override String get buy_more_credit => 'Mehr Guthaben kaufen';
	@override String get credit_desc => '35 Guthaben generieren 1 Video. Keine Werbung bei Verwendung des gekauften Guthabens.';
	@override String get credit_70 => '70 Guthaben';
	@override String get credit_150 => '150 Guthaben';
	@override String get credit_350 => '350 Guthaben';
	@override String get credit_500 => '500 Guthaben';
	@override String get credit_1000 => '1.000 Guthaben';
	@override String get credit_6000 => '6.000 Guthaben';
	@override String approx_videos({required Object count}) => '(~ ${count} Video)';
	@override String get price_70 => '149.000 đ';
	@override String get price_150 => '299.000 đ';
	@override String get price_350 => '599.000 đ';
	@override String get price_500 => '799.000 đ';
	@override String get price_1000 => '1.499.000 đ';
	@override String get price_6000 => '5.999.000 đ';
	@override String get most_popular => 'Am beliebtesten';
	@override String purchase_success({required Object item}) => 'Kauf erfolgreich: ${item}';
	@override String get purchase_failed => 'Kauf fehlgeschlagen.';
	@override String get credit_packages => 'Guthabenpakete';
	@override String get buy_credit_now => 'Jetzt Guthaben kaufen';
	@override String get pro_title => 'PRO';
	@override String get discount_title => '50% RABATT';
	@override String get discount_subtitle => 'GUTHABENPREISE';
}

// Path: generating
class _Translations$generating$de extends Translations$generating$en {
	_Translations$generating$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Generieren';
	@override String get your_video => 'deines Videos';
	@override String get desc => 'Dies kann einige Minuten dauern.\nBitte warten...';
	@override String get notify_me => 'Benachrichtigen, wenn fertig';
	@override String get notified => 'Wir benachrichtigen dich, wenn dein Video fertig ist!';
	@override String get notification_denied => 'Benachrichtigungsberechtigung verweigert. Bitte in den Einstellungen aktivieren.';
	@override String get failed => 'Fehler beim Generieren des Videos. Bitte versuchen Sie es erneut.';
}

// Path: result
class _Translations$result$de extends Translations$result$en {
	_Translations$result$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ergebnis-Video';
	@override String ready_message({required Object title}) => 'Dein ${title} Video ist bereit!';
	@override String get regenerate => 'Neu generieren';
	@override String get create_another => 'Anderes Video erstellen';
	@override String get share => 'Teilen';
	@override String get download => 'Herunterladen';
	@override String get extend_video => 'Video verlängern';
	@override String get extends_title => 'Erweiterungen';
	@override String get delete => 'Löschen';
	@override String get share_success => 'Videolink zum Teilen kopiert';
	@override String get download_success => 'Video in der Galerie gespeichert';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$de extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Datenschutz';
	@override String get desc => 'Ihre Fotos werden von unseren internen KI-Systemen sicher verarbeitet. Wir teilen, verkaufen oder geben Ihre Informationen nicht an Dritte weiter.';
	@override String get cancel => 'Abbrechen';
	@override String get confirm => 'Bestätigen';
}

// Path: report_dialog
class _Translations$report_dialog$de extends Translations$report_dialog$en {
	_Translations$report_dialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Melden';
	@override String get desc => 'Sind Sie sicher, dass Sie den Bericht senden möchten?';
	@override String get cancel => 'Abbrechen';
	@override String get submit => 'Senden';
	@override String get success => 'Video erfolgreich gemeldet';
}

// Path: tips_sheet
class _Translations$tips_sheet$de extends Translations$tips_sheet$en {
	_Translations$tips_sheet$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tipps für beste Ergebnisse';
	@override String get button_got_it => 'Verstanden!';
	@override String get use_photos => 'Verwenden Sie solche Fotos';
	@override String get avoid_photos => 'Vermeiden Sie solche Fotos';
	@override String get one_person => 'Eine Person';
	@override String get clear_face => 'Klares Gesicht';
	@override String get half_body => 'Halbkörper';
	@override String get hidden_face => 'Verdecktes Gesicht';
	@override String get multiple_people => 'Mehrere Personen';
	@override String get blurry_photo => 'Unscharfes Foto';
}

// Path: errors
class _Translations$errors$de extends Translations$errors$en {
	_Translations$errors$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

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
			'premium.tap_to_reveal' => 'Tippen zum Enthüllen',
			'premium.weekly' => 'Wöchentlich',
			'premium.weekly_desc' => '7 Tage unbegrenzter Zugriff, dann 249.000đ/Woche',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/Woche',
			'premium.annually' => 'Jährlich',
			'premium.annually_desc' => 'Nur 24.980đ/Woche',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/Jahr',
			'premium.best_value' => 'Bester Wert',
			'premium.save_80' => '80% sparen',
			'premium.start_free_trial' => 'Kostenlose Testversion starten',
			'premium.start_my_subscription' => 'Mein Abonnement starten',
			'premium.auto_renewable' => 'Automatisch verlängerbar. Jederzeit kündbar.',
			'premium.privacy_policy' => 'Datenschutz-Bestimmungen',
			'premium.terms_of_use' => 'Nutzungsbedingungen',
			'premium.restore' => 'Wiederherstellen',
			'premium.unlock_templates' => 'Schalte über 200 Vorlagen frei',
			'premium.fast_generation' => 'Schnelle Videogenerierung',
			'premium.discount_packs' => '50% Rabatt auf Guthabenpakete',
			'premium.videos_per_year' => '80 Videos pro Jahr',
			'premium.buy_more_credit' => 'Mehr Guthaben kaufen',
			'premium.credit_desc' => '35 Guthaben generieren 1 Video. Keine Werbung bei Verwendung des gekauften Guthabens.',
			'premium.credit_70' => '70 Guthaben',
			'premium.credit_150' => '150 Guthaben',
			'premium.credit_350' => '350 Guthaben',
			'premium.credit_500' => '500 Guthaben',
			'premium.credit_1000' => '1.000 Guthaben',
			'premium.credit_6000' => '6.000 Guthaben',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} Video)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => 'Am beliebtesten',
			'premium.purchase_success' => ({required Object item}) => 'Kauf erfolgreich: ${item}',
			'premium.purchase_failed' => 'Kauf fehlgeschlagen.',
			'premium.credit_packages' => 'Guthabenpakete',
			'premium.buy_credit_now' => 'Jetzt Guthaben kaufen',
			'premium.pro_title' => 'PRO',
			'premium.discount_title' => '50% RABATT',
			'premium.discount_subtitle' => 'GUTHABENPREISE',
			'generating.title' => 'Generieren',
			'generating.your_video' => 'deines Videos',
			'generating.desc' => 'Dies kann einige Minuten dauern.\nBitte warten...',
			'generating.notify_me' => 'Benachrichtigen, wenn fertig',
			'generating.notified' => 'Wir benachrichtigen dich, wenn dein Video fertig ist!',
			'generating.notification_denied' => 'Benachrichtigungsberechtigung verweigert. Bitte in den Einstellungen aktivieren.',
			'generating.failed' => 'Fehler beim Generieren des Videos. Bitte versuchen Sie es erneut.',
			'result.title' => 'Ergebnis-Video',
			'result.ready_message' => ({required Object title}) => 'Dein ${title} Video ist bereit!',
			'result.regenerate' => 'Neu generieren',
			'result.create_another' => 'Anderes Video erstellen',
			'result.share' => 'Teilen',
			'result.download' => 'Herunterladen',
			'result.extend_video' => 'Video verlängern',
			'result.extends_title' => 'Erweiterungen',
			'result.delete' => 'Löschen',
			'result.share_success' => 'Videolink zum Teilen kopiert',
			'result.download_success' => 'Video in der Galerie gespeichert',
			'privacy_dialog.title' => 'Datenschutz',
			'privacy_dialog.desc' => 'Ihre Fotos werden von unseren internen KI-Systemen sicher verarbeitet. Wir teilen, verkaufen oder geben Ihre Informationen nicht an Dritte weiter.',
			'privacy_dialog.cancel' => 'Abbrechen',
			'privacy_dialog.confirm' => 'Bestätigen',
			'report_dialog.title' => 'Melden',
			'report_dialog.desc' => 'Sind Sie sicher, dass Sie den Bericht senden möchten?',
			'report_dialog.cancel' => 'Abbrechen',
			'report_dialog.submit' => 'Senden',
			'report_dialog.success' => 'Video erfolgreich gemeldet',
			'tips_sheet.title' => 'Tipps für beste Ergebnisse',
			'tips_sheet.button_got_it' => 'Verstanden!',
			'tips_sheet.use_photos' => 'Verwenden Sie solche Fotos',
			'tips_sheet.avoid_photos' => 'Vermeiden Sie solche Fotos',
			'tips_sheet.one_person' => 'Eine Person',
			'tips_sheet.clear_face' => 'Klares Gesicht',
			'tips_sheet.half_body' => 'Halbkörper',
			'tips_sheet.hidden_face' => 'Verdecktes Gesicht',
			'tips_sheet.multiple_people' => 'Mehrere Personen',
			'tips_sheet.blurry_photo' => 'Unscharfes Foto',
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
