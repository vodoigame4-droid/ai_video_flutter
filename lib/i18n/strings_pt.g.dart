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
	@override late final _Translations$settings$pt settings = _Translations$settings$pt._(_root);
	@override late final _Translations$language$pt language = _Translations$language$pt._(_root);
	@override late final _Translations$premium$pt premium = _Translations$premium$pt._(_root);
	@override late final _Translations$generating$pt generating = _Translations$generating$pt._(_root);
	@override late final _Translations$result$pt result = _Translations$result$pt._(_root);
	@override late final _Translations$privacy_dialog$pt privacy_dialog = _Translations$privacy_dialog$pt._(_root);
	@override late final _Translations$report_dialog$pt report_dialog = _Translations$report_dialog$pt._(_root);
	@override late final _Translations$tips_sheet$pt tips_sheet = _Translations$tips_sheet$pt._(_root);
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
	@override String get generate_title => 'Gerar';
	@override String get upload_first_photo => 'Carregar primeira foto.';
	@override String get upload_last_photo => 'Carregar última foto.';
	@override String get upload_video_slot => 'Carregar vídeo.';
	@override String get upload_photo_slot => 'Carregar foto.';
	@override String photo_slot_num({required Object num}) => 'Foto ${num}';
	@override String get required_label => 'Obrigatório';
	@override String get optional_label => 'Opcional';
	@override String inspire_me_count({required Object count}) => 'Inspirar-me (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => 'Gerando seu vídeo...';
	@override String get select_mock_media => 'Selecionar mídia simulada';
	@override String get select_media_desc => 'Selecione um arquivo simulado para simular o upload';
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
	@override String get deleteTitle => 'Excluir este vídeo?';
	@override String get deleteDesc => 'Tem certeza de que deseja excluir este vídeo? Esta ação não pode ser desfeita.';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Excluir';
	@override String get generating => 'Gerando...';
	@override String get imageGeneration => 'Geração de imagem';
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

// Path: settings
class _Translations$settings$pt extends Translations$settings$en {
	_Translations$settings$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configurações';
	@override String get language => 'Idioma';
	@override String get termsOfService => 'Termos de Serviço';
	@override String get privacyPolicy => 'Política de Privacidade';
	@override String get contactUs => 'Contate-nos';
	@override String get version => 'Versão';
	@override String get myCredits => 'Meus Créditos';
	@override String get rateApp => 'Avaliar Aplicativo';
	@override String get userCode => 'Código do Usuário';
	@override String get copied => 'Copiado para a área de transferência!';
	@override String get termsOfUse => 'Termos de Uso';
}

// Path: language
class _Translations$language$pt extends Translations$language$en {
	_Translations$language$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Idioma';
	@override String get en => 'Inglês';
	@override String get ar => 'Árabe';
	@override String get de => 'Alemão';
	@override String get es => 'Espanhol';
	@override String get fr => 'Francês';
	@override String get hi => 'Híndi';
	@override String get id => 'Indonésio';
	@override String get ja => 'Japonês';
	@override String get ko => 'Coreano';
	@override String get pt => 'Português';
	@override String get vi => 'Vietnamita';
	@override String get zh => 'Chinês';
}

// Path: premium
class _Translations$premium$pt extends Translations$premium$en {
	_Translations$premium$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get tap_to_reveal => 'Toque para revelar';
	@override String get weekly => 'Semanal';
	@override String get weekly_desc => 'Acesso ilimitado de 7 dias, depois 249.000đ/semana';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/semana';
	@override String get annually => 'Anual';
	@override String get annually_desc => 'Apenas 24.980đ/semana';
	@override String get annually_price => '1.299.000 đ';
	@override String get annually_suffix => '/ano';
	@override String get best_value => 'Melhor valor';
	@override String get save_80 => 'Economize 80%';
	@override String get start_free_trial => 'Iniciar teste gratuito';
	@override String get start_my_subscription => 'Iniciar minha assinatura';
	@override String get auto_renewable => 'Renovável automaticamente. Cancele a qualquer momento.';
	@override String get privacy_policy => 'Política de privacidade';
	@override String get terms_of_use => 'Termos de uso';
	@override String get restore => 'Restaurar';
	@override String get unlock_templates => 'Desbloqueie mais de 200 modelos';
	@override String get fast_generation => 'Geração rápida de vídeo';
	@override String get discount_packs => '50% de desconto em pacotes de créditos';
	@override String get videos_per_year => '80 vídeos por ano';
	@override String get buy_more_credit => 'Comprar mais créditos';
	@override String get credit_desc => '35 créditos geram 1 vídeo. Sem anúncios usando créditos comprados.';
	@override String get credit_70 => '70 Créditos';
	@override String get credit_150 => '150 Créditos';
	@override String get credit_350 => '350 Créditos';
	@override String get credit_500 => '500 Créditos';
	@override String get credit_1000 => '1.000 Créditos';
	@override String get credit_6000 => '6.000 Créditos';
	@override String approx_videos({required Object count}) => '(~ ${count} vídeo)';
	@override String get price_70 => '149.000 đ';
	@override String get price_150 => '299.000 đ';
	@override String get price_350 => '599.000 đ';
	@override String get price_500 => '799.000 đ';
	@override String get price_1000 => '1.499.000 đ';
	@override String get price_6000 => '5.999.000 đ';
	@override String get most_popular => 'Mais popular';
	@override String purchase_success({required Object item}) => 'Compra efetuada: ${item}';
	@override String get purchase_failed => 'Falha na compra.';
	@override String get credit_packages => 'Pacotes de créditos';
	@override String get buy_credit_now => 'Comprar créditos agora';
	@override String get pro_title => 'PRO';
	@override String get discount_title => '50% DE DESCONTO';
	@override String get discount_subtitle => 'PREÇOS DOS CRÉDITOS';
}

// Path: generating
class _Translations$generating$pt extends Translations$generating$en {
	_Translations$generating$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gerando';
	@override String get your_video => 'seu vídeo';
	@override String get desc => 'Isso pode levar alguns minutos.\nPor favor, aguarde...';
	@override String get notify_me => 'Notificar-me quando concluído';
	@override String get notified => 'Nós o notificaremos quando seu vídeo estiver pronto!';
}

// Path: result
class _Translations$result$pt extends Translations$result$en {
	_Translations$result$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vídeo do Resultado';
	@override String ready_message({required Object title}) => 'Seu vídeo de ${title} está pronto!';
	@override String get regenerate => 'Regenerar';
	@override String get create_another => 'Criar outro vídeo';
	@override String get share => 'Compartilhar';
	@override String get download => 'Baixar';
}

// Path: privacy_dialog
class _Translations$privacy_dialog$pt extends Translations$privacy_dialog$en {
	_Translations$privacy_dialog$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Privacidade de Dados';
	@override String get desc => 'Suas fotos são processadas com segurança por nossos sistemas internos de IA. Não compartilhamos, vendemos ou divulgamos suas informações a terceiros.';
	@override String get cancel => 'Cancelar';
	@override String get confirm => 'Confirmar';
}

// Path: report_dialog
class _Translations$report_dialog$pt extends Translations$report_dialog$en {
	_Translations$report_dialog$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Denunciar';
	@override String get desc => 'Tem certeza de que deseja enviar a denúncia?';
	@override String get cancel => 'Cancelar';
	@override String get submit => 'Enviar';
	@override String get success => 'Vídeo denunciado com sucesso';
}

// Path: tips_sheet
class _Translations$tips_sheet$pt extends Translations$tips_sheet$en {
	_Translations$tips_sheet$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dicas para melhores resultados';
	@override String get button_got_it => 'Entendi!';
	@override String get use_photos => 'Use fotos como estas';
	@override String get avoid_photos => 'Evite fotos como estas';
	@override String get one_person => 'Uma pessoa';
	@override String get clear_face => 'Rosto nítido';
	@override String get half_body => 'Meio corpo';
	@override String get hidden_face => 'Rosto coberto';
	@override String get multiple_people => 'Várias pessoas';
	@override String get blurry_photo => 'Foto embaçada';
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
			'create.generate_title' => 'Gerar',
			'create.upload_first_photo' => 'Carregar primeira foto.',
			'create.upload_last_photo' => 'Carregar última foto.',
			'create.upload_video_slot' => 'Carregar vídeo.',
			'create.upload_photo_slot' => 'Carregar foto.',
			'create.photo_slot_num' => ({required Object num}) => 'Foto ${num}',
			'create.required_label' => 'Obrigatório',
			'create.optional_label' => 'Opcional',
			'create.inspire_me_count' => ({required Object count}) => 'Inspirar-me (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => 'Gerando seu vídeo...',
			'create.select_mock_media' => 'Selecionar mídia simulada',
			'create.select_media_desc' => 'Selecione um arquivo simulado para simular o upload',
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
			'profile.deleteTitle' => 'Excluir este vídeo?',
			'profile.deleteDesc' => 'Tem certeza de que deseja excluir este vídeo? Esta ação não pode ser desfeita.',
			'profile.cancel' => 'Cancelar',
			'profile.delete' => 'Excluir',
			'profile.generating' => 'Gerando...',
			'profile.imageGeneration' => 'Geração de imagem',
			'home_new.welcomeToAppName' => 'Bem-vindo ao Video AI',
			'home_new.imageToVideo' => 'Imagem para\nVídeo',
			'home_new.transitionVideo' => 'Vídeo de\nTransição',
			'home_new.imageToDance' => 'Imagem para\nDança',
			'home_new.unifiedVideo' => 'Vídeo\nUnificado',
			'templates.title' => 'Modelos',
			'templates.all' => 'Tudo',
			'templates.pro' => 'PRO',
			'settings.title' => 'Configurações',
			'settings.language' => 'Idioma',
			'settings.termsOfService' => 'Termos de Serviço',
			'settings.privacyPolicy' => 'Política de Privacidade',
			'settings.contactUs' => 'Contate-nos',
			'settings.version' => 'Versão',
			'settings.myCredits' => 'Meus Créditos',
			'settings.rateApp' => 'Avaliar Aplicativo',
			'settings.userCode' => 'Código do Usuário',
			'settings.copied' => 'Copiado para a área de transferência!',
			'settings.termsOfUse' => 'Termos de Uso',
			'language.title' => 'Idioma',
			'language.en' => 'Inglês',
			'language.ar' => 'Árabe',
			'language.de' => 'Alemão',
			'language.es' => 'Espanhol',
			'language.fr' => 'Francês',
			'language.hi' => 'Híndi',
			'language.id' => 'Indonésio',
			'language.ja' => 'Japonês',
			'language.ko' => 'Coreano',
			'language.pt' => 'Português',
			'language.vi' => 'Vietnamita',
			'language.zh' => 'Chinês',
			'premium.tap_to_reveal' => 'Toque para revelar',
			'premium.weekly' => 'Semanal',
			'premium.weekly_desc' => 'Acesso ilimitado de 7 dias, depois 249.000đ/semana',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/semana',
			'premium.annually' => 'Anual',
			'premium.annually_desc' => 'Apenas 24.980đ/semana',
			'premium.annually_price' => '1.299.000 đ',
			'premium.annually_suffix' => '/ano',
			'premium.best_value' => 'Melhor valor',
			'premium.save_80' => 'Economize 80%',
			'premium.start_free_trial' => 'Iniciar teste gratuito',
			'premium.start_my_subscription' => 'Iniciar minha assinatura',
			'premium.auto_renewable' => 'Renovável automaticamente. Cancele a qualquer momento.',
			'premium.privacy_policy' => 'Política de privacidade',
			'premium.terms_of_use' => 'Termos de uso',
			'premium.restore' => 'Restaurar',
			'premium.unlock_templates' => 'Desbloqueie mais de 200 modelos',
			'premium.fast_generation' => 'Geração rápida de vídeo',
			'premium.discount_packs' => '50% de desconto em pacotes de créditos',
			'premium.videos_per_year' => '80 vídeos por ano',
			'premium.buy_more_credit' => 'Comprar mais créditos',
			'premium.credit_desc' => '35 créditos geram 1 vídeo. Sem anúncios usando créditos comprados.',
			'premium.credit_70' => '70 Créditos',
			'premium.credit_150' => '150 Créditos',
			'premium.credit_350' => '350 Créditos',
			'premium.credit_500' => '500 Créditos',
			'premium.credit_1000' => '1.000 Créditos',
			'premium.credit_6000' => '6.000 Créditos',
			'premium.approx_videos' => ({required Object count}) => '(~ ${count} vídeo)',
			'premium.price_70' => '149.000 đ',
			'premium.price_150' => '299.000 đ',
			'premium.price_350' => '599.000 đ',
			'premium.price_500' => '799.000 đ',
			'premium.price_1000' => '1.499.000 đ',
			'premium.price_6000' => '5.999.000 đ',
			'premium.most_popular' => 'Mais popular',
			'premium.purchase_success' => ({required Object item}) => 'Compra efetuada: ${item}',
			'premium.purchase_failed' => 'Falha na compra.',
			'premium.credit_packages' => 'Pacotes de créditos',
			'premium.buy_credit_now' => 'Comprar créditos agora',
			'premium.pro_title' => 'PRO',
			'premium.discount_title' => '50% DE DESCONTO',
			'premium.discount_subtitle' => 'PREÇOS DOS CRÉDITOS',
			'generating.title' => 'Gerando',
			'generating.your_video' => 'seu vídeo',
			'generating.desc' => 'Isso pode levar alguns minutos.\nPor favor, aguarde...',
			'generating.notify_me' => 'Notificar-me quando concluído',
			'generating.notified' => 'Nós o notificaremos quando seu vídeo estiver pronto!',
			'result.title' => 'Vídeo do Resultado',
			'result.ready_message' => ({required Object title}) => 'Seu vídeo de ${title} está pronto!',
			'result.regenerate' => 'Regenerar',
			'result.create_another' => 'Criar outro vídeo',
			'result.share' => 'Compartilhar',
			'result.download' => 'Baixar',
			'privacy_dialog.title' => 'Privacidade de Dados',
			'privacy_dialog.desc' => 'Suas fotos são processadas com segurança por nossos sistemas internos de IA. Não compartilhamos, vendemos ou divulgamos suas informações a terceiros.',
			'privacy_dialog.cancel' => 'Cancelar',
			'privacy_dialog.confirm' => 'Confirmar',
			'report_dialog.title' => 'Denunciar',
			'report_dialog.desc' => 'Tem certeza de que deseja enviar a denúncia?',
			'report_dialog.cancel' => 'Cancelar',
			'report_dialog.submit' => 'Enviar',
			'report_dialog.success' => 'Vídeo denunciado com sucesso',
			'tips_sheet.title' => 'Dicas para melhores resultados',
			'tips_sheet.button_got_it' => 'Entendi!',
			'tips_sheet.use_photos' => 'Use fotos como estas',
			'tips_sheet.avoid_photos' => 'Evite fotos como estas',
			'tips_sheet.one_person' => 'Uma pessoa',
			'tips_sheet.clear_face' => 'Rosto nítido',
			'tips_sheet.half_body' => 'Meio corpo',
			'tips_sheet.hidden_face' => 'Rosto coberto',
			'tips_sheet.multiple_people' => 'Várias pessoas',
			'tips_sheet.blurry_photo' => 'Foto embaçada',
			_ => null,
		};
	}
}
