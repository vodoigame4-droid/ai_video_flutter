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
	@override late final _Translations$onboarding$es onboarding = _Translations$onboarding$es._(_root);
	@override late final _Translations$dashboard$es dashboard = _Translations$dashboard$es._(_root);
	@override late final _Translations$profile$es profile = _Translations$profile$es._(_root);
	@override late final _Translations$home_new$es home_new = _Translations$home_new$es._(_root);
	@override late final _Translations$templates$es templates = _Translations$templates$es._(_root);
	@override late final _Translations$settings$es settings = _Translations$settings$es._(_root);
	@override late final _Translations$language$es language = _Translations$language$es._(_root);
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

// Path: onboarding
class _Translations$onboarding$es extends Translations$onboarding$en {
	_Translations$onboarding$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$es page1 = _Translations$onboarding$page1$es._(_root);
	@override late final _Translations$onboarding$page2$es page2 = _Translations$onboarding$page2$es._(_root);
	@override late final _Translations$onboarding$page3$es page3 = _Translations$onboarding$page3$es._(_root);
	@override late final _Translations$onboarding$page4$es page4 = _Translations$onboarding$page4$es._(_root);
	@override late final _Translations$onboarding$page5$es page5 = _Translations$onboarding$page5$es._(_root);
}

// Path: dashboard
class _Translations$dashboard$es extends Translations$dashboard$en {
	_Translations$dashboard$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get user => 'Perfil';
	@override String get createVideo => 'Crear Video';
}

// Path: profile
class _Translations$profile$es extends Translations$profile$en {
	_Translations$profile$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfil';
	@override String get upgradeTitle => 'Actualización Premium';
	@override String get upgradeSubtitle => 'Agregar créditos - Sin marca de agua';
	@override String get goPremium => 'Hacerse Premium';
	@override String get myVideo => 'Mi Video';
	@override String get liked => 'Me gusta';
	@override String get noVideos => 'Sin videos aún';
	@override String get noVideosDesc => 'Crea tu primer video IA y aparecerá aquí.';
	@override String get deleteTitle => '¿Eliminar este video?';
	@override String get deleteDesc => '¿Está seguro de que desea eliminar este video? Esta acción no se puede deshacer.';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Eliminar';
	@override String get generating => 'Generando...';
	@override String get imageGeneration => 'Generación de imagen';
}

// Path: home_new
class _Translations$home_new$es extends Translations$home_new$en {
	_Translations$home_new$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'Bienvenido a Video AI';
	@override String get imageToVideo => 'Imagen a\nVideo';
	@override String get transitionVideo => 'Video de\nTransición';
	@override String get imageToDance => 'Imagen a\nBaile';
	@override String get unifiedVideo => 'Video\nUnificado';
}

// Path: templates
class _Translations$templates$es extends Translations$templates$en {
	_Translations$templates$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Plantillas';
	@override String get all => 'Todo';
	@override String get pro => 'PRO';
}

// Path: settings
class _Translations$settings$es extends Translations$settings$en {
	_Translations$settings$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajustes';
	@override String get language => 'Idioma';
	@override String get termsOfService => 'Términos de servicio';
	@override String get privacyPolicy => 'Política de privacidad';
	@override String get contactUs => 'Contáctenos';
	@override String get version => 'Versión';
	@override String get myCredits => 'Mis Créditos';
	@override String get rateApp => 'Calificar aplicación';
	@override String get userCode => 'Código de usuario';
	@override String get copied => '¡Copiado al portapapeles!';
	@override String get termsOfUse => 'Términos de uso';
}

// Path: language
class _Translations$language$es extends Translations$language$en {
	_Translations$language$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Idioma';
	@override String get en => 'Inglés';
	@override String get ar => 'Árabe';
	@override String get de => 'Alemán';
	@override String get es => 'Español';
	@override String get fr => 'Francés';
	@override String get hi => 'Hindi';
	@override String get id => 'Indonesio';
	@override String get ja => 'Japonés';
	@override String get ko => 'Coreano';
	@override String get pt => 'Portugués';
	@override String get vi => 'Vietnamita';
	@override String get zh => 'Chino';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$es extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bienvenido a Video AI';
	@override String get subtitle => 'Tu viaje creativo comienza aquí...';
	@override String get button => 'Comenzar';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$es extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Imagen a video';
	@override String get subtitle => 'Sube una imagen, escribe una descripción';
	@override String get button => 'Continuar';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$es extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '2 imágenes a video';
	@override String get subtitle => 'Sube 2 imágenes, escribe una descripción';
	@override String get button => 'Continuar';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$es extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Danza de imagen';
	@override String get subtitle => 'Sube 1 video, 1 foto';
	@override String get button => 'Continuar';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$es extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fusión de video';
	@override String get subtitle => 'Sube tus fotos';
	@override String get button => 'Continuar';
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
			'onboarding.page1.title' => 'Bienvenido a Video AI',
			'onboarding.page1.subtitle' => 'Tu viaje creativo comienza aquí...',
			'onboarding.page1.button' => 'Comenzar',
			'onboarding.page2.title' => 'Imagen a video',
			'onboarding.page2.subtitle' => 'Sube una imagen, escribe una descripción',
			'onboarding.page2.button' => 'Continuar',
			'onboarding.page3.title' => '2 imágenes a video',
			'onboarding.page3.subtitle' => 'Sube 2 imágenes, escribe una descripción',
			'onboarding.page3.button' => 'Continuar',
			'onboarding.page4.title' => 'Danza de imagen',
			'onboarding.page4.subtitle' => 'Sube 1 video, 1 foto',
			'onboarding.page4.button' => 'Continuar',
			'onboarding.page5.title' => 'Fusión de video',
			'onboarding.page5.subtitle' => 'Sube tus fotos',
			'onboarding.page5.button' => 'Continuar',
			'dashboard.home' => 'Inicio',
			'dashboard.user' => 'Perfil',
			'dashboard.createVideo' => 'Crear Video',
			'profile.title' => 'Perfil',
			'profile.upgradeTitle' => 'Actualización Premium',
			'profile.upgradeSubtitle' => 'Agregar créditos - Sin marca de agua',
			'profile.goPremium' => 'Hacerse Premium',
			'profile.myVideo' => 'Mi Video',
			'profile.liked' => 'Me gusta',
			'profile.noVideos' => 'Sin videos aún',
			'profile.noVideosDesc' => 'Crea tu primer video IA y aparecerá aquí.',
			'profile.deleteTitle' => '¿Eliminar este video?',
			'profile.deleteDesc' => '¿Está seguro de que desea eliminar este video? Esta acción no se puede deshacer.',
			'profile.cancel' => 'Cancelar',
			'profile.delete' => 'Eliminar',
			'profile.generating' => 'Generando...',
			'profile.imageGeneration' => 'Generación de imagen',
			'home_new.welcomeToAppName' => 'Bienvenido a Video AI',
			'home_new.imageToVideo' => 'Imagen a\nVideo',
			'home_new.transitionVideo' => 'Video de\nTransición',
			'home_new.imageToDance' => 'Imagen a\nBaile',
			'home_new.unifiedVideo' => 'Video\nUnificado',
			'templates.title' => 'Plantillas',
			'templates.all' => 'Todo',
			'templates.pro' => 'PRO',
			'settings.title' => 'Ajustes',
			'settings.language' => 'Idioma',
			'settings.termsOfService' => 'Términos de servicio',
			'settings.privacyPolicy' => 'Política de privacidad',
			'settings.contactUs' => 'Contáctenos',
			'settings.version' => 'Versión',
			'settings.myCredits' => 'Mis Créditos',
			'settings.rateApp' => 'Calificar aplicación',
			'settings.userCode' => 'Código de usuario',
			'settings.copied' => '¡Copiado al portapapeles!',
			'settings.termsOfUse' => 'Términos de uso',
			'language.title' => 'Idioma',
			'language.en' => 'Inglés',
			'language.ar' => 'Árabe',
			'language.de' => 'Alemán',
			'language.es' => 'Español',
			'language.fr' => 'Francés',
			'language.hi' => 'Hindi',
			'language.id' => 'Indonesio',
			'language.ja' => 'Japonés',
			'language.ko' => 'Coreano',
			'language.pt' => 'Portugués',
			'language.vi' => 'Vietnamita',
			'language.zh' => 'Chino',
			_ => null,
		};
	}
}
