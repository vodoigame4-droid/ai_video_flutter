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
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$es common = _Translations$common$es._(_root);
	@override late final _Translations$home$es home = _Translations$home$es._(_root);
	@override late final _Translations$create$es create = _Translations$create$es._(_root);
	@override late final _Translations$leave_dialog$es leave_dialog = _Translations$leave_dialog$es._(_root);
	@override late final _Translations$splash$es splash = _Translations$splash$es._(_root);
}

// Path: common
class _Translations$common$es extends Translations$common$en {
	_Translations$common$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'Ver todo';
	@override String get stay => 'Quedarse';
	@override String get leave => 'Salir';
	@override String get camera => 'Cámara';
	@override String get gallery => 'Galería';
	@override String get generate => 'Generar';
}

// Path: home
class _Translations$home$es extends Translations$home$en {
	_Translations$home$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video IA';
	@override String get trending => 'Tendencias';
	@override String get new_section => 'Nuevo';
	@override String get toy_box => 'Caja de figuras de juguete';
	@override String get epic_morph => 'Transformación épica';
	@override String get anime => 'Anime';
	@override String get discover => 'Descubrir';
}

// Path: create
class _Translations$create$es extends Translations$create$en {
	_Translations$create$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'Selfie Aquaman';
	@override String get tap_upload => 'Toque aquí para subir su foto.';
	@override String get select_upload_title => 'Seleccionar para subir su foto';
	@override String get upload_image => 'Subir imagen';
	@override String get custom_prompt => 'Indicación personalizada';
	@override String get prompt_placeholder => 'Retrato femenino realista, primer plano, mirando a la cámara, parpadeando naturalmente, iluminación de estudio azul, cinematográfico, ultra detallado';
	@override String get inspire_me => 'Inspirarme';
	@override String get video_settings => 'Ajustes de video';
	@override String get quality => 'Calidad';
	@override String get quality_desc => 'Elegir calidad de video';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'Duración';
	@override String get duration_desc => 'Elegir longitud del video';
	@override String get sec_4s => '4s';
	@override String get sec_8s => '8s';
	@override String get sec_5s => '5s';
	@override String get sec_10s => '10s';
	@override String get sec_15s => '15s';
}

// Path: leave_dialog
class _Translations$leave_dialog$es extends Translations$leave_dialog$en {
	_Translations$leave_dialog$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Salir sin guardar?';
	@override String get desc => '¿Desea continuar editando o salir ahora?';
}

// Path: splash
class _Translations$splash$es extends Translations$splash$en {
	_Translations$splash$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Video AI';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'Ver todo',
			'common.stay' => 'Quedarse',
			'common.leave' => 'Salir',
			'common.camera' => 'Cámara',
			'common.gallery' => 'Galería',
			'common.generate' => 'Generar',
			'home.title' => 'Video IA',
			'home.trending' => 'Tendencias',
			'home.new_section' => 'Nuevo',
			'home.toy_box' => 'Caja de figuras de juguete',
			'home.epic_morph' => 'Transformación épica',
			'home.anime' => 'Anime',
			'home.discover' => 'Descubrir',
			'create.selfie_aquaman' => 'Selfie Aquaman',
			'create.tap_upload' => 'Toque aquí para subir su foto.',
			'create.select_upload_title' => 'Seleccionar para subir su foto',
			'create.upload_image' => 'Subir imagen',
			'create.custom_prompt' => 'Indicación personalizada',
			'create.prompt_placeholder' => 'Retrato femenino realista, primer plano, mirando a la cámara, parpadeando naturalmente, iluminación de estudio azul, cinematográfico, ultra detallado',
			'create.inspire_me' => 'Inspirarme',
			'create.video_settings' => 'Ajustes de video',
			'create.quality' => 'Calidad',
			'create.quality_desc' => 'Elegir calidad de video',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Duración',
			'create.duration_desc' => 'Elegir longitud del video',
			'create.sec_4s' => '4s',
			'create.sec_8s' => '8s',
			'create.sec_5s' => '5s',
			'create.sec_10s' => '10s',
			'create.sec_15s' => '15s',
			'leave_dialog.title' => '¿Salir sin guardar?',
			'leave_dialog.desc' => '¿Desea continuar editando o salir ahora?',
			'splash.appName' => 'Video AI',
			_ => null,
		};
	}
}
