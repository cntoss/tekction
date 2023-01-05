import 'package:flutter/material.dart';

class AssetsPath {

  static const String iconLogo =
      'assets/vectors/icon_logo.svg';
  static const String iconBack =
      'assets/vectors/icon_back.svg';
  static const String iconNext =
      'assets/vectors/arrow_right.svg';
  // menu  Bottom Navigation

  static const String iconSuccessfullyResetPassword =
      'assets/vectors/icon_successfully_reset_password.svg';
  static const String iconSuccessfullyResetPasswordDark =
      'assets/vectors/icon_successfully_reset_password.svg';

  static const String iconEdit =
      'assets/vectors/icon_edit.svg';
  static const String iconDelete =
      'assets/vectors/icon_delete.svg';
  //icon_successfully_reset_password_dark.svg
  ///walk_through image
  // light mode
  static const String walkThrough1 =
      'assets/vectors/walk_1.png';
  static const String walkThrough2 =
      'assets/vectors/walk_2.png';
  static const String walkThrough3 =
      'assets/vectors/walk_3.png';
  static const String walkThrough4 =
      'assets/vectors/walk_3.png';
  //dark mode
  static const String walkThroughDark1 =
      'assets/vectors/walk_1.png';
  static const String walkThroughDark2 =
      'assets/vectors/walk_2.png';
  static const String walkThroughDark3 =
      'assets/vectors/walk_3.png';
  static const String walkThroughDark4 =
      'assets/vectors/walk_1.png';

  static getIconSuccessfullyResetPassword(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return lightMode ? iconSuccessfullyResetPassword : iconSuccessfullyResetPasswordDark;
  }


  static const String iconCheckMark =
      'assets/vectors/checkmark_circle.svg';


  static const String iconLogout =
      'assets/vectors/icon_logout.svg';

  ///ItemInformation

  static const String iconSettings =
      'assets/vectors/icon_settings.svg';

  ///Social Media
  static const String iconApple =
       'assets/vectors/icon_apple.svg';
  static const String iconFb =
      'assets/vectors/icon_fb.svg';
  static const String iconGoogle =
      'assets/vectors/icon_google.svg';

  static const String iconUser =
      'assets/vectors/icon_user.svg';
  static const String iconLock =
      'assets/vectors/icon_lock.svg';

  ///ItemMenu
  static const String iconProfile =
      'assets/vectors/icon_profile_menu.svg';

  static const String iconDiscover =
      'assets/vectors/icon_search_menu.svg';

  static const String iconShop =
      'assets/vectors/icon_shop_menu.svg';

  static const String iconWelcome=
      'assets/vectors/icon_home_menu.svg';

  static const String iconNotification=
      'assets/vectors/icon_notification.svg';

  static const String dateIcon =
      'assets/vectors/icon_date.svg';

  static const String shearIcon =
      'assets/vectors/icon_shear.svg';

  static const String addNoteIcon =
      'assets/vectors/add_note_icon.svg';

  static const String seeMoreIcon =
      'assets/vectors/icon_see_more.svg';

  ///prfile icons
  static const String myWallet =
      'assets/vectors/icon_wallet.svg';

  static const String following =
      'assets/vectors/icon_following.svg';

  static const String orderHis =
      'assets/vectors/icon_order_his.svg';

  static const String product =
      'assets/vectors/icon_product.svg';

  static const String order =
      'assets/vectors/icon_order.svg';

  static const String pin =
      'assets/vectors/icon_location.svg';

  static const String photo =
      'assets/vectors/icon_photo.svg';

  static const String check =
      'assets/vectors/icon_check.svg';

  static const String dropdown =
      'assets/vectors/icon_dropdown.svg';

  static const String video =
      'assets/vectors/icon_video.svg';

  static const String videoIcon =
      'assets/vectors/icon_video_cir.svg';

  static const String iconAdd =
      'assets/vectors/icon_add.svg';

  static const String iconRemove =
      'assets/vectors/icon_remove.svg';

  static const String iconRequest =
      'assets/vectors/request.svg';

  static const String placeholderProfile =
      'assets/vectors/placeholder_profile.svg';

  static const String sendRight =
      'assets/vectors/send_right.svg';

  //empty icon

  static const String emptyOrder =
      'assets/vectors/empty_order.svg';

  static const String emptyNotif =
      'assets/vectors/empty_notif.svg';

  static const String emptyList =
      'assets/vectors/empty_list.svg';

  static const String emptyCart =
      'assets/vectors/empty_cart.svg';

  static const String emptyProduct =
      'assets/vectors/empty_products.svg';

  static const String errorIcon =
      'assets/vectors/error_icon.svg';

  static const String reservedIcon =
      'assets/vectors/icon_reserved.svg';

  static const String stopIcon =
      'assets/vectors/stop_icon.svg';

  static const String startIcon =
      'assets/vectors/start_icon.svg';

  static const String shareLiveIcon =
      'assets/vectors/share_live_icon.svg';

  static const String swipeIcon =
      'assets/vectors/swipe_icon.svg';

  static const String timeIcon =
      'assets/vectors/time_icon.svg';

  static const String muteIcon =
      'assets/vectors/icon_mute.svg';

  static const String unMuteIcon =
      'assets/vectors/icon_unmute.svg';

  static const String emptyWalletIcon =
      'assets/vectors/empty_wallet.svg';

  static const String closeIcon =
      'assets/vectors/close_icon.svg';

  static const String checkedIcon =
      'assets/vectors/icon_checked.svg';

  static const String cancelledIcon =
      'assets/vectors/icon_cancelled.svg';

  static const String iconAlert =
      'assets/vectors/icon_alert.svg';

  static const String iconCancel =
      'assets/vectors/icon_cancel.svg';

  static const String iconSuccess =
      'assets/vectors/icon_success.svg';

  static const String iconSnackbar =
      'assets/vectors/icon_snackbar.svg';

  static const String emptyAddress =
      'assets/vectors/empty_address.svg';

  static const String iconNoInternet =
      'assets/vectors/icon_NoInternet.svg';

  static const String emptyEvent =
      'assets/vectors/empty_event.svg';

  static const String emptyFollow =
      'assets/vectors/empty_follow.svg';

  static const String errorInput =
      'assets/vectors/error_input.svg';

  static const String empty_follows =
      'assets/vectors/empty_follows.svg';

  static const String iconValide =
      'assets/vectors/icon_valide.svg';

  static const String creator =
      'assets/vectors/creator.svg';

  static const String iconMic =
      'assets/vectors/icon_mic.svg';

  static const String iconMicOff =
      'assets/vectors/icon_mic_off.svg';

  static const String iconPickUp =
      'assets/vectors/icon_pickup.svg';
}
