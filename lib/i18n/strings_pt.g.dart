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
class TranslationsPt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$pt common = _Translations$common$pt._(_root);
	@override late final _Translations$home$pt home = _Translations$home$pt._(_root);
	@override late final _Translations$create$pt create = _Translations$create$pt._(_root);
	@override late final _Translations$leave_dialog$pt leave_dialog = _Translations$leave_dialog$pt._(_root);
	@override late final _Translations$splash$pt splash = _Translations$splash$pt._(_root);
	@override late final _Translations$onboarding$pt onboarding = _Translations$onboarding$pt._(_root);
	@override late final _Translations$dashboard$pt dashboard = _Translations$dashboard$pt._(_root);
	@override late final _Translations$profile$pt profile = _Translations$profile$pt._(_root);
	@override late final _Translations$home_new$pt home_new = _Translations$home_new$pt._(_root);
	@override late final _Translations$templates$pt templates = _Translations$templates$pt._(_root);
}

// Path: common
class _Translations$common$pt extends Translations$common$en {
	_Translations$common$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'Ver tudo';
	@override String get stay => 'Ficar';
	@override String get leave => 'Sair';
	@override String get camera => 'Câmera';
	@override String get gallery => 'Galeria';
	@override String get generate => 'Gerar';
}

// Path: home
class _Translations$home$pt extends Translations$home$en {
	_Translations$home$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vídeo IA';
	@override String get trending => 'Tendências';
	@override String get new_section => 'Novo';
	@override String get toy_box => 'Caixa de figuras de brinquedo';
	@override String get epic_morph => 'Metamorfose épica';
	@override String get anime => 'Anime';
	@override String get discover => 'Descobrir';
}

// Path: create
class _Translations$create$pt extends Translations$create$en {
	_Translations$create$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'Selfie do Aquaman';
	@override String get tap_upload => 'Toque aqui para carregar sua foto.';
	@override String get select_upload_title => 'Selecione para carregar sua foto';
	@override String get upload_image => 'Carregar imagem';
	@override String get custom_prompt => 'Prompt personalizado';
	@override String get prompt_placeholder => 'Retrato feminino realista, close-up, olhando para a câmera, piscando naturalmente, iluminação de estúdio azul, cinematográfico, ultra detalhado';
	@override String get inspire_me => 'Inspirar-me';
	@override String get video_settings => 'Configurações do vídeo';
	@override String get quality => 'Qualidade';
	@override String get quality_desc => 'Escolha a qualidade do vídeo';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'Duração';
	@override String get duration_desc => 'Escolha a duração do vídeo';
	@override String get sec_4s => '4s';
	@override String get sec_8s => '8s';
	@override String get sec_5s => '5s';
	@override String get sec_10s => '10s';
	@override String get sec_15s => '15s';
}

// Path: leave_dialog
class _Translations$leave_dialog$pt extends Translations$leave_dialog$en {
	_Translations$leave_dialog$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sair sem salvar?';
	@override String get desc => 'Deseja continuar editando ou sair agora?';
}

// Path: splash
class _Translations$splash$pt extends Translations$splash$en {
	_Translations$splash$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Video AI';
}

// Path: onboarding
class _Translations$onboarding$pt extends Translations$onboarding$en {
	_Translations$onboarding$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$pt page1 = _Translations$onboarding$page1$pt._(_root);
	@override late final _Translations$onboarding$page2$pt page2 = _Translations$onboarding$page2$pt._(_root);
	@override late final _Translations$onboarding$page3$pt page3 = _Translations$onboarding$page3$pt._(_root);
	@override late final _Translations$onboarding$page4$pt page4 = _Translations$onboarding$page4$pt._(_root);
	@override late final _Translations$onboarding$page5$pt page5 = _Translations$onboarding$page5$pt._(_root);
}

// Path: dashboard
class _Translations$dashboard$pt extends Translations$dashboard$en {
	_Translations$dashboard$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get user => 'Perfil';
	@override String get createVideo => 'Criar Vídeo';
}

// Path: profile
class _Translations$profile$pt extends Translations$profile$en {
	_Translations$profile$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfil';
	@override String get upgradeTitle => 'Upgrade Premium';
	@override String get upgradeSubtitle => 'Adicionar Créditos - Sem marca d\'água';
	@override String get goPremium => 'Seja Premium';
	@override String get myVideo => 'Meu Vídeo';
	@override String get liked => 'Curtido';
	@override String get noVideos => 'Ainda sem vídeos';
	@override String get noVideosDesc => 'Crie seu primeiro vídeo IA e ele aparecerá aqui.';
}

// Path: home_new
class _Translations$home_new$pt extends Translations$home_new$en {
	_Translations$home_new$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'Bem-vindo ao Video AI';
	@override String get imageToVideo => 'Imagem para\nVídeo';
	@override String get transitionVideo => 'Vídeo de\nTransição';
	@override String get imageToDance => 'Imagem para\nDança';
	@override String get unifiedVideo => 'Vídeo\nUnificado';
}

// Path: templates
class _Translations$templates$pt extends Translations$templates$en {
	_Translations$templates$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modelos';
	@override String get all => 'Tudo';
	@override String get pro => 'PRO';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$pt extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bem-vindo ao Video AI';
	@override String get subtitle => 'Sua jornada criativa começa aqui...';
	@override String get button => 'Começar';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$pt extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Imagem para vídeo';
	@override String get subtitle => 'Carregar imagem, escrever prompt';
	@override String get button => 'Continuar';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$pt extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => '2 imagens para vídeo';
	@override String get subtitle => 'Carregar 2 imagens, escrever prompt';
	@override String get button => 'Continuar';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$pt extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dança de imagem';
	@override String get subtitle => 'Carregar 1 vídeo, 1 foto';
	@override String get button => 'Continuar';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$pt extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fusão de vídeo';
	@override String get subtitle => 'Carregar suas fotos';
	@override String get button => 'Continuar';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'Ver tudo',
			'common.stay' => 'Ficar',
			'common.leave' => 'Sair',
			'common.camera' => 'Câmera',
			'common.gallery' => 'Galeria',
			'common.generate' => 'Gerar',
			'home.title' => 'Vídeo IA',
			'home.trending' => 'Tendências',
			'home.new_section' => 'Novo',
			'home.toy_box' => 'Caixa de figuras de brinquedo',
			'home.epic_morph' => 'Metamorfose épica',
			'home.anime' => 'Anime',
			'home.discover' => 'Descobrir',
			'create.selfie_aquaman' => 'Selfie do Aquaman',
			'create.tap_upload' => 'Toque aqui para carregar sua foto.',
			'create.select_upload_title' => 'Selecione para carregar sua foto',
			'create.upload_image' => 'Carregar imagem',
			'create.custom_prompt' => 'Prompt personalizado',
			'create.prompt_placeholder' => 'Retrato feminino realista, close-up, olhando para a câmera, piscando naturalmente, iluminação de estúdio azul, cinematográfico, ultra detalhado',
			'create.inspire_me' => 'Inspirar-me',
			'create.video_settings' => 'Configurações do vídeo',
			'create.quality' => 'Qualidade',
			'create.quality_desc' => 'Escolha a qualidade do vídeo',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Duração',
			'create.duration_desc' => 'Escolha a duração do vídeo',
			'create.sec_4s' => '4s',
			'create.sec_8s' => '8s',
			'create.sec_5s' => '5s',
			'create.sec_10s' => '10s',
			'create.sec_15s' => '15s',
			'leave_dialog.title' => 'Sair sem salvar?',
			'leave_dialog.desc' => 'Deseja continuar editando ou sair agora?',
			'splash.appName' => 'Video AI',
			'onboarding.page1.title' => 'Bem-vindo ao Video AI',
			'onboarding.page1.subtitle' => 'Sua jornada criativa começa aqui...',
			'onboarding.page1.button' => 'Começar',
			'onboarding.page2.title' => 'Imagem para vídeo',
			'onboarding.page2.subtitle' => 'Carregar imagem, escrever prompt',
			'onboarding.page2.button' => 'Continuar',
			'onboarding.page3.title' => '2 imagens para vídeo',
			'onboarding.page3.subtitle' => 'Carregar 2 imagens, escrever prompt',
			'onboarding.page3.button' => 'Continuar',
			'onboarding.page4.title' => 'Dança de imagem',
			'onboarding.page4.subtitle' => 'Carregar 1 vídeo, 1 foto',
			'onboarding.page4.button' => 'Continuar',
			'onboarding.page5.title' => 'Fusão de vídeo',
			'onboarding.page5.subtitle' => 'Carregar suas fotos',
			'onboarding.page5.button' => 'Continuar',
			'dashboard.home' => 'Início',
			'dashboard.user' => 'Perfil',
			'dashboard.createVideo' => 'Criar Vídeo',
			'profile.title' => 'Perfil',
			'profile.upgradeTitle' => 'Upgrade Premium',
			'profile.upgradeSubtitle' => 'Adicionar Créditos - Sem marca d\'água',
			'profile.goPremium' => 'Seja Premium',
			'profile.myVideo' => 'Meu Vídeo',
			'profile.liked' => 'Curtido',
			'profile.noVideos' => 'Ainda sem vídeos',
			'profile.noVideosDesc' => 'Crie seu primeiro vídeo IA e ele aparecerá aqui.',
			'home_new.welcomeToAppName' => 'Bem-vindo ao Video AI',
			'home_new.imageToVideo' => 'Imagem para\nVídeo',
			'home_new.transitionVideo' => 'Vídeo de\nTransição',
			'home_new.imageToDance' => 'Imagem para\nDança',
			'home_new.unifiedVideo' => 'Vídeo\nUnificado',
			'templates.title' => 'Modelos',
			'templates.all' => 'Tudo',
			'templates.pro' => 'PRO',
			_ => null,
		};
	}
}
