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
			_ => null,
		};
	}
}
