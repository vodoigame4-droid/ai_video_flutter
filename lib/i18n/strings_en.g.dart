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
	late final Translations$splash$en splash = Translations$splash$en.internal(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en.internal(_root);
	late final Translations$dashboard$en dashboard = Translations$dashboard$en.internal(_root);
	late final Translations$profile$en profile = Translations$profile$en.internal(_root);
	late final Translations$home_new$en home_new = Translations$home_new$en.internal(_root);
	late final Translations$templates$en templates = Translations$templates$en.internal(_root);
	late final Translations$settings$en settings = Translations$settings$en.internal(_root);
	late final Translations$language$en language = Translations$language$en.internal(_root);
	late final Translations$premium$en premium = Translations$premium$en.internal(_root);
	late final Translations$video_player$en video_player = Translations$video_player$en.internal(_root);
	late final Translations$generating$en generating = Translations$generating$en.internal(_root);
	late final Translations$result$en result = Translations$result$en.internal(_root);
	late final Translations$privacy_dialog$en privacy_dialog = Translations$privacy_dialog$en.internal(_root);
	late final Translations$report_dialog$en report_dialog = Translations$report_dialog$en.internal(_root);
	late final Translations$tips_sheet$en tips_sheet = Translations$tips_sheet$en.internal(_root);
	late final Translations$errors$en errors = Translations$errors$en.internal(_root);
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

	/// en: 'Generate'
	String get generate_title => 'Generate';

	/// en: 'Upload first photo.'
	String get upload_first_photo => 'Upload first photo.';

	/// en: 'Upload last photo.'
	String get upload_last_photo => 'Upload last photo.';

	/// en: 'Upload Video.'
	String get upload_video_slot => 'Upload Video.';

	/// en: 'Upload photo.'
	String get upload_photo_slot => 'Upload photo.';

	/// en: 'Photo {num}'
	String photo_slot_num({required Object num}) => 'Photo ${num}';

	/// en: 'Required'
	String get required_label => 'Required';

	/// en: 'Optional'
	String get optional_label => 'Optional';

	/// en: 'Inspire me ({count})'
	String inspire_me_count({required Object count}) => 'Inspire me (${count})';

	/// en: '{current}/1000'
	String character_count({required Object current}) => '${current}/1000';

	/// en: 'Generating your video...'
	String get generating_video => 'Generating your video...';

	/// en: 'Select Mock Media'
	String get select_mock_media => 'Select Mock Media';

	/// en: 'Select a mock file to simulate upload'
	String get select_media_desc => 'Select a mock file to simulate upload';
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

// Path: splash
class Translations$splash$en {
	Translations$splash$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Video AI'
	String get appName => 'Video AI';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$onboarding$page1$en page1 = Translations$onboarding$page1$en.internal(_root);
	late final Translations$onboarding$page2$en page2 = Translations$onboarding$page2$en.internal(_root);
	late final Translations$onboarding$page3$en page3 = Translations$onboarding$page3$en.internal(_root);
	late final Translations$onboarding$page4$en page4 = Translations$onboarding$page4$en.internal(_root);
	late final Translations$onboarding$page5$en page5 = Translations$onboarding$page5$en.internal(_root);
}

// Path: dashboard
class Translations$dashboard$en {
	Translations$dashboard$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'User'
	String get user => 'User';

	/// en: 'Create Video'
	String get createVideo => 'Create Video';
}

// Path: profile
class Translations$profile$en {
	Translations$profile$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Premium Upgrade'
	String get upgradeTitle => 'Premium Upgrade';

	/// en: 'Add Credits - No Watermark'
	String get upgradeSubtitle => 'Add Credits - No Watermark';

	/// en: 'Go Premium'
	String get goPremium => 'Go Premium';

	/// en: 'My Video'
	String get myVideo => 'My Video';

	/// en: 'Liked'
	String get liked => 'Liked';

	/// en: 'No videos yet'
	String get noVideos => 'No videos yet';

	/// en: 'Create your first AI video and it will appear here.'
	String get noVideosDesc => 'Create your first AI video and it will appear here.';

	/// en: 'Delete this video?'
	String get deleteTitle => 'Delete this video?';

	/// en: 'Are you sure you want to delete this video? This action cannot be undone.'
	String get deleteDesc => 'Are you sure you want to delete this video? This action cannot be undone.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Generating...'
	String get generating => 'Generating...';

	/// en: 'Image Generation'
	String get imageGeneration => 'Image Generation';
}

// Path: home_new
class Translations$home_new$en {
	Translations$home_new$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome To Video AI'
	String get welcomeToAppName => 'Welcome To Video AI';

	/// en: 'Image to Video'
	String get imageToVideo => 'Image to\nVideo';

	/// en: 'Transition Video'
	String get transitionVideo => 'Transition\nVideo';

	/// en: 'Image to Dance'
	String get imageToDance => 'Image to\nDance';

	/// en: 'Unified Video'
	String get unifiedVideo => 'Unified\nVideo';
}

// Path: templates
class Translations$templates$en {
	Translations$templates$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Templates'
	String get title => 'Templates';

	/// en: 'All'
	String get all => 'All';

	/// en: 'PRO'
	String get pro => 'PRO';
}

// Path: settings
class Translations$settings$en {
	Translations$settings$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Terms of Service'
	String get termsOfService => 'Terms of Service';

	/// en: 'Privacy Policy'
	String get privacyPolicy => 'Privacy Policy';

	/// en: 'Contact Us'
	String get contactUs => 'Contact Us';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'My Credits'
	String get myCredits => 'My Credits';

	/// en: 'Rate App'
	String get rateApp => 'Rate App';

	/// en: 'User Code'
	String get userCode => 'User Code';

	/// en: 'Copied to clipboard!'
	String get copied => 'Copied to clipboard!';

	/// en: 'Terms of Use'
	String get termsOfUse => 'Terms of Use';
}

// Path: language
class Translations$language$en {
	Translations$language$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get title => 'Language';

	/// en: 'English'
	String get en => 'English';

	/// en: 'Arabic'
	String get ar => 'Arabic';

	/// en: 'German'
	String get de => 'German';

	/// en: 'Spanish'
	String get es => 'Spanish';

	/// en: 'French'
	String get fr => 'French';

	/// en: 'Hindi'
	String get hi => 'Hindi';

	/// en: 'Indonesian'
	String get id => 'Indonesian';

	/// en: 'Japanese'
	String get ja => 'Japanese';

	/// en: 'Korean'
	String get ko => 'Korean';

	/// en: 'Portuguese'
	String get pt => 'Portuguese';

	/// en: 'Vietnamese'
	String get vi => 'Vietnamese';

	/// en: 'Chinese'
	String get zh => 'Chinese';
}

// Path: premium
class Translations$premium$en {
	Translations$premium$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to Reveal'
	String get tap_to_reveal => 'Tap to Reveal';

	/// en: 'Weekly'
	String get weekly => 'Weekly';

	/// en: '7-day unlimited access, then 249.000đ/week'
	String get weekly_desc => '7-day unlimited access, then 249.000đ/week';

	/// en: '199.000 đ'
	String get weekly_price => '199.000 đ';

	/// en: '/week'
	String get weekly_suffix => '/week';

	/// en: 'Annually'
	String get annually => 'Annually';

	/// en: 'Only 24.980đ/week'
	String get annually_desc => 'Only 24.980đ/week';

	/// en: '1.299.000 đ'
	String get annually_price => '1.299.000 đ';

	/// en: '/year'
	String get annually_suffix => '/year';

	/// en: 'Best Value'
	String get best_value => 'Best Value';

	/// en: 'Save 80%'
	String get save_80 => 'Save 80%';

	/// en: 'Start Free Trial'
	String get start_free_trial => 'Start Free Trial';

	/// en: 'Start My Subscription'
	String get start_my_subscription => 'Start My Subscription';

	/// en: 'Auto-Renewable. Cancel Anytime.'
	String get auto_renewable => 'Auto-Renewable. Cancel Anytime.';

	/// en: 'Privacy Policy'
	String get privacy_policy => 'Privacy Policy';

	/// en: 'Term of Use'
	String get terms_of_use => 'Term of Use';

	/// en: 'Restore'
	String get restore => 'Restore';

	/// en: 'Unlock 200+ Templates'
	String get unlock_templates => 'Unlock 200+ Templates';

	/// en: 'Fast Video Generation'
	String get fast_generation => 'Fast Video Generation';

	/// en: '50% Off Credit Packs'
	String get discount_packs => '50% Off Credit Packs';

	/// en: '80 Videos Per Year'
	String get videos_per_year => '80 Videos Per Year';

	/// en: 'Buy More Credit'
	String get buy_more_credit => 'Buy More Credit';

	/// en: '35 Credit generates 1 video. No ads while using purchased credits.'
	String get credit_desc => '35 Credit generates 1 video. No ads while using purchased credits.';

	/// en: '70 Credit'
	String get credit_70 => '70 Credit';

	/// en: '150 Credit'
	String get credit_150 => '150 Credit';

	/// en: '350 Credit'
	String get credit_350 => '350 Credit';

	/// en: '500 Credit'
	String get credit_500 => '500 Credit';

	/// en: '1.000 Credit'
	String get credit_1000 => '1.000 Credit';

	/// en: '6.000 Credit'
	String get credit_6000 => '6.000 Credit';

	/// en: '(~ {count} video)'
	String approx_videos({required Object count}) => '(~ ${count} video)';

	/// en: '149.000 đ'
	String get price_70 => '149.000 đ';

	/// en: '299.000 đ'
	String get price_150 => '299.000 đ';

	/// en: '599.000 đ'
	String get price_350 => '599.000 đ';

	/// en: '799.000 đ'
	String get price_500 => '799.000 đ';

	/// en: '1.499.000 đ'
	String get price_1000 => '1.499.000 đ';

	/// en: '5.999.000 đ'
	String get price_6000 => '5.999.000 đ';

	/// en: 'Most Popular'
	String get most_popular => 'Most Popular';

	/// en: 'Purchase successful: {item}'
	String purchase_success({required Object item}) => 'Purchase successful: ${item}';

	/// en: 'Purchase failed.'
	String get purchase_failed => 'Purchase failed.';

	/// en: 'Credit Packages'
	String get credit_packages => 'Credit Packages';

	/// en: 'Buy Credit Now'
	String get buy_credit_now => 'Buy Credit Now';

	/// en: 'PRO'
	String get pro_title => 'PRO';

	/// en: '50% OFF'
	String get discount_title => '50% OFF';

	/// en: 'CREDIT PRICES'
	String get discount_subtitle => 'CREDIT PRICES';
}

// Path: video_player
class Translations$video_player$en {
	Translations$video_player$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Play'
	String get play => 'Play';

	/// en: 'Pause'
	String get pause => 'Pause';

	/// en: 'Failed to load video.'
	String get error_loading => 'Failed to load video.';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Buffering...'
	String get buffering => 'Buffering...';
}

// Path: generating
class Translations$generating$en {
	Translations$generating$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Generating'
	String get title => 'Generating';

	/// en: 'your video'
	String get your_video => 'your video';

	/// en: 'This may take a few minutes. Please wait...'
	String get desc => 'This may take a few minutes.\nPlease wait...';

	/// en: 'Notify me when complete'
	String get notify_me => 'Notify me when complete';

	/// en: 'We will notify you when your video is ready!'
	String get notified => 'We will notify you when your video is ready!';

	/// en: 'Notification permission denied. Please enable it in Settings.'
	String get notification_denied => 'Notification permission denied. Please enable it in Settings.';

	/// en: 'Failed to generate video. Please try again.'
	String get failed => 'Failed to generate video. Please try again.';
}

// Path: result
class Translations$result$en {
	Translations$result$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Result Video'
	String get title => 'Result Video';

	/// en: 'Your {title} video is ready!'
	String ready_message({required Object title}) => 'Your ${title} video is ready!';

	/// en: 'Regenerate'
	String get regenerate => 'Regenerate';

	/// en: 'Create Another Video'
	String get create_another => 'Create Another Video';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Extend Video'
	String get extend_video => 'Extend Video';

	/// en: 'Extends'
	String get extends_title => 'Extends';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Video link copied to share'
	String get share_success => 'Video link copied to share';

	/// en: 'Video saved to gallery'
	String get download_success => 'Video saved to gallery';
}

// Path: privacy_dialog
class Translations$privacy_dialog$en {
	Translations$privacy_dialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Data Privacy'
	String get title => 'Data Privacy';

	/// en: 'Your photos are processed securely by our internal AI systems. We do not share, sell, or disclose your information to any third parties.'
	String get desc => 'Your photos are processed securely by our internal AI systems. We do not share, sell, or disclose your information to any third parties.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';
}

// Path: report_dialog
class Translations$report_dialog$en {
	Translations$report_dialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Report'
	String get title => 'Report';

	/// en: 'Are you sure you want to submit the report?'
	String get desc => 'Are you sure you want to submit the report?';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Video reported successfully'
	String get success => 'Video reported successfully';
}

// Path: tips_sheet
class Translations$tips_sheet$en {
	Translations$tips_sheet$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tips for best results'
	String get title => 'Tips for best results';

	/// en: 'I got it!'
	String get button_got_it => 'I got it!';

	/// en: 'Use photos like these'
	String get use_photos => 'Use photos like these';

	/// en: 'Avoid photos like these'
	String get avoid_photos => 'Avoid photos like these';

	/// en: 'One person'
	String get one_person => 'One person';

	/// en: 'Clear face'
	String get clear_face => 'Clear face';

	/// en: 'Half body'
	String get half_body => 'Half body';

	/// en: 'Hidden face'
	String get hidden_face => 'Hidden face';

	/// en: 'Multiple people'
	String get multiple_people => 'Multiple people';

	/// en: 'Blurry photo'
	String get blurry_photo => 'Blurry photo';
}

// Path: errors
class Translations$errors$en {
	Translations$errors$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'An unexpected error occurred. Please try again.'
	String get unknown => 'An unexpected error occurred. Please try again.';

	/// en: 'Session expired. Please log in again.'
	String get unauthorized => 'Session expired. Please log in again.';

	/// en: 'Invalid inputs. Please check your data.'
	String get validation_error => 'Invalid inputs. Please check your data.';

	/// en: 'Incorrect password. Please try again.'
	String get password_incorrect => 'Incorrect password. Please try again.';

	/// en: 'Account not found.'
	String get account_not_found => 'Account not found.';

	/// en: 'Email template already exists.'
	String get email_template_already_exists => 'Email template already exists.';

	/// en: 'Email template not found.'
	String get email_template_not_found => 'Email template not found.';

	/// en: 'Registration limit reached for this email.'
	String get account_email_limit_register => 'Registration limit reached for this email.';

	/// en: 'Username is already taken.'
	String get account_username_is_exist => 'Username is already taken.';

	/// en: 'Invalid session token. Please log in again.'
	String get token_invalid => 'Invalid session token. Please log in again.';

	/// en: 'Two-factor authentication is already enabled.'
	String get already_enable_2fa => 'Two-factor authentication is already enabled.';

	/// en: 'Two-factor authentication is not enabled.'
	String get account_are_not_enable_2fa => 'Two-factor authentication is not enabled.';

	/// en: 'Referral account not found.'
	String get ref_account_not_found => 'Referral account not found.';

	/// en: 'Account is already VIP.'
	String get account_already_vip => 'Account is already VIP.';

	/// en: 'Permission not found.'
	String get perm_not_found => 'Permission not found.';

	/// en: 'Registration details not found.'
	String get account_register_not_found => 'Registration details not found.';

	/// en: 'Invalid OTP code. Please check and try again.'
	String get otp_invalid => 'Invalid OTP code. Please check and try again.';

	/// en: 'OTP code has expired. Please request a new one.'
	String get otp_expired => 'OTP code has expired. Please request a new one.';

	/// en: 'Too many requests. Please wait before trying again.'
	String get otp_to_many_request => 'Too many requests. Please wait before trying again.';

	/// en: 'Account information not found.'
	String get account_info_not_found => 'Account information not found.';

	/// en: 'Account information is already created.'
	String get account_info_already_created => 'Account information is already created.';

	/// en: 'ID number is already in use.'
	String get id_number_already_in_use => 'ID number is already in use.';

	/// en: 'Account information cannot be updated.'
	String get account_info_can_not_update => 'Account information cannot be updated.';

	/// en: 'Account profile is currently being processed.'
	String get account_profile_is_processed => 'Account profile is currently being processed.';

	/// en: 'Insufficient funds or credits.'
	String get insufficient_fund => 'Insufficient funds or credits.';

	/// en: 'Email is already registered.'
	String get account_email_is_exist => 'Email is already registered.';

	/// en: 'Proxy connection error.'
	String get proxy_error => 'Proxy connection error.';

	/// en: 'Invalid file type. Please use supported formats.'
	String get invalid_file_type => 'Invalid file type. Please use supported formats.';

	/// en: 'File size exceeds the 20MB limit.'
	String get file_too_large => 'File size exceeds the 20MB limit.';

	/// en: 'Your account has been banned.'
	String get account_banned => 'Your account has been banned.';

	/// en: 'Login failed. Please check your credentials.'
	String get login_failed => 'Login failed. Please check your credentials.';

	/// en: 'An error occurred with code validation.'
	String get error_code => 'An error occurred with code validation.';

	/// en: 'User not found.'
	String get user_not_found => 'User not found.';

	/// en: 'Invite code has already been used.'
	String get user_used_invite_code => 'Invite code has already been used.';

	/// en: 'Failed to retrieve user profile.'
	String get get_me_failed => 'Failed to retrieve user profile.';

	/// en: 'You cannot use your own invite code.'
	String get user_cannot_use_own_invite_code => 'You cannot use your own invite code.';

	/// en: 'File not found.'
	String get file_not_found => 'File not found.';

	/// en: 'Failed to upload file. Please try again.'
	String get file_upload_failed => 'Failed to upload file. Please try again.';

	/// en: 'Failed to upload WEBP file.'
	String get upload_webp_failed => 'Failed to upload WEBP file.';

	/// en: 'Failed to create theme.'
	String get create_theme_failed => 'Failed to create theme.';

	/// en: 'Failed to retrieve themes.'
	String get get_theme_failed => 'Failed to retrieve themes.';

	/// en: 'Category already exists.'
	String get category_already_exists => 'Category already exists.';

	/// en: 'Failed to create category.'
	String get create_category_failed => 'Failed to create category.';

	/// en: 'Invalid video ratio.'
	String get invalid_ratio => 'Invalid video ratio.';

	/// en: 'Failed to initiate video generation.'
	String get create_media_failed => 'Failed to initiate video generation.';

	/// en: 'Video or image file not found.'
	String get media_not_found => 'Video or image file not found.';

	/// en: 'Callback media processing failed.'
	String get callback_media_failed => 'Callback media processing failed.';

	/// en: 'Failed to retrieve video details.'
	String get get_media_detail_failed => 'Failed to retrieve video details.';

	/// en: 'Failed to retrieve media list.'
	String get get_media_failed => 'Failed to retrieve media list.';

	/// en: 'Failed to update theme.'
	String get update_theme_failed => 'Failed to update theme.';

	/// en: 'Failed to delete theme.'
	String get delete_theme_failed => 'Failed to delete theme.';

	/// en: 'Category not found.'
	String get category_not_found => 'Category not found.';

	/// en: 'Failed to delete category.'
	String get delete_category_failed => 'Failed to delete category.';

	/// en: 'You do not own this media.'
	String get media_not_owned => 'You do not own this media.';

	/// en: 'Theme already exists.'
	String get theme_already_exists => 'Theme already exists.';

	/// en: 'Failed to update like status.'
	String get like_media_failed => 'Failed to update like status.';

	/// en: 'This feature requires a VIP subscription.'
	String get user_not_vip => 'This feature requires a VIP subscription.';

	/// en: 'Not enough credits. Please purchase more credits.'
	String get not_enough_credit => 'Not enough credits. Please purchase more credits.';

	/// en: 'Photo enhancement failed.'
	String get create_photo_enhance_failed => 'Photo enhancement failed.';

	/// en: 'Failed to remove object from photo.'
	String get remove_object_failed => 'Failed to remove object from photo.';

	/// en: 'Failed to suggest prompt.'
	String get get_suggestion_prompt_failed => 'Failed to suggest prompt.';

	/// en: 'Failed to load tasks.'
	String get get_tasks_failed => 'Failed to load tasks.';

	/// en: 'Failed to perform task action.'
	String get action_task_failed => 'Failed to perform task action.';

	/// en: 'Task not found.'
	String get task_not_found => 'Task not found.';

	/// en: 'Task reward already claimed.'
	String get task_already_claimed => 'Task reward already claimed.';

	/// en: 'Task has already been started.'
	String get task_already_started => 'Task has already been started.';

	/// en: 'Task is not completed yet.'
	String get task_not_completed => 'Task is not completed yet.';

	/// en: 'Rating app failed.'
	String get rate_app_failed => 'Rating app failed.';

	/// en: 'Daily login task not found.'
	String get daily_login_task_not_found => 'Daily login task not found.';

	/// en: 'Failed to get daily login task.'
	String get get_daily_login_failed => 'Failed to get daily login task.';

	/// en: 'Today's reward already claimed.'
	String get today_login_reward_already_claimed => 'Today\'s reward already claimed.';

	/// en: 'Failed to claim login reward.'
	String get take_login_reward_failed => 'Failed to claim login reward.';

	/// en: 'Purchase receipt already registered.'
	String get iap_receipt_already_exists => 'Purchase receipt already registered.';

	/// en: 'Failed to verify purchase product.'
	String get iap_verify_product_failed => 'Failed to verify purchase product.';

	/// en: 'Product is not purchased.'
	String get iap_product_not_purchased => 'Product is not purchased.';

	/// en: 'In-app purchase product not found.'
	String get iap_product_not_found => 'In-app purchase product not found.';

	/// en: 'Subscription is not active.'
	String get iap_subscription_not_active => 'Subscription is not active.';

	/// en: 'Subscription already acknowledged.'
	String get iap_subscription_already_acknowledged => 'Subscription already acknowledged.';

	/// en: 'Failed to verify subscription.'
	String get iap_verify_subscription_failed => 'Failed to verify subscription.';

	/// en: 'Failed to refill subscription credits.'
	String get refill_subscription_credits_failed => 'Failed to refill subscription credits.';

	/// en: 'Failed to cancel subscription.'
	String get cancel_subscription_failed => 'Failed to cancel subscription.';

	/// en: 'Subscription plan not found.'
	String get plan_not_found => 'Subscription plan not found.';

	/// en: 'Transaction action failed.'
	String get transaction_action_failed => 'Transaction action failed.';

	/// en: 'Failed to verify iOS purchase.'
	String get iap_verify_ios_product_failed => 'Failed to verify iOS purchase.';

	/// en: 'Invalid subscription type.'
	String get iap_subscription_invalid_type => 'Invalid subscription type.';

	/// en: 'Subscription is not active for credit refill.'
	String get subscription_not_active_for_refill => 'Subscription is not active for credit refill.';

	/// en: 'Failed to retrieve credit price list.'
	String get get_price_list_failed => 'Failed to retrieve credit price list.';

	/// en: 'Purchase receipt not found.'
	String get iap_receipt_not_found => 'Purchase receipt not found.';

	/// en: 'Subscription not found.'
	String get iap_subscription_not_found => 'Subscription not found.';
}

// Path: onboarding.page1
class Translations$onboarding$page1$en {
	Translations$onboarding$page1$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome To Video AI'
	String get title => 'Welcome To Video AI';

	/// en: 'Your Creative Journey Starts Here...'
	String get subtitle => 'Your Creative Journey Starts Here...';

	/// en: 'Get Started'
	String get button => 'Get Started';
}

// Path: onboarding.page2
class Translations$onboarding$page2$en {
	Translations$onboarding$page2$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Image To Video'
	String get title => 'Image To Video';

	/// en: 'Upload Image, Write Prompt'
	String get subtitle => 'Upload Image, Write Prompt';

	/// en: 'Continue'
	String get button => 'Continue';
}

// Path: onboarding.page3
class Translations$onboarding$page3$en {
	Translations$onboarding$page3$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '2 Image To Video'
	String get title => '2 Image To Video';

	/// en: 'Upload 2 Image, Write Prompt'
	String get subtitle => 'Upload 2 Image, Write Prompt';

	/// en: 'Continue'
	String get button => 'Continue';
}

// Path: onboarding.page4
class Translations$onboarding$page4$en {
	Translations$onboarding$page4$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Image Dance'
	String get title => 'Image Dance';

	/// en: 'Upload 1 Video, 1 Photo'
	String get subtitle => 'Upload 1 Video, 1 Photo';

	/// en: 'Continue'
	String get button => 'Continue';
}

// Path: onboarding.page5
class Translations$onboarding$page5$en {
	Translations$onboarding$page5$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Fusion Video'
	String get title => 'Fusion Video';

	/// en: 'Upload Your Photos'
	String get subtitle => 'Upload Your Photos';

	/// en: 'Continue'
	String get button => 'Continue';
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
			'create.generate_title' => 'Generate',
			'create.upload_first_photo' => 'Upload first photo.',
			'create.upload_last_photo' => 'Upload last photo.',
			'create.upload_video_slot' => 'Upload Video.',
			'create.upload_photo_slot' => 'Upload photo.',
			'create.photo_slot_num' => ({required Object num}) => 'Photo ${num}',
			'create.required_label' => 'Required',
			'create.optional_label' => 'Optional',
			'create.inspire_me_count' => ({required Object count}) => 'Inspire me (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'Generating your video...',
			'create.select_mock_media' => 'Select Mock Media',
			'create.select_media_desc' => 'Select a mock file to simulate upload',
			'leave_dialog.title' => 'Leave without saving?',
			'leave_dialog.desc' => 'Do you want to continue editing or leave now?',
			'splash.appName' => 'Video AI',
			'onboarding.page1.title' => 'Welcome To Video AI',
			'onboarding.page1.subtitle' => 'Your Creative Journey Starts Here...',
			'onboarding.page1.button' => 'Get Started',
			'onboarding.page2.title' => 'Image To Video',
			'onboarding.page2.subtitle' => 'Upload Image, Write Prompt',
			'onboarding.page2.button' => 'Continue',
			'onboarding.page3.title' => '2 Image To Video',
			'onboarding.page3.subtitle' => 'Upload 2 Image, Write Prompt',
			'onboarding.page3.button' => 'Continue',
			'onboarding.page4.title' => 'Image Dance',
			'onboarding.page4.subtitle' => 'Upload 1 Video, 1 Photo',
			'onboarding.page4.button' => 'Continue',
			'onboarding.page5.title' => 'Fusion Video',
			'onboarding.page5.subtitle' => 'Upload Your Photos',
			'onboarding.page5.button' => 'Continue',
			'dashboard.home' => 'Home',
			'dashboard.user' => 'User',
			'dashboard.createVideo' => 'Create Video',
			'profile.title' => 'Profile',
			'profile.upgradeTitle' => 'Premium Upgrade',
			'profile.upgradeSubtitle' => 'Add Credits - No Watermark',
			'profile.goPremium' => 'Go Premium',
			'profile.myVideo' => 'My Video',
			'profile.liked' => 'Liked',
			'profile.noVideos' => 'No videos yet',
			'profile.noVideosDesc' => 'Create your first AI video and it will appear here.',
			'profile.deleteTitle' => 'Delete this video?',
			'profile.deleteDesc' => 'Are you sure you want to delete this video? This action cannot be undone.',
			'profile.cancel' => 'Cancel',
			'profile.delete' => 'Delete',
			'profile.generating' => 'Generating...',
			'profile.imageGeneration' => 'Image Generation',
			'home_new.welcomeToAppName' => 'Welcome To Video AI',
			'home_new.imageToVideo' => 'Image to\nVideo',
			'home_new.transitionVideo' => 'Transition\nVideo',
			'home_new.imageToDance' => 'Image to\nDance',
			'home_new.unifiedVideo' => 'Unified\nVideo',
			'templates.title' => 'Templates',
			'templates.all' => 'All',
			'templates.pro' => 'PRO',
			'settings.title' => 'Settings',
			'settings.language' => 'Language',
			'settings.termsOfService' => 'Terms of Service',
			'settings.privacyPolicy' => 'Privacy Policy',
			'settings.contactUs' => 'Contact Us',
			'settings.version' => 'Version',
			'settings.myCredits' => 'My Credits',
			'settings.rateApp' => 'Rate App',
			'settings.userCode' => 'User Code',
			'settings.copied' => 'Copied to clipboard!',
			'settings.termsOfUse' => 'Terms of Use',
			'language.title' => 'Language',
			'language.en' => 'English',
			'language.ar' => 'Arabic',
			'language.de' => 'German',
			'language.es' => 'Spanish',
			'language.fr' => 'French',
			'language.hi' => 'Hindi',
			'language.id' => 'Indonesian',
			'language.ja' => 'Japanese',
			'language.ko' => 'Korean',
			'language.pt' => 'Portuguese',
			'language.vi' => 'Vietnamese',
			'language.zh' => 'Chinese',
			'premium.tap_to_reveal' => 'Tap to Reveal',
			'premium.weekly' => 'Weekly',
			'premium.weekly_desc' => '7-day unlimited access, then 249.000đ/week',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/week',
			'premium.annually' => 'Annually',
			'premium.annually_desc' => 'Only 24.980đ/week',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/year',
			'premium.best_value' => 'Best Value',
			'premium.save_80' => 'Save 80%',
			'premium.start_free_trial' => 'Start Free Trial',
			'premium.start_my_subscription' => 'Start My Subscription',
			'premium.auto_renewable' => 'Auto-Renewable. Cancel Anytime.',
			'premium.privacy_policy' => 'Privacy Policy',
			'premium.terms_of_use' => 'Term of Use',
			'premium.restore' => 'Restore',
			'premium.unlock_templates' => 'Unlock 200+ Templates',
			'premium.fast_generation' => 'Fast Video Generation',
			'premium.discount_packs' => '50% Off Credit Packs',
			'premium.videos_per_year' => '80 Videos Per Year',
			'premium.buy_more_credit' => 'Buy More Credit',
			'premium.credit_desc' => '35 Credit generates 1 video. No ads while using purchased credits.',
			'premium.credit_70' => '70 Credit',
			'premium.credit_150' => '150 Credit',
			'premium.credit_350' => '350 Credit',
			'premium.credit_500' => '500 Credit',
			'premium.credit_1000' => '1.000 Credit',
			'premium.credit_6000' => '6.000 Credit',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} video)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => 'Most Popular',
			'premium.purchase_success' => ({required Object item}) => 'Purchase successful: ${item}',
			'premium.purchase_failed' => 'Purchase failed.',
			'premium.credit_packages' => 'Credit Packages',
			'premium.buy_credit_now' => 'Buy Credit Now',
			'premium.pro_title' => 'PRO',
			'premium.discount_title' => '50% OFF',
			'premium.discount_subtitle' => 'CREDIT PRICES',
			'video_player.play' => 'Play',
			'video_player.pause' => 'Pause',
			'video_player.error_loading' => 'Failed to load video.',
			'video_player.retry' => 'Retry',
			'video_player.buffering' => 'Buffering...',
			'generating.title' => 'Generating',
			'generating.your_video' => 'your video',
			'generating.desc' => 'This may take a few minutes.\nPlease wait...',
			'generating.notify_me' => 'Notify me when complete',
			'generating.notified' => 'We will notify you when your video is ready!',
			'generating.notification_denied' => 'Notification permission denied. Please enable it in Settings.',
			'generating.failed' => 'Failed to generate video. Please try again.',
			'result.title' => 'Result Video',
			'result.ready_message' => ({required Object title}) => 'Your ${title} video is ready!',
			'result.regenerate' => 'Regenerate',
			'result.create_another' => 'Create Another Video',
			'result.share' => 'Share',
			'result.download' => 'Download',
			'result.extend_video' => 'Extend Video',
			'result.extends_title' => 'Extends',
			'result.delete' => 'Delete',
			'result.share_success' => 'Video link copied to share',
			'result.download_success' => 'Video saved to gallery',
			'privacy_dialog.title' => 'Data Privacy',
			'privacy_dialog.desc' => 'Your photos are processed securely by our internal AI systems. We do not share, sell, or disclose your information to any third parties.',
			'privacy_dialog.cancel' => 'Cancel',
			'privacy_dialog.confirm' => 'Confirm',
			'report_dialog.title' => 'Report',
			'report_dialog.desc' => 'Are you sure you want to submit the report?',
			'report_dialog.cancel' => 'Cancel',
			'report_dialog.submit' => 'Submit',
			'report_dialog.success' => 'Video reported successfully',
			'tips_sheet.title' => 'Tips for best results',
			'tips_sheet.button_got_it' => 'I got it!',
			'tips_sheet.use_photos' => 'Use photos like these',
			'tips_sheet.avoid_photos' => 'Avoid photos like these',
			'tips_sheet.one_person' => 'One person',
			'tips_sheet.clear_face' => 'Clear face',
			'tips_sheet.half_body' => 'Half body',
			'tips_sheet.hidden_face' => 'Hidden face',
			'tips_sheet.multiple_people' => 'Multiple people',
			'tips_sheet.blurry_photo' => 'Blurry photo',
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
