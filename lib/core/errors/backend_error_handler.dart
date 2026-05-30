import 'package:flutter/material.dart';
import '../../i18n/strings.g.dart';

class BackendErrorHelper {
  const BackendErrorHelper._();

  /// Map raw exception details or error code into a user-friendly, localized message.
  static String getErrorMessage(BuildContext context, dynamic error) {
    final t = context.t;

    if (error == null) return t.errors.unknown;

    String? errorCode;
    String? rawMessage;

    if (error is String) {
      final trimmed = error.trim();
      if (trimmed.startsWith('ER')) {
        errorCode = trimmed;
      } else {
        rawMessage = trimmed;
      }
    } else {
      final errorString = error.toString();
      // Check if there is an ERXXXXX pattern in the exception string
      final regExp = RegExp(r'ER\d{3,6}');
      final match = regExp.firstMatch(errorString);
      if (match != null) {
        errorCode = match.group(0);
      } else {
        rawMessage = errorString;
      }
    }

    if (errorCode != null) {
      return _mapErrorCodeToMessage(context, errorCode);
    }

    if (rawMessage != null && rawMessage.isNotEmpty) {
      // Clean up common system error prefixes if any
      if (rawMessage.contains('DioException') || rawMessage.contains('Exception:')) {
        return t.errors.unknown;
      }
      return rawMessage;
    }

    return t.errors.unknown;
  }

  static String _mapErrorCodeToMessage(BuildContext context, String errorCode) {
    final t = context.t;
    switch (errorCode) {
      case 'ER00001':
        return t.errors.unauthorized;
      case 'ER00002':
        return t.errors.validation_error;
      case 'ER00003':
        return t.errors.password_incorrect;
      case 'ER00004':
        return t.errors.account_not_found;
      case 'ER0005':
        return t.errors.email_template_already_exists;
      case 'ER0006':
        return t.errors.email_template_not_found;
      case 'ER00013':
        return t.errors.account_email_limit_register;
      case 'ER00014':
        return t.errors.account_username_is_exist;
      case 'ER00018':
      case 'ER000018':
        return t.errors.token_invalid;
      case 'ER00019':
      case 'ER000019':
        return t.errors.already_enable_2fa;
      case 'ER00020':
      case 'ER000020':
        return t.errors.account_are_not_enable_2fa;
      case 'ER00021':
      case 'ER000021':
        return t.errors.ref_account_not_found;
      case 'ER00023':
      case 'ER000023':
        return t.errors.account_already_vip;
      case 'ER00024':
        return t.errors.perm_not_found;
      case 'ER00025':
        return t.errors.account_register_not_found;
      case 'ER00026':
        return t.errors.otp_invalid;
      case 'ER00027':
        return t.errors.otp_expired;
      case 'ER00028':
        return t.errors.otp_to_many_request;
      case 'ER00029':
        return t.errors.account_info_not_found;
      case 'ER00030':
        return t.errors.account_info_already_created;
      case 'ER00031':
        return t.errors.id_number_already_in_use;
      case 'ER00032':
        return t.errors.account_info_can_not_update;
      case 'ER00033':
        return t.errors.account_profile_is_processed;
      case 'ER00103':
        return t.errors.insufficient_fund;
      case 'ER00104':
        return t.errors.account_email_is_exist;
      case 'ER00201':
        return t.errors.proxy_error;
      case 'ER00301':
        return t.errors.invalid_file_type;
      case 'ER00302':
        return t.errors.file_too_large;
      case 'ER00401':
        return t.errors.account_banned;
      case 'ER00402':
        return t.errors.login_failed;
      case 'ER00403':
        return t.errors.error_code;
      case 'ER00404':
        return t.errors.user_not_found;
      case 'ER00405':
        return t.errors.user_used_invite_code;
      case 'ER00406':
        return t.errors.get_me_failed;
      case 'ER00407':
        return t.errors.user_cannot_use_own_invite_code;
      case 'ER00501':
        return t.errors.file_not_found;
      case 'ER00502':
        return t.errors.file_upload_failed;
      case 'ER00503':
        return t.errors.upload_webp_failed;
      case 'ER00601':
        return t.errors.create_theme_failed;
      case 'ER00602':
        return t.errors.get_theme_failed;
      case 'ER00603':
        return t.errors.category_already_exists;
      case 'ER00604':
        return t.errors.create_category_failed;
      case 'ER00605':
        return t.errors.invalid_ratio;
      case 'ER00606':
        return t.errors.create_media_failed;
      case 'ER00607':
        return t.errors.media_not_found;
      case 'ER00608':
        return t.errors.callback_media_failed;
      case 'ER00609':
        return t.errors.get_media_detail_failed;
      case 'ER00610':
        return t.errors.get_media_failed;
      case 'ER00611':
        return t.errors.update_theme_failed;
      case 'ER00612':
        return t.errors.delete_theme_failed;
      case 'ER00613':
        return t.errors.category_not_found;
      case 'ER00614':
        return t.errors.delete_category_failed;
      case 'ER00615':
        return t.errors.media_not_owned;
      case 'ER00616':
        return t.errors.theme_already_exists;
      case 'ER00617':
        return t.errors.like_media_failed;
      case 'ER00618':
        return t.errors.user_not_vip;
      case 'ER00619':
        return t.errors.not_enough_credit;
      case 'ER00620':
        return t.errors.create_photo_enhance_failed;
      case 'ER00621':
        return t.errors.remove_object_failed;
      case 'ER00622':
        return t.errors.get_suggestion_prompt_failed;
      case 'ER00701':
        return t.errors.get_tasks_failed;
      case 'ER00702':
        return t.errors.action_task_failed;
      case 'ER00703':
        return t.errors.task_not_found;
      case 'ER00704':
        return t.errors.task_already_claimed;
      case 'ER00705':
        return t.errors.task_already_started;
      case 'ER00706':
        return t.errors.task_not_completed;
      case 'ER00707':
        return t.errors.rate_app_failed;
      case 'ER00708':
        return t.errors.daily_login_task_not_found;
      case 'ER00709':
        return t.errors.get_daily_login_failed;
      case 'ER00710':
        return t.errors.today_login_reward_already_claimed;
      case 'ER00711':
        return t.errors.take_login_reward_failed;
      case 'ER00801':
        return t.errors.iap_receipt_already_exists;
      case 'ER00802':
        return t.errors.iap_verify_product_failed;
      case 'ER00803':
        return t.errors.iap_product_not_purchased;
      case 'ER00804':
        return t.errors.iap_product_not_found;
      case 'ER00805':
        return t.errors.iap_subscription_not_active;
      case 'ER00806':
        return t.errors.iap_subscription_already_acknowledged;
      case 'ER00807':
        return t.errors.iap_verify_subscription_failed;
      case 'ER00808':
        return t.errors.refill_subscription_credits_failed;
      case 'ER00809':
        return t.errors.cancel_subscription_failed;
      case 'ER00810':
        return t.errors.plan_not_found;
      case 'ER00811':
        return t.errors.transaction_action_failed;
      case 'ER008012':
        return t.errors.iap_verify_ios_product_failed;
      case 'ER008013':
        return t.errors.iap_subscription_invalid_type;
      case 'ER008014':
        return t.errors.subscription_not_active_for_refill;
      case 'ER008015':
        return t.errors.get_price_list_failed;
      case 'ER008016':
        return t.errors.iap_receipt_not_found;
      case 'ER008017':
        return t.errors.iap_subscription_not_found;
      default:
        return t.errors.unknown;
    }
  }
}
