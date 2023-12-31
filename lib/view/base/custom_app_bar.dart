import 'package:goodhere_user_v2/view/base/web_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/responsive_helper.dart';
import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';
import 'cart_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  final Function? onBackPressed;
  final bool showCart;
  final String? leadingIcon;
  CustomAppBar({required this.title, this.backButton = true, this.onBackPressed, this.showCart = false, this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).textTheme.bodyText1!.color)),
      centerTitle: true,
      leading: backButton ? IconButton(
        icon: leadingIcon != null ? Image.asset(leadingIcon!, height: 22, width: 22) : Icon(Icons.arrow_back_ios),
        color: Theme.of(context).textTheme.bodyText1!.color,
        onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
      ) : SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
      actions: showCart ? [
        IconButton(onPressed: () => Get.toNamed("RouteHelper.getCartRoute()"),
        icon: CartWidget(color: Theme.of(context).textTheme.bodyText1!.color, size: 25),
      )] : [SizedBox()],
    );
  }

  @override
  Size get preferredSize => Size(Get.width, GetPlatform.isDesktop ? 70 : 50);
}
