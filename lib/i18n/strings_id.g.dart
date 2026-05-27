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
}

// Path: leave_dialog
class _Translations$leave_dialog$id extends Translations$leave_dialog$en {
	_Translations$leave_dialog$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keluar tanpa menyimpan?';
	@override String get desc => 'Apakah Anda ingin melanjutkan pengeditan atau keluar sekarang?';
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
			'leave_dialog.title' => 'Keluar tanpa menyimpan?',
			'leave_dialog.desc' => 'Apakah Anda ingin melanjutkan pengeditan atau keluar sekarang?',
			_ => null,
		};
	}
}
