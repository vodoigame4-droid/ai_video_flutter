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
	@override late final _Translations$errors$pt errors = _Translations$errors$pt._(_root);
	@override late final _Translations$guide$pt guide = _Translations$guide$pt._(_root);
	@override late final _Translations$checkin$pt checkin = _Translations$checkin$pt._(_root);
	@override late final _Translations$connectivity$pt connectivity = _Translations$connectivity$pt._(_root);
	@override late final _Translations$notification$pt notification = _Translations$notification$pt._(_root);
	@override late final _Translations$rating_dialog$pt rating_dialog = _Translations$rating_dialog$pt._(_root);
	@override late final _Translations$debug$pt debug = _Translations$debug$pt._(_root);
	@override late final _Translations$permission$pt permission = _Translations$permission$pt._(_root);
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
	@override String get processing => 'Processando...';
	@override String get ok => 'OK';
	@override String get btn_continue => 'Continuar';
}

// Path: home
class _Translations$home$pt extends Translations$home$en {
	_Translations$home$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'VidoVerse';
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
	@override String get tap_upload => 'Carregue sua foto e crie seu vídeo de IA em segundos.';
	@override String get tap_to_upload_photo => 'Toque aqui para carregar a sua foto.';
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
	@override String get inspiring => 'A IA está pensando...';
	@override String get limit_dialog_title => 'Sem sugestões gratuitas';
	@override String get limit_dialog_desc => 'Você usou todas as 3 sugestões gratuitas. Atualize para VIP para desfrutar de sugestões ilimitadas!';
	@override String get limit_dialog_btn => 'Atualizar para VIP';
	@override String get limit_dialog_cancel => 'Talvez mais tarde';
	@override String get inspire_me_pro => 'Inspirar-me (PRO)';
	@override String get trim_title => 'Cortar vídeo';
	@override String get trim_save => 'Salvar';
	@override String get trimming_loading => 'Cortando vídeo...';
	@override String get please_add_image_first => 'Por favor, adicione uma imagem primeiro';
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
	@override String get appName => 'VidoVerse';
	@override String get loading => 'Carregando...';
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
	@override String get imageGeneration => 'Geração de vídeo';
}

// Path: home_new
class _Translations$home_new$pt extends Translations$home_new$en {
	_Translations$home_new$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => 'Bem-vindo ao VidoVerse';
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
	@override String weekly_desc({required Object price}) => 'Acesso ilimitado de 7 dias, depois ${price}/semana';
	@override String get weekly_price => '199.000 đ';
	@override String get weekly_suffix => '/semana';
	@override String get annually => 'Anual';
	@override String annually_desc({required Object price}) => 'Apenas ${price}/semana';
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
	@override String get claim_discount => 'Reivindicar desconto';
	@override String get no_thanks => 'Não, obrigado';
	@override String get buy_now => 'Comprar agora';
	@override String get sub_discount_banner => 'ATÉ 50% DE DESCONTO COM ASSINATURA';
	@override String get unlock_premium_desc => 'Desbloqueie todos os recursos premium com um desconto especial';
	@override String get credit_5000 => '5.000 Créditos';
	@override String get price_5000 => '5.999.000 đ';
	@override String get itunes_disclaimer => 'Se você assinar, o pagamento será cobrado na sua conta do iTunes assim que a compra for confirmada. Sua assinatura será renovada automaticamente, a menos que seja cancelada pelo menos 24 horas antes do término do período de faturamento atual. A renovação automática pode ser gerenciada a qualquer momento nas configurações da sua conta da iTunes Store.';
	@override String get buy_credit => 'Comprar créditos';
	@override String save_up_to({required Object percent}) => 'Economize até ${percent}%';
	@override String get discount_price => '799.000';
	@override String get discount_price_suffix => '/ano';
	@override String billed_yearly({required Object price}) => 'Cobrado ${price}/ano - Cancele a qualquer momento';
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
	@override String get notification_denied => 'Permissão de notificação negada. Ative nas Configurações.';
	@override String get failed => 'Falha ao gerar o vídeo. Por favor, tente novamente.';
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
	@override String get extend_video => 'Estender vídeo';
	@override String get extends_title => 'Extensões';
	@override String get delete => 'Excluir';
	@override String get share_success => 'Link do vídeo copiado para compartilhar';
	@override String get download_success => 'Vídeo salvo na galeria';
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
	@override String get bottom_sheet_title => 'Denunciar vídeo';
	@override String get option_offensive => 'Conteúdo ofensivo ou inadequado';
	@override String get option_quality => 'Qualidade ruim ou rostros distorcidos';
	@override String get option_copyright => 'Violação de direitos autorais';
	@override String get option_bug => 'Erro de geração de vídeo ou falha';
	@override String get option_other => 'Outros problemas';
	@override String get thanks_msg => 'Obrigado pela sua denúncia, iremos analisar e modificar.';
	@override String get hint_other => 'Por favor, descreva o problema em detalhes...';
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

// Path: errors
class _Translations$errors$pt extends Translations$errors$en {
	_Translations$errors$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

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
	@override String get not_enough_suggestion_free => 'Sugestões gratuitas insuficientes, por favor atualize para VIP';
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
	@override String get video_too_long => 'O vídeo deve ter menos de 10 segundos.';
	@override String get iap_purchase_cancelled => 'Compra cancelada.';
	@override String get iap_purchase_in_progress => 'Compra já em andamento.';
	@override String get iap_purchase_failed => 'Falha na compra.';
}

// Path: guide
class _Translations$guide$pt extends Translations$guide$en {
	_Translations$guide$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get step_1 => 'Passo 1';
	@override String get step_2 => 'Passo 2';
	@override String get upload_photo => 'Enviar foto';
	@override String get got_it => 'Entendi!';
	@override String get write_prompt => 'Escrever Prompt';
	@override String get upload_2_photos => 'Carregar 2 fotos';
	@override String get generate => 'Gerar';
	@override String get upload_portrait => 'Carregar retrato';
	@override String get choose_style => 'Escolher estilo';
	@override String get add_assets => 'Adicionar recursos';
}

// Path: checkin
class _Translations$checkin$pt extends Translations$checkin$en {
	_Translations$checkin$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Check-in';
	@override String get subtitle => 'Prêmios diários!';
	@override String get today => 'Hoje';
	@override String day({required Object n}) => 'Dia ${n}';
	@override String get check_in_btn => 'Fichar';
	@override String get daily_bonus_notification => 'Notificação';
	@override String get disable_notification_title => 'Desativar notificações de check-in?';
	@override String get disable_notification_desc => 'Você perderá as recompensas diárias de login e outros bônus emocionantes. Tem certeza de que deseja desativar?';
	@override String get disable_notification_keep => 'Manter ativado';
	@override String get disable_notification_disable => 'Desativar';
	@override String check_in_success({required Object credits}) => '+${credits} Créditos! Check-in realizado com sucesso.';
}

// Path: connectivity
class _Translations$connectivity$pt extends Translations$connectivity$en {
	_Translations$connectivity$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get no_internet_title => 'Sem conexão';
	@override String get no_internet_desc => 'Por favor, verifique sua conexão com a internet para continuar usando o aplicativo.';
	@override String get retry_button => 'Tentar novamente a conexão';
}

// Path: notification
class _Translations$notification$pt extends Translations$notification$en {
	_Translations$notification$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get channel_name => 'Notificações importantes';
	@override String get channel_description => 'Este canal é usado para notificações importantes.';
	@override String get checkin_title => 'Lembrete de Check-in Diário 🎁';
	@override String get checkin_body => 'É hora de resgatar seus créditos diários gratuitos! Abra o aplicativo agora.';
	@override String get test_notification => 'Testar';
}

// Path: rating_dialog
class _Translations$rating_dialog$pt extends Translations$rating_dialog$en {
	_Translations$rating_dialog$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Está gostando do aplicativo?';
	@override String get desc => 'Avalie-nos e ajude-nos a melhorar a sua experiência. Obrigado!';
	@override String get support_us => 'Apoie-nos';
	@override String get encourage_us => 'Incentive-nos';
	@override String get rate_on_store => 'Avaliar na Loja';
	@override String get maybe_later => 'Mais tarde';
	@override String get success => 'Obrigado pelo seu apoio!';
}

// Path: debug
class _Translations$debug$pt extends Translations$debug$en {
	_Translations$debug$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Menu de depuração';
	@override String get iap_page => 'Página IAP';
	@override String get buy_credits => 'Comprar créditos';
	@override String get generation_iap => 'Geração IAP';
	@override String get generation_buy_credits => 'Geração comprar créditos';
	@override String get discount => 'Página de desconto';
	@override String get paywall_video => 'Página de vídeo paywall';
	@override String get generating_page => 'Visualização da página de geração';
}

// Path: permission
class _Translations$permission$pt extends Translations$permission$en {
	_Translations$permission$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get camera_title => 'Permissão de Câmera';
	@override String get camera_desc => 'A permissão da câmera é necessária. Ative-a nas Configurações para usar este recurso.';
	@override String get photos_title => 'Permissão de Fotos';
	@override String get photos_desc => 'A permissão de armazenamento é necessária para salvar fotos ou vídeos. Ative-a nas Configurações.';
	@override String get microphone_title => 'Permissão de Microfone';
	@override String get microphone_desc => 'A permissão do microfone é necessária para gravar áudio nos vídeos. Ative-a nas Configurações.';
	@override String get notification_title => 'Permissão de Notificação';
	@override String get notification_desc => 'A permissão de notificação é necessária para receber lembretes diários. Ative-a nas Configurações.';
	@override String get settings => 'Configurações';
	@override String get cancel => 'Cancelar';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$pt extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bem-vindo ao VidoVerse';
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
			'common.processing' => 'Processando...',
			'common.ok' => 'OK',
			'common.btn_continue' => 'Continuar',
			'home.title' => 'VidoVerse',
			'home.trending' => 'Tendências',
			'home.new_section' => 'Novo',
			'home.toy_box' => 'Caixa de figuras de brinquedo',
			'home.epic_morph' => 'Metamorfose épica',
			'home.anime' => 'Anime',
			'home.discover' => 'Descobrir',
			'create.selfie_aquaman' => 'Selfie do Aquaman',
			'create.tap_upload' => 'Carregue sua foto e crie seu vídeo de IA em segundos.',
			'create.tap_to_upload_photo' => 'Toque aqui para carregar a sua foto.',
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
			'create.inspiring' => 'A IA está pensando...',
			'create.limit_dialog_title' => 'Sem sugestões gratuitas',
			'create.limit_dialog_desc' => 'Você usou todas as 3 sugestões gratuitas. Atualize para VIP para desfrutar de sugestões ilimitadas!',
			'create.limit_dialog_btn' => 'Atualizar para VIP',
			'create.limit_dialog_cancel' => 'Talvez mais tarde',
			'create.inspire_me_pro' => 'Inspirar-me (PRO)',
			'create.trim_title' => 'Cortar vídeo',
			'create.trim_save' => 'Salvar',
			'create.trimming_loading' => 'Cortando vídeo...',
			'create.please_add_image_first' => 'Por favor, adicione uma imagem primeiro',
			'leave_dialog.title' => 'Sair sem salvar?',
			'leave_dialog.desc' => 'Deseja continuar editando ou sair agora?',
			'splash.appName' => 'VidoVerse',
			'splash.loading' => 'Carregando...',
			'onboarding.page1.title' => 'Bem-vindo ao VidoVerse',
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
			'profile.imageGeneration' => 'Geração de vídeo',
			'home_new.welcomeToAppName' => 'Bem-vindo ao VidoVerse',
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
			'premium.weekly_desc' => ({required Object price}) => 'Acesso ilimitado de 7 dias, depois ${price}/semana',
			'premium.weekly_price' => '199.000 đ',
			'premium.weekly_suffix' => '/semana',
			'premium.annually' => 'Anual',
			'premium.annually_desc' => ({required Object price}) => 'Apenas ${price}/semana',
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
			'premium.claim_discount' => 'Reivindicar desconto',
			'premium.no_thanks' => 'Não, obrigado',
			'premium.buy_now' => 'Comprar agora',
			'premium.sub_discount_banner' => 'ATÉ 50% DE DESCONTO COM ASSINATURA',
			'premium.unlock_premium_desc' => 'Desbloqueie todos os recursos premium com um desconto especial',
			'premium.credit_5000' => '5.000 Créditos',
			'premium.price_5000' => '5.999.000 đ',
			'premium.itunes_disclaimer' => 'Se você assinar, o pagamento será cobrado na sua conta do iTunes assim que a compra for confirmada. Sua assinatura será renovada automaticamente, a menos que seja cancelada pelo menos 24 horas antes do término do período de faturamento atual. A renovação automática pode ser gerenciada a qualquer momento nas configurações da sua conta da iTunes Store.',
			'premium.buy_credit' => 'Comprar créditos',
			'premium.save_up_to' => ({required Object percent}) => 'Economize até ${percent}%',
			'premium.discount_price' => '799.000',
			'premium.discount_price_suffix' => '/ano',
			'premium.billed_yearly' => ({required Object price}) => 'Cobrado ${price}/ano - Cancele a qualquer momento',
			'generating.title' => 'Gerando',
			'generating.your_video' => 'seu vídeo',
			'generating.desc' => 'Isso pode levar alguns minutos.\nPor favor, aguarde...',
			'generating.notify_me' => 'Notificar-me quando concluído',
			'generating.notified' => 'Nós o notificaremos quando seu vídeo estiver pronto!',
			'generating.notification_denied' => 'Permissão de notificação negada. Ative nas Configurações.',
			'generating.failed' => 'Falha ao gerar o vídeo. Por favor, tente novamente.',
			'result.title' => 'Vídeo do Resultado',
			'result.ready_message' => ({required Object title}) => 'Seu vídeo de ${title} está pronto!',
			'result.regenerate' => 'Regenerar',
			'result.create_another' => 'Criar outro vídeo',
			'result.share' => 'Compartilhar',
			'result.download' => 'Baixar',
			'result.extend_video' => 'Estender vídeo',
			'result.extends_title' => 'Extensões',
			'result.delete' => 'Excluir',
			'result.share_success' => 'Link do vídeo copiado para compartilhar',
			'result.download_success' => 'Vídeo salvo na galeria',
			'privacy_dialog.title' => 'Privacidade de Dados',
			'privacy_dialog.desc' => 'Suas fotos são processadas com segurança por nossos sistemas internos de IA. Não compartilhamos, vendemos ou divulgamos suas informações a terceiros.',
			'privacy_dialog.cancel' => 'Cancelar',
			'privacy_dialog.confirm' => 'Confirmar',
			'report_dialog.title' => 'Denunciar',
			'report_dialog.desc' => 'Tem certeza de que deseja enviar a denúncia?',
			'report_dialog.cancel' => 'Cancelar',
			'report_dialog.submit' => 'Enviar',
			'report_dialog.success' => 'Vídeo denunciado com sucesso',
			'report_dialog.bottom_sheet_title' => 'Denunciar vídeo',
			'report_dialog.option_offensive' => 'Conteúdo ofensivo ou inadequado',
			'report_dialog.option_quality' => 'Qualidade ruim ou rostros distorcidos',
			'report_dialog.option_copyright' => 'Violação de direitos autorais',
			'report_dialog.option_bug' => 'Erro de geração de vídeo ou falha',
			'report_dialog.option_other' => 'Outros problemas',
			'report_dialog.thanks_msg' => 'Obrigado pela sua denúncia, iremos analisar e modificar.',
			'report_dialog.hint_other' => 'Por favor, descreva o problema em detalhes...',
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
			'errors.not_enough_suggestion_free' => 'Sugestões gratuitas insuficientes, por favor atualize para VIP',
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
			'errors.video_too_long' => 'O vídeo deve ter menos de 10 segundos.',
			'errors.iap_purchase_cancelled' => 'Compra cancelada.',
			'errors.iap_purchase_in_progress' => 'Compra já em andamento.',
			'errors.iap_purchase_failed' => 'Falha na compra.',
			'guide.step_1' => 'Passo 1',
			'guide.step_2' => 'Passo 2',
			'guide.upload_photo' => 'Enviar foto',
			'guide.got_it' => 'Entendi!',
			'guide.write_prompt' => 'Escrever Prompt',
			'guide.upload_2_photos' => 'Carregar 2 fotos',
			'guide.generate' => 'Gerar',
			'guide.upload_portrait' => 'Carregar retrato',
			'guide.choose_style' => 'Escolher estilo',
			'guide.add_assets' => 'Adicionar recursos',
			'checkin.title' => 'Check-in',
			'checkin.subtitle' => 'Prêmios diários!',
			'checkin.today' => 'Hoje',
			'checkin.day' => ({required Object n}) => 'Dia ${n}',
			'checkin.check_in_btn' => 'Fichar',
			'checkin.daily_bonus_notification' => 'Notificação',
			'checkin.disable_notification_title' => 'Desativar notificações de check-in?',
			'checkin.disable_notification_desc' => 'Você perderá as recompensas diárias de login e outros bônus emocionantes. Tem certeza de que deseja desativar?',
			'checkin.disable_notification_keep' => 'Manter ativado',
			'checkin.disable_notification_disable' => 'Desativar',
			'checkin.check_in_success' => ({required Object credits}) => '+${credits} Créditos! Check-in realizado com sucesso.',
			'connectivity.no_internet_title' => 'Sem conexão',
			'connectivity.no_internet_desc' => 'Por favor, verifique sua conexão com a internet para continuar usando o aplicativo.',
			'connectivity.retry_button' => 'Tentar novamente a conexão',
			'notification.channel_name' => 'Notificações importantes',
			'notification.channel_description' => 'Este canal é usado para notificações importantes.',
			'notification.checkin_title' => 'Lembrete de Check-in Diário 🎁',
			'notification.checkin_body' => 'É hora de resgatar seus créditos diários gratuitos! Abra o aplicativo agora.',
			'notification.test_notification' => 'Testar',
			'rating_dialog.title' => 'Está gostando do aplicativo?',
			'rating_dialog.desc' => 'Avalie-nos e ajude-nos a melhorar a sua experiência. Obrigado!',
			'rating_dialog.support_us' => 'Apoie-nos',
			'rating_dialog.encourage_us' => 'Incentive-nos',
			'rating_dialog.rate_on_store' => 'Avaliar na Loja',
			'rating_dialog.maybe_later' => 'Mais tarde',
			'rating_dialog.success' => 'Obrigado pelo seu apoio!',
			'debug.title' => 'Menu de depuração',
			'debug.iap_page' => 'Página IAP',
			'debug.buy_credits' => 'Comprar créditos',
			'debug.generation_iap' => 'Geração IAP',
			'debug.generation_buy_credits' => 'Geração comprar créditos',
			'debug.discount' => 'Página de desconto',
			'debug.paywall_video' => 'Página de vídeo paywall',
			'debug.generating_page' => 'Visualização da página de geração',
			'permission.camera_title' => 'Permissão de Câmera',
			'permission.camera_desc' => 'A permissão da câmera é necessária. Ative-a nas Configurações para usar este recurso.',
			'permission.photos_title' => 'Permissão de Fotos',
			'permission.photos_desc' => 'A permissão de armazenamento é necessária para salvar fotos ou vídeos. Ative-a nas Configurações.',
			'permission.microphone_title' => 'Permissão de Microfone',
			'permission.microphone_desc' => 'A permissão do microfone é necessária para gravar áudio nos vídeos. Ative-a nas Configurações.',
			'permission.notification_title' => 'Permissão de Notificação',
			'permission.notification_desc' => 'A permissão de notificação é necessária para receber lembretes diários. Ative-a nas Configurações.',
			'permission.settings' => 'Configurações',
			'permission.cancel' => 'Cancelar',
			_ => null,
		};
	}
}
