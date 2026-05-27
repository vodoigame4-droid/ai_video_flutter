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
class TranslationsId extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsId _root = this; // ignore: unused_field

	@override 
	TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$id common = _Translations$common$id._(_root);
	@override late final _Translations$home$id home = _Translations$home$id._(_root);
	@override late final _Translations$create$id create = _Translations$create$id._(_root);
	@override late final _Translations$leave_dialog$id leave_dialog = _Translations$leave_dialog$id._(_root);
	@override late final _Translations$splash$id splash = _Translations$splash$id._(_root);
	@override late final _Translations$onboarding$id onboarding = _Translations$onboarding$id._(_root);
	@override late final _Translations$dashboard$id dashboard = _Translations$dashboard$id._(_root);
	@override late final _Translations$profile$id profile = _Translations$profile$id._(_root);
	@override late final _Translations$home_new$id home_new = _Translations$home_new$id._(_root);
	@override late final _Translations$templates$id templates = _Translations$templates$id._(_root);
	@override late final _Translations$settings$id settings = _Translations$settings$id._(_root);
	@override late final _Translations$language$id language = _Translations$language$id._(_root);
}

// Path: common
class _Translations$common$id extends Translations$common$en {
	_Translations$common$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'Lihat semua';
	@override String get stay => 'Tetap';
	@override String get leave => 'Keluar';
	@override String get camera => 'Kamera';
	@override String get gallery => 'Galeri';
	@override String get generate => 'Hasilkan';
}

// Path: home
class _Translations$home$id extends Translations$home$en {
	_Translations$home$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video AI';
	@override String get trending => 'Tren';
	@override String get new_section => 'Baru';
	@override String get toy_box => 'Kotak Figur Mainan';
	@override String get epic_morph => 'Morfosis Epik';
	@override String get anime => 'Anime';
	@override String get discover => 'Jelajahi';
}

// Path: create
class _Translations$create$id extends Translations$create$en {
	_Translations$create$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'Selfie Aquaman';
	@override String get tap_upload => 'Ketuk di sini untuk mengunggah foto Anda.';
	@override String get select_upload_title => 'Pilih untuk Mengunggah Foto Anda';
	@override String get upload_image => 'Unggah Gambar';
	@override String get custom_prompt => 'Perintah Kustom';
	@override String get prompt_placeholder => 'Potret wanita realistis, jarak dekat, menghadap kamera, berkedip alami, pencahayaan studio biru, sinematik, sangat detail';
	@override String get inspire_me => 'Inspirasi Saya';
	@override String get video_settings => 'Pengaturan Video';
	@override String get quality => 'Kualitas';
	@override String get quality_desc => 'Pilih kualitas video';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'Durasi';
	@override String get duration_desc => 'Pilih durasi video';
	@override String get sec_4s => '4d';
	@override String get sec_8s => '8d';
	@override String get sec_5s => '5d';
	@override String get sec_10s => '10d';
	@override String get sec_15s => '15d';
	@override String get generate_title => 'Hasilkan';
	@override String get upload_first_photo => 'Unggah foto pertama.';
	@override String get upload_last_photo => 'Unggah foto terakhir.';
	@override String get upload_video_slot => 'Unggah Video.';
	@override String get upload_photo_slot => 'Unggah foto.';
	@override String photo_slot_num({required Object num}) => 'Foto ${num}';
	@override String get required_label => 'Wajib';
	@override String get optional_label => 'Opsional';
	@override String inspire_me_count({required Object count}) => 'Inspirasi saya (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => 'Sedang menghasilkan video Anda...';
	@override String get select_mock_media => 'Pilih Media Simulasi';
	@override String get select_media_desc => 'Pilih file simulasi untuk mensimulasikan unggahan';
}

// Path: leave_dialog
class _Translations$leave_dialog$id extends Translations$leave_dialog$en {
	_Translations$leave_dialog$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keluar tanpa menyimpan?';
	@override String get desc => 'Apakah Anda ingin melanjutkan pengeditan atau keluar sekarang?';
}

// Path: splash
class _Translations$splash$id extends Translations$splash$en {
	_Translations$splash$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Video AI';
}

// Path: onboarding
class _Translations$onboarding$id extends Translations$onboarding$en {
	_Translations$onboarding$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$id page1 = _Translations$onboarding$page1$id._(_root);
	@override late final _Translations$onboarding$page2$id page2 = _Translations$onboarding$page2$id._(_root);
	@override late final _Translations$onboarding$page3$id page3 = _Translations$onboarding$page3$id._(_root);
	@override late final _Translations$onboarding$page4$id page4 = _Translations$onboarding$page4$id._(_root);
	@override late final _Translations$onboarding$page5$id page5 = _Translations$onboarding$page5$id._(_root);
}

// Path: dashboard
class _Translations$dashboard$id extends Translations$dashboard$en {
	_Translations$dashboard$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get home => 'Beranda';
	@override String get user => 'Saya';
	@override String get createVideo => 'Buat Video';
}

// Path: profile
class _Translations$profile$id extends Translations$profile$en {
	_Translations$profile$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get upgradeTitle => 'Upgrade Premium';
	@override String get upgradeSubtitle => 'Tambah Kredit - Tanpa Watermark';
	@override String get goPremium => 'Go Premium';
	@override String get myVideo => 'Video Saya';
	@override String get liked => 'Disukai';
	@override String get noVideos => 'Belum ada video';
	@override String get noVideosDesc => 'Buat video AI pertama Anda dan itu akan muncul di sini.';
	@override String get deleteTitle => 'Hapus video ini?';
	@override String get deleteDesc => 'Apakah Anda yakin ingin menghapus video ini? Tindakan ini tidak dapat dibatalkan.';
	@override String get cancel => 'Batal';
	@override String get delete => 'Hapus';
	@override String get generating => 'Membuat...';
	@override String get imageGeneration => 'Pembuatan Gambar';
}

// Path: home_new
class _Translations$home_new$id extends Translations$home_new$en {
	_Translations$home_new$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'Selamat Datang di Video AI';
	@override String get imageToVideo => 'Gambar ke\nVideo';
	@override String get transitionVideo => 'Video\nTransisi';
	@override String get imageToDance => 'Gambar ke\nTarian';
	@override String get unifiedVideo => 'Video\nTerpadu';
}

// Path: templates
class _Translations$templates$id extends Translations$templates$en {
	_Translations$templates$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Templat';
	@override String get all => 'Semua';
	@override String get pro => 'PRO';
}

// Path: settings
class _Translations$settings$id extends Translations$settings$en {
	_Translations$settings$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pengaturan';
	@override String get language => 'Bahasa';
	@override String get termsOfService => 'Ketentuan Layanan';
	@override String get privacyPolicy => 'Kebijakan Privasi';
	@override String get contactUs => 'Hubungi Kami';
	@override String get version => 'Versi';
	@override String get myCredits => 'Kredit Saya';
	@override String get rateApp => 'Nilai Aplikasi';
	@override String get userCode => 'Kode Pengguna';
	@override String get copied => 'Disalin ke papan klip!';
	@override String get termsOfUse => 'Ketentuan Penggunaan';
}

// Path: language
class _Translations$language$id extends Translations$language$en {
	_Translations$language$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bahasa';
	@override String get en => 'Inggris';
	@override String get ar => 'Arab';
	@override String get de => 'Jerman';
	@override String get es => 'Spanyol';
	@override String get fr => 'Prancis';
	@override String get hi => 'Hindi';
	@override String get id => 'Bahasa Indonesia';
	@override String get ja => 'Jepang';
	@override String get ko => 'Korea';
	@override String get pt => 'Portugis';
	@override String get vi => 'Vietnam';
	@override String get zh => 'Tionghoa';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$id extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selamat Datang di Video AI';
	@override String get subtitle => 'Perjalanan Kreatif Anda Dimulai Di Sini...';
	@override String get button => 'Mulai';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$id extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gambar ke Video';
	@override String get subtitle => 'Unggah Gambar, Tulis Prompt';
	@override String get button => 'Lanjutkan';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$id extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => '2 Gambar ke Video';
	@override String get subtitle => 'Unggah 2 Gambar, Tulis Prompt';
	@override String get button => 'Lanjutkan';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$id extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tarian Gambar';
	@override String get subtitle => 'Unggah 1 Video, 1 Foto';
	@override String get button => 'Lanjutkan';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$id extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fusi Video';
	@override String get subtitle => 'Unggah Foto Anda';
	@override String get button => 'Lanjutkan';
}

/// The flat map containing all translations for locale <id>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'Lihat semua',
			'common.stay' => 'Tetap',
			'common.leave' => 'Keluar',
			'common.camera' => 'Kamera',
			'common.gallery' => 'Galeri',
			'common.generate' => 'Hasilkan',
			'home.title' => 'Video AI',
			'home.trending' => 'Tren',
			'home.new_section' => 'Baru',
			'home.toy_box' => 'Kotak Figur Mainan',
			'home.epic_morph' => 'Morfosis Epik',
			'home.anime' => 'Anime',
			'home.discover' => 'Jelajahi',
			'create.selfie_aquaman' => 'Selfie Aquaman',
			'create.tap_upload' => 'Ketuk di sini untuk mengunggah foto Anda.',
			'create.select_upload_title' => 'Pilih untuk Mengunggah Foto Anda',
			'create.upload_image' => 'Unggah Gambar',
			'create.custom_prompt' => 'Perintah Kustom',
			'create.prompt_placeholder' => 'Potret wanita realistis, jarak dekat, menghadap kamera, berkedip alami, pencahayaan studio biru, sinematik, sangat detail',
			'create.inspire_me' => 'Inspirasi Saya',
			'create.video_settings' => 'Pengaturan Video',
			'create.quality' => 'Kualitas',
			'create.quality_desc' => 'Pilih kualitas video',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Durasi',
			'create.duration_desc' => 'Pilih durasi video',
			'create.sec_4s' => '4d',
			'create.sec_8s' => '8d',
			'create.sec_5s' => '5d',
			'create.sec_10s' => '10d',
			'create.sec_15s' => '15d',
			'create.generate_title' => 'Hasilkan',
			'create.upload_first_photo' => 'Unggah foto pertama.',
			'create.upload_last_photo' => 'Unggah foto terakhir.',
			'create.upload_video_slot' => 'Unggah Video.',
			'create.upload_photo_slot' => 'Unggah foto.',
			'create.photo_slot_num' => ({required Object num}) => 'Foto ${num}',
			'create.required_label' => 'Wajib',
			'create.optional_label' => 'Opsional',
			'create.inspire_me_count' => ({required Object count}) => 'Inspirasi saya (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'Sedang menghasilkan video Anda...',
			'create.select_mock_media' => 'Pilih Media Simulasi',
			'create.select_media_desc' => 'Pilih file simulasi untuk mensimulasikan unggahan',
			'leave_dialog.title' => 'Keluar tanpa menyimpan?',
			'leave_dialog.desc' => 'Apakah Anda ingin melanjutkan pengeditan atau keluar sekarang?',
			'splash.appName' => 'Video AI',
			'onboarding.page1.title' => 'Selamat Datang di Video AI',
			'onboarding.page1.subtitle' => 'Perjalanan Kreatif Anda Dimulai Di Sini...',
			'onboarding.page1.button' => 'Mulai',
			'onboarding.page2.title' => 'Gambar ke Video',
			'onboarding.page2.subtitle' => 'Unggah Gambar, Tulis Prompt',
			'onboarding.page2.button' => 'Lanjutkan',
			'onboarding.page3.title' => '2 Gambar ke Video',
			'onboarding.page3.subtitle' => 'Unggah 2 Gambar, Tulis Prompt',
			'onboarding.page3.button' => 'Lanjutkan',
			'onboarding.page4.title' => 'Tarian Gambar',
			'onboarding.page4.subtitle' => 'Unggah 1 Video, 1 Foto',
			'onboarding.page4.button' => 'Lanjutkan',
			'onboarding.page5.title' => 'Fusi Video',
			'onboarding.page5.subtitle' => 'Unggah Foto Anda',
			'onboarding.page5.button' => 'Lanjutkan',
			'dashboard.home' => 'Beranda',
			'dashboard.user' => 'Saya',
			'dashboard.createVideo' => 'Buat Video',
			'profile.title' => 'Profil',
			'profile.upgradeTitle' => 'Upgrade Premium',
			'profile.upgradeSubtitle' => 'Tambah Kredit - Tanpa Watermark',
			'profile.goPremium' => 'Go Premium',
			'profile.myVideo' => 'Video Saya',
			'profile.liked' => 'Disukai',
			'profile.noVideos' => 'Belum ada video',
			'profile.noVideosDesc' => 'Buat video AI pertama Anda dan itu akan muncul di sini.',
			'profile.deleteTitle' => 'Hapus video ini?',
			'profile.deleteDesc' => 'Apakah Anda yakin ingin menghapus video ini? Tindakan ini tidak dapat dibatalkan.',
			'profile.cancel' => 'Batal',
			'profile.delete' => 'Hapus',
			'profile.generating' => 'Membuat...',
			'profile.imageGeneration' => 'Pembuatan Gambar',
			'home_new.welcomeToAppName' => 'Selamat Datang di Video AI',
			'home_new.imageToVideo' => 'Gambar ke\nVideo',
			'home_new.transitionVideo' => 'Video\nTransisi',
			'home_new.imageToDance' => 'Gambar ke\nTarian',
			'home_new.unifiedVideo' => 'Video\nTerpadu',
			'templates.title' => 'Templat',
			'templates.all' => 'Semua',
			'templates.pro' => 'PRO',
			'settings.title' => 'Pengaturan',
			'settings.language' => 'Bahasa',
			'settings.termsOfService' => 'Ketentuan Layanan',
			'settings.privacyPolicy' => 'Kebijakan Privasi',
			'settings.contactUs' => 'Hubungi Kami',
			'settings.version' => 'Versi',
			'settings.myCredits' => 'Kredit Saya',
			'settings.rateApp' => 'Nilai Aplikasi',
			'settings.userCode' => 'Kode Pengguna',
			'settings.copied' => 'Disalin ke papan klip!',
			'settings.termsOfUse' => 'Ketentuan Penggunaan',
			'language.title' => 'Bahasa',
			'language.en' => 'Inggris',
			'language.ar' => 'Arab',
			'language.de' => 'Jerman',
			'language.es' => 'Spanyol',
			'language.fr' => 'Prancis',
			'language.hi' => 'Hindi',
			'language.id' => 'Bahasa Indonesia',
			'language.ja' => 'Jepang',
			'language.ko' => 'Korea',
			'language.pt' => 'Portugis',
			'language.vi' => 'Vietnam',
			'language.zh' => 'Tionghoa',
			_ => null,
		};
	}
}
