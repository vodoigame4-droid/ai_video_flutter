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
			_ => null,
		};
	}
}
