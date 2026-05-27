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
class TranslationsZh extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$zh common = _Translations$common$zh._(_root);
	@override late final _Translations$home$zh home = _Translations$home$zh._(_root);
	@override late final _Translations$create$zh create = _Translations$create$zh._(_root);
	@override late final _Translations$leave_dialog$zh leave_dialog = _Translations$leave_dialog$zh._(_root);
	@override late final _Translations$splash$zh splash = _Translations$splash$zh._(_root);
	@override late final _Translations$onboarding$zh onboarding = _Translations$onboarding$zh._(_root);
	@override late final _Translations$dashboard$zh dashboard = _Translations$dashboard$zh._(_root);
	@override late final _Translations$profile$zh profile = _Translations$profile$zh._(_root);
	@override late final _Translations$home_new$zh home_new = _Translations$home_new$zh._(_root);
}

// Path: common
class _Translations$common$zh extends Translations$common$en {
	_Translations$common$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get pro => '专业版';
	@override String get see_all => '查看全部';
	@override String get stay => '留在页面';
	@override String get leave => '离开';
	@override String get camera => '相机';
	@override String get gallery => '相册';
	@override String get generate => '生成';
}

// Path: home
class _Translations$home$zh extends Translations$home$en {
	_Translations$home$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '视频 AI';
	@override String get trending => '热门';
	@override String get new_section => '最新';
	@override String get toy_box => '玩具手办盒';
	@override String get epic_morph => '史诗变身';
	@override String get anime => '动漫';
	@override String get discover => '发现';
}

// Path: create
class _Translations$create$zh extends Translations$create$en {
	_Translations$create$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get selfie_aquaman => '海王自拍';
	@override String get tap_upload => '点击此处上传您的照片。';
	@override String get select_upload_title => '选择上传照片的方式';
	@override String get upload_image => '上传图片';
	@override String get custom_prompt => '自定义提示词';
	@override String get prompt_placeholder => '写实的女性肖像，特写，看着镜头，自然眨眼，蓝色摄影棚灯光，电影质感，超清细节';
	@override String get inspire_me => '灵感推荐';
	@override String get video_settings => '视频设置';
	@override String get quality => '画质';
	@override String get quality_desc => '选择视频画质';
	@override String get hd => '高清';
	@override String get full_hd => '超清';
	@override String get duration => '时长';
	@override String get duration_desc => '选择视频时长';
	@override String get sec_4s => '4秒';
	@override String get sec_8s => '8秒';
	@override String get sec_5s => '5秒';
	@override String get sec_10s => '10秒';
	@override String get sec_15s => '15秒';
}

// Path: leave_dialog
class _Translations$leave_dialog$zh extends Translations$leave_dialog$en {
	_Translations$leave_dialog$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '不保存直接离开？';
	@override String get desc => '您要继续编辑还是现在离开？';
}

// Path: splash
class _Translations$splash$zh extends Translations$splash$en {
	_Translations$splash$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get appName => '视频AI';
}

// Path: onboarding
class _Translations$onboarding$zh extends Translations$onboarding$en {
	_Translations$onboarding$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$page1$zh page1 = _Translations$onboarding$page1$zh._(_root);
	@override late final _Translations$onboarding$page2$zh page2 = _Translations$onboarding$page2$zh._(_root);
	@override late final _Translations$onboarding$page3$zh page3 = _Translations$onboarding$page3$zh._(_root);
	@override late final _Translations$onboarding$page4$zh page4 = _Translations$onboarding$page4$zh._(_root);
	@override late final _Translations$onboarding$page5$zh page5 = _Translations$onboarding$page5$zh._(_root);
}

// Path: dashboard
class _Translations$dashboard$zh extends Translations$dashboard$en {
	_Translations$dashboard$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '首页';
	@override String get user => '我的';
	@override String get createVideo => '制作视频';
}

// Path: profile
class _Translations$profile$zh extends Translations$profile$en {
	_Translations$profile$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '个人中心';
	@override String get upgradeTitle => '升级专业版';
	@override String get upgradeSubtitle => '添加额度 - 无水印';
	@override String get goPremium => '专业版特权';
	@override String get myVideo => '我的视频';
	@override String get liked => '点赞视频';
	@override String get noVideos => '暂无视频';
	@override String get noVideosDesc => '制作您的第一个AI视频，它将显示在这里。';
}

// Path: home_new
class _Translations$home_new$zh extends Translations$home_new$en {
	_Translations$home_new$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get welcomeToAppName => '欢迎使用视频AI';
	@override String get imageToVideo => '图片转\n视频';
	@override String get transitionVideo => '转场\n视频';
	@override String get imageToDance => '图片\n舞蹈';
	@override String get unifiedVideo => '融合\n视频';
}

// Path: onboarding.page1
class _Translations$onboarding$page1$zh extends Translations$onboarding$page1$en {
	_Translations$onboarding$page1$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '欢迎使用视频AI';
	@override String get subtitle => '您的创意之旅从这里开始...';
	@override String get button => '开始体验';
}

// Path: onboarding.page2
class _Translations$onboarding$page2$zh extends Translations$onboarding$page2$en {
	_Translations$onboarding$page2$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '图片转视频';
	@override String get subtitle => '上传图片，编写提示词';
	@override String get button => '继续';
}

// Path: onboarding.page3
class _Translations$onboarding$page3$zh extends Translations$onboarding$page3$en {
	_Translations$onboarding$page3$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '双图转视频';
	@override String get subtitle => '上传两张图片，编写提示词';
	@override String get button => '继续';
}

// Path: onboarding.page4
class _Translations$onboarding$page4$zh extends Translations$onboarding$page4$en {
	_Translations$onboarding$page4$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '图片舞蹈';
	@override String get subtitle => '上传1个视频和1张照片';
	@override String get button => '继续';
}

// Path: onboarding.page5
class _Translations$onboarding$page5$zh extends Translations$onboarding$page5$en {
	_Translations$onboarding$page5$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '视频融合';
	@override String get subtitle => '上传您的照片';
	@override String get button => '继续';
}

/// The flat map containing all translations for locale <zh>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.pro' => '专业版',
			'common.see_all' => '查看全部',
			'common.stay' => '留在页面',
			'common.leave' => '离开',
			'common.camera' => '相机',
			'common.gallery' => '相册',
			'common.generate' => '生成',
			'home.title' => '视频 AI',
			'home.trending' => '热门',
			'home.new_section' => '最新',
			'home.toy_box' => '玩具手办盒',
			'home.epic_morph' => '史诗变身',
			'home.anime' => '动漫',
			'home.discover' => '发现',
			'create.selfie_aquaman' => '海王自拍',
			'create.tap_upload' => '点击此处上传您的照片。',
			'create.select_upload_title' => '选择上传照片的方式',
			'create.upload_image' => '上传图片',
			'create.custom_prompt' => '自定义提示词',
			'create.prompt_placeholder' => '写实的女性肖像，特写，看着镜头，自然眨眼，蓝色摄影棚灯光，电影质感，超清细节',
			'create.inspire_me' => '灵感推荐',
			'create.video_settings' => '视频设置',
			'create.quality' => '画质',
			'create.quality_desc' => '选择视频画质',
			'create.hd' => '高清',
			'create.full_hd' => '超清',
			'create.duration' => '时长',
			'create.duration_desc' => '选择视频时长',
			'create.sec_4s' => '4秒',
			'create.sec_8s' => '8秒',
			'create.sec_5s' => '5秒',
			'create.sec_10s' => '10秒',
			'create.sec_15s' => '15秒',
			'leave_dialog.title' => '不保存直接离开？',
			'leave_dialog.desc' => '您要继续编辑还是现在离开？',
			'splash.appName' => '视频AI',
			'onboarding.page1.title' => '欢迎使用视频AI',
			'onboarding.page1.subtitle' => '您的创意之旅从这里开始...',
			'onboarding.page1.button' => '开始体验',
			'onboarding.page2.title' => '图片转视频',
			'onboarding.page2.subtitle' => '上传图片，编写提示词',
			'onboarding.page2.button' => '继续',
			'onboarding.page3.title' => '双图转视频',
			'onboarding.page3.subtitle' => '上传两张图片，编写提示词',
			'onboarding.page3.button' => '继续',
			'onboarding.page4.title' => '图片舞蹈',
			'onboarding.page4.subtitle' => '上传1个视频和1张照片',
			'onboarding.page4.button' => '继续',
			'onboarding.page5.title' => '视频融合',
			'onboarding.page5.subtitle' => '上传您的照片',
			'onboarding.page5.button' => '继续',
			'dashboard.home' => '首页',
			'dashboard.user' => '我的',
			'dashboard.createVideo' => '制作视频',
			'profile.title' => '个人中心',
			'profile.upgradeTitle' => '升级专业版',
			'profile.upgradeSubtitle' => '添加额度 - 无水印',
			'profile.goPremium' => '专业版特权',
			'profile.myVideo' => '我的视频',
			'profile.liked' => '点赞视频',
			'profile.noVideos' => '暂无视频',
			'profile.noVideosDesc' => '制作您的第一个AI视频，它将显示在这里。',
			'home_new.welcomeToAppName' => '欢迎使用视频AI',
			'home_new.imageToVideo' => '图片转\n视频',
			'home_new.transitionVideo' => '转场\n视频',
			'home_new.imageToDance' => '图片\n舞蹈',
			'home_new.unifiedVideo' => '融合\n视频',
			_ => null,
		};
	}
}
