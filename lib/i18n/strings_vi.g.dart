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
class TranslationsVi extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsVi _root = this; // ignore: unused_field

	@override 
	TranslationsVi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$vi common = _Translations$common$vi._(_root);
	@override late final _Translations$home$vi home = _Translations$home$vi._(_root);
	@override late final _Translations$create$vi create = _Translations$create$vi._(_root);
	@override late final _Translations$leave_dialog$vi leave_dialog = _Translations$leave_dialog$vi._(_root);
}

// Path: common
class _Translations$common$vi extends Translations$common$en {
	_Translations$common$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get pro => 'PRO';
	@override String get see_all => 'Xem tất cả';
	@override String get stay => 'Ở lại';
	@override String get leave => 'Rời đi';
	@override String get camera => 'Máy ảnh';
	@override String get gallery => 'Thư viện';
	@override String get generate => 'Tạo video';
}

// Path: home
class _Translations$home$vi extends Translations$home$en {
	_Translations$home$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Video AI';
	@override String get trending => 'Xu hướng';
	@override String get new_section => 'Mới';
	@override String get toy_box => 'Hộp đồ chơi';
	@override String get epic_morph => 'Biến hình đỉnh cao';
	@override String get anime => 'Hoạt hình';
	@override String get discover => 'Khám phá';
}

// Path: create
class _Translations$create$vi extends Translations$create$en {
	_Translations$create$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => 'Ảnh tự sướng Aquaman';
	@override String get tap_upload => 'Chạm vào đây để tải ảnh lên.';
	@override String get select_upload_title => 'Chọn phương thức tải ảnh';
	@override String get upload_image => 'Tải ảnh lên';
	@override String get custom_prompt => 'Mô tả tùy chỉnh';
	@override String get prompt_placeholder => 'Chân dung nữ chân thực, cận cảnh, nhìn vào máy ảnh, nháy mắt tự nhiên, ánh sáng studio xanh, điện ảnh, siêu chi tiết';
	@override String get inspire_me => 'Gợi ý cho tôi';
	@override String get video_settings => 'Cài đặt video';
	@override String get quality => 'Chất lượng';
	@override String get quality_desc => 'Chọn chất lượng video';
	@override String get hd => 'HD';
	@override String get full_hd => 'Full HD';
	@override String get duration => 'Thời lượng';
	@override String get duration_desc => 'Chọn độ dài video';
	@override String get sec_4s => '4s';
	@override String get sec_8s => '8s';
	@override String get sec_5s => '5s';
	@override String get sec_10s => '10s';
	@override String get sec_15s => '15s';
}

// Path: leave_dialog
class _Translations$leave_dialog$vi extends Translations$leave_dialog$en {
	_Translations$leave_dialog$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rời đi không lưu?';
	@override String get desc => 'Bạn muốn tiếp tục chỉnh sửa hay rời đi ngay bây giờ?';
}

/// The flat map containing all translations for locale <vi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsVi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => 'PRO',
			'common.see_all' => 'Xem tất cả',
			'common.stay' => 'Ở lại',
			'common.leave' => 'Rời đi',
			'common.camera' => 'Máy ảnh',
			'common.gallery' => 'Thư viện',
			'common.generate' => 'Tạo video',
			'home.title' => 'Video AI',
			'home.trending' => 'Xu hướng',
			'home.new_section' => 'Mới',
			'home.toy_box' => 'Hộp đồ chơi',
			'home.epic_morph' => 'Biến hình đỉnh cao',
			'home.anime' => 'Hoạt hình',
			'home.discover' => 'Khám phá',
			'create.selfie_aquaman' => 'Ảnh tự sướng Aquaman',
			'create.tap_upload' => 'Chạm vào đây để tải ảnh lên.',
			'create.select_upload_title' => 'Chọn phương thức tải ảnh',
			'create.upload_image' => 'Tải ảnh lên',
			'create.custom_prompt' => 'Mô tả tùy chỉnh',
			'create.prompt_placeholder' => 'Chân dung nữ chân thực, cận cảnh, nhìn vào máy ảnh, nháy mắt tự nhiên, ánh sáng studio xanh, điện ảnh, siêu chi tiết',
			'create.inspire_me' => 'Gợi ý cho tôi',
			'create.video_settings' => 'Cài đặt video',
			'create.quality' => 'Chất lượng',
			'create.quality_desc' => 'Chọn chất lượng video',
			'create.hd' => 'HD',
			'create.full_hd' => 'Full HD',
			'create.duration' => 'Thời lượng',
			'create.duration_desc' => 'Chọn độ dài video',
			'create.sec_4s' => '4s',
			'create.sec_8s' => '8s',
			'create.sec_5s' => '5s',
			'create.sec_10s' => '10s',
			'create.sec_15s' => '15s',
			'leave_dialog.title' => 'Rời đi không lưu?',
			'leave_dialog.desc' => 'Bạn muốn tiếp tục chỉnh sửa hay rời đi ngay bây giờ?',
			_ => null,
		};
	}
}
