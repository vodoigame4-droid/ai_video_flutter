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
	@override late final _Translations$templates$zh templates = _Translations$templates$zh._(_root);
	@override late final _Translations$settings$zh settings = _Translations$settings$zh._(_root);
	@override late final _Translations$language$zh language = _Translations$language$zh._(_root);
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
	@override String get generate_title => '生成';
	@override String get upload_first_photo => '上传第一张照片。';
	@override String get upload_last_photo => '上传最后一张照片。';
	@override String get upload_video_slot => '上传视频。';
	@override String get upload_photo_slot => '上传照片。';
	@override String photo_slot_num({required Object num}) => '照片 ${num}';
	@override String get required_label => '必填';
	@override String get optional_label => '选填';
	@override String inspire_me_count({required Object count}) => '灵感推荐 (${count})';
	@override String character_count({required Object current}) => '${current}/1000';
	@override String get generating_video => '正在生成您的视频...';
	@override String get select_mock_media => '选择模拟媒体';
	@override String get select_media_desc => '选择一个模拟文件以模拟上传';
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
	@override String get deleteTitle => '删除此视频？';
	@override String get deleteDesc => '您确定要删除此视频吗？此操作无法撤销。';
	@override String get cancel => '取消';
	@override String get delete => '删除';
	@override String get generating => '生成中...';
	@override String get imageGeneration => '图像生成';
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

// Path: templates
class _Translations$templates$zh extends Translations$templates$en {
	_Translations$templates$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '模板';
	@override String get all => '全部';
	@override String get pro => '专业版';
}

// Path: settings
class _Translations$settings$zh extends Translations$settings$en {
	_Translations$settings$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '设置';
	@override String get language => '语言';
	@override String get termsOfService => '服务条款';
	@override String get privacyPolicy => '隐私政策';
	@override String get contactUs => '联系我们';
	@override String get version => '版本';
	@override String get myCredits => '我的额度';
	@override String get rateApp => '评分应用';
	@override String get userCode => '用户代码';
	@override String get copied => '已复制到剪贴板！';
	@override String get termsOfUse => '使用条款';
}

// Path: language
class _Translations$language$zh extends Translations$language$en {
	_Translations$language$zh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '语言';
	@override String get en => '英语';
	@override String get ar => '阿拉伯语';
	@override String get de => '德语';
	@override String get es => '西班牙语';
	@override String get fr => '法语';
	@override String get hi => '印地语';
	@override String get id => '印度尼西亚语';
	@override String get ja => '日语';
	@override String get ko => '韩语';
	@override String get pt => '葡萄牙语';
	@override String get vi => '越南语';
	@override String get zh => '中文';
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
			'create.generate_title' => '生成',
			'create.upload_first_photo' => '上传第一张照片。',
			'create.upload_last_photo' => '上传最后一张照片。',
			'create.upload_video_slot' => '上传视频。',
			'create.upload_photo_slot' => '上传照片。',
			'create.photo_slot_num' => ({required Object num}) => '照片 ${num}',
			'create.required_label' => '必填',
			'create.optional_label' => '选填',
			'create.inspire_me_count' => ({required Object count}) => '灵感推荐 (${count})',
			'create.character_count' => ({required Object current}) => '${current}/1000',
			'create.generating_video' => '正在生成您的视频...',
			'create.select_mock_media' => '选择模拟媒体',
			'create.select_media_desc' => '选择一个模拟文件以模拟上传',
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
			'profile.deleteTitle' => '删除此视频？',
			'profile.deleteDesc' => '您确定要删除此视频吗？此操作无法撤销。',
			'profile.cancel' => '取消',
			'profile.delete' => '删除',
			'profile.generating' => '生成中...',
			'profile.imageGeneration' => '图像生成',
			'home_new.welcomeToAppName' => '欢迎使用视频AI',
			'home_new.imageToVideo' => '图片转\n视频',
			'home_new.transitionVideo' => '转场\n视频',
			'home_new.imageToDance' => '图片\n舞蹈',
			'home_new.unifiedVideo' => '融合\n视频',
			'templates.title' => '模板',
			'templates.all' => '全部',
			'templates.pro' => '专业版',
			'settings.title' => '设置',
			'settings.language' => '语言',
			'settings.termsOfService' => '服务条款',
			'settings.privacyPolicy' => '隐私政策',
			'settings.contactUs' => '联系我们',
			'settings.version' => '版本',
			'settings.myCredits' => '我的额度',
			'settings.rateApp' => '评分应用',
			'settings.userCode' => '用户代码',
			'settings.copied' => '已复制到剪贴板！',
			'settings.termsOfUse' => '使用条款',
			'language.title' => '语言',
			'language.en' => '英语',
			'language.ar' => '阿拉伯语',
			'language.de' => '德语',
			'language.es' => '西班牙语',
			'language.fr' => '法语',
			'language.hi' => '印地语',
			'language.id' => '印度尼西亚语',
			'language.ja' => '日语',
			'language.ko' => '韩语',
			'language.pt' => '葡萄牙语',
			'language.vi' => '越南语',
			'language.zh' => '中文',
			_ => null,
		};
	}
}
