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
	@override late final _Translations$premium$id premium = _Translations$premium$id._(_root);
	@override late final _Translations$generating$id generating = _Translations$generating$id._(_root);
	@override late final _Translations$result$id result = _Translations$result$id._(_root);
	@override late final _Translations$privacy_dialog$id privacy_dialog = _Translations$privacy_dialog$id._(_root);
	@override late final _Translations$report_dialog$id report_dialog = _Translations$report_dialog$id._(_root);
	@override late final _Translations$tips_sheet$id tips_sheet = _Translations$tips_sheet$id._(_root);
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

// Path: premium
class _Translations$premium$id extends Translations$premium$en {
	_Translations$premium$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => 'Ketuk untuk Membuka';
	@override String get weekly => 'Mingguan';
	@override String get weekly_desc => 'Akses tak terbatas 7 hari, lalu 249.000đ/minggu';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/minggu';
	@override String get annually => 'Tahunan';
	@override String get annually_desc => 'Hanya 24.980đ/minggu';
	@override String get annually_price => '1.299.000 đ';
	@override String get annually_suffix => '/tahun';
	@override String get best_value => 'Nilai Terbaik';
	@override String get save_80 => 'Hemat 80%';
	@override String get start_free_trial => 'Mulai Uji Coba Gratis';
	@override String get start_my_subscription => 'Mulai Berlangganan';
	@override String get auto_renewable => 'Diperbarui Otomatis. Batalkan Kapan Saja.';
	@override String get privacy_policy => 'Kebijakan Privasi';
	@override String get terms_of_use => 'Ketentuan Penggunaan';
	@override String get restore => 'Pulihkan';
	@override String get unlock_templates => 'Buka 200+ Templat';
	@override String get fast_generation => 'Pembuatan Video Cepat';
	@override String get discount_packs => 'Diskon 50% Paket Kredit';
	@override String get videos_per_year => '80 Video Per Tahun';
	@override String get buy_more_credit => 'Beli Lebih Banyak Kredit';
	@override String get credit_desc => '35 Kredit menghasilkan 1 video. Tanpa iklan saat menggunakan kredit yang dibeli.';
	@override String get credit_70 => '70 Kredit';
	@override String get credit_150 => '150 Kredit';
	@override String get credit_350 => '350 Kredit';
	@override String get credit_500 => '500 Kredit';
	@override String get credit_1000 => '1.000 Kredit';
	@override String get credit_6000 => '6.000 Kredit';
	@override String approx_videos({required Object count}) => '(~ ${count} video)';
	@override String get price_70 => '149.000 đ';
	@override String get price_150 => '299.000 đ';
	@override String get price_350 => '599.000 đ';
	@override String get price_500 => '799.000 đ';
	@override String get price_1000 => '1.499.000 đ';
	@override String get price_6000 => '5.999.000 đ';
	@override String get most_popular => 'Terpopuler';
	@override String purchase_success({required Object item}) => 'Pembelian berhasil: ${item}';
	@override String get purchase_failed => 'Pembelian gagal.';
	@override String get credit_packages => 'Paket Kredit';
	@override String get buy_credit_now => 'Beli Kredit Sekarang';
	@override String get pro_title => 'PRO';
	@override String get discount_title => 'DISKON 50%';
	@override String get discount_subtitle => 'HARGA KREDIT';
}

// Path: generating
class _Translations$generating$id extends Translations$generating$en {
	_Translations$generating$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Membuat';
	@override String get your_video => 'video Anda';
	@override String get desc => 'Ini mungkin memakan waktu beberapa menit.\nMohon tunggu...';
	@override String get notify_me => 'Beritahu saya saat selesai';
	@override String get notified => 'Kami akan memberi tahu Anda saat video Anda siap!';
}

// Path: result
class _Translations$result$id extends Translations$result$en {
	_Translations$result$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video Hasil';
	@override String ready_message({required Object title}) => 'Video ${title} Anda sudah siap!';
	@override String get regenerate => 'Buat ulang';
	@override String get create_another => 'Buat Video Lain';
	@override String get share => 'Bagikan';
	@override String get download => 'Unduh';
	@override String get extend_video => 'Perpanjang video';
	@override String get extends_title => 'Perpanjangan';
	@override String get delete => 'Hapus';
	@override String get share_success => 'Tautan video disalin untuk dibagikan';
	@override String get download_success => 'Video disimpan ke galeri';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$id extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Privasi Data';
	@override String get desc => 'Foto Anda diproses dengan aman oleh sistem AI internal kami. Kami tidak membagikan, menjual, atau mengungkapkan informasi Anda kepada pihak ketiga mana pun.';
	@override String get cancel => 'Batal';
	@override String get confirm => 'Konfirmasi';
}

// Path: report_dialog
class _Translations$report_dialog$id extends Translations$report_dialog$en {
	_Translations$report_dialog$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Laporkan';
	@override String get desc => 'Apakah Anda yakin ingin mengirimkan laporan?';
	@override String get cancel => 'Batal';
	@override String get submit => 'Kirim';
	@override String get success => 'Video berhasil dilaporkan';
}

// Path: tips_sheet
class _Translations$tips_sheet$id extends Translations$tips_sheet$en {
	_Translations$tips_sheet$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tips untuk hasil terbaik';
	@override String get button_got_it => 'Saya mengerti!';
	@override String get use_photos => 'Gunakan foto seperti ini';
	@override String get avoid_photos => 'Hindari foto seperti ini';
	@override String get one_person => 'Satu orang';
	@override String get clear_face => 'Wajah jelas';
	@override String get half_body => 'Setengah badan';
	@override String get hidden_face => 'Wajah tersembunyi';
	@override String get multiple_people => 'Banyak orang';
	@override String get blurry_photo => 'Foto buram';
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
			'premium.tap_to_reveal' => 'Ketuk untuk Membuka',
			'premium.weekly' => 'Mingguan',
			'premium.weekly_desc' => 'Akses tak terbatas 7 hari, lalu 249.000đ/minggu',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/minggu',
			'premium.annually' => 'Tahunan',
			'premium.annually_desc' => 'Hanya 24.980đ/minggu',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/tahun',
			'premium.best_value' => 'Nilai Terbaik',
			'premium.save_80' => 'Hemat 80%',
			'premium.start_free_trial' => 'Mulai Uji Coba Gratis',
			'premium.start_my_subscription' => 'Mulai Berlangganan',
			'premium.auto_renewable' => 'Diperbarui Otomatis. Batalkan Kapan Saja.',
			'premium.privacy_policy' => 'Kebijakan Privasi',
			'premium.terms_of_use' => 'Ketentuan Penggunaan',
			'premium.restore' => 'Pulihkan',
			'premium.unlock_templates' => 'Buka 200+ Templat',
			'premium.fast_generation' => 'Pembuatan Video Cepat',
			'premium.discount_packs' => 'Diskon 50% Paket Kredit',
			'premium.videos_per_year' => '80 Video Per Tahun',
			'premium.buy_more_credit' => 'Beli Lebih Banyak Kredit',
			'premium.credit_desc' => '35 Kredit menghasilkan 1 video. Tanpa iklan saat menggunakan kredit yang dibeli.',
			'premium.credit_70' => '70 Kredit',
			'premium.credit_150' => '150 Kredit',
			'premium.credit_350' => '350 Kredit',
			'premium.credit_500' => '500 Kredit',
			'premium.credit_1000' => '1.000 Kredit',
			'premium.credit_6000' => '6.000 Kredit',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} video)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => 'Terpopuler',
			'premium.purchase_success' => ({required Object item}) => 'Pembelian berhasil: ${item}',
			'premium.purchase_failed' => 'Pembelian gagal.',
			'premium.credit_packages' => 'Paket Kredit',
			'premium.buy_credit_now' => 'Beli Kredit Sekarang',
			'premium.pro_title' => 'PRO',
			'premium.discount_title' => 'DISKON 50%',
			'premium.discount_subtitle' => 'HARGA KREDIT',
			'generating.title' => 'Membuat',
			'generating.your_video' => 'video Anda',
			'generating.desc' => 'Ini mungkin memakan waktu beberapa menit.\nMohon tunggu...',
			'generating.notify_me' => 'Beritahu saya saat selesai',
			'generating.notified' => 'Kami akan memberi tahu Anda saat video Anda siap!',
			'result.title' => 'Video Hasil',
			'result.ready_message' => ({required Object title}) => 'Video ${title} Anda sudah siap!',
			'result.regenerate' => 'Buat ulang',
			'result.create_another' => 'Buat Video Lain',
			'result.share' => 'Bagikan',
			'result.download' => 'Unduh',
			'result.extend_video' => 'Perpanjang video',
			'result.extends_title' => 'Perpanjangan',
			'result.delete' => 'Hapus',
			'result.share_success' => 'Tautan video disalin untuk dibagikan',
			'result.download_success' => 'Video disimpan ke galeri',
			'privacy_dialog.title' => 'Privasi Data',
			'privacy_dialog.desc' => 'Foto Anda diproses dengan aman oleh sistem AI internal kami. Kami tidak membagikan, menjual, atau mengungkapkan informasi Anda kepada pihak ketiga mana pun.',
			'privacy_dialog.cancel' => 'Batal',
			'privacy_dialog.confirm' => 'Konfirmasi',
			'report_dialog.title' => 'Laporkan',
			'report_dialog.desc' => 'Apakah Anda yakin ingin mengirimkan laporan?',
			'report_dialog.cancel' => 'Batal',
			'report_dialog.submit' => 'Kirim',
			'report_dialog.success' => 'Video berhasil dilaporkan',
			'tips_sheet.title' => 'Tips untuk hasil terbaik',
			'tips_sheet.button_got_it' => 'Saya mengerti!',
			'tips_sheet.use_photos' => 'Gunakan foto seperti ini',
			'tips_sheet.avoid_photos' => 'Hindari foto seperti ini',
			'tips_sheet.one_person' => 'Satu orang',
			'tips_sheet.clear_face' => 'Wajah jelas',
			'tips_sheet.half_body' => 'Setengah badan',
			'tips_sheet.hidden_face' => 'Wajah tersembunyi',
			'tips_sheet.multiple_people' => 'Banyak orang',
			'tips_sheet.blurry_photo' => 'Foto buram',
			_ => null,
		};
	}
}
