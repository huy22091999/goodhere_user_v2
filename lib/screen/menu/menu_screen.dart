import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/screen/menu/widget/menu_button.dart';

import '../../data/model/response/menu_model.dart';
import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<MenuModel> _menuList = [
    MenuModel(
      icon: Images.about_us,
      title: 'profile'.tr,
      route: RouteHelper.getSignInRoute()),
    MenuModel(
        icon: Images.location,
        title: 'my_address'.tr,
        route: RouteHelper.getSignInRoute()),
    MenuModel(
        icon: Images.refer_code,
        title: 'refer_and_earn'.tr,
        route: RouteHelper.getSignInRoute()),
    MenuModel(
        icon: Images.zopay_coin,
        title: 'wallet'.tr,
        route: RouteHelper.getSignInRoute()),
    MenuModel(
        icon: Images.coupon,
        title: 'coupon'.tr,
        route: RouteHelper.getSignInRoute()),
    MenuModel(
        icon: Images.support,
        title: 'help_support'.tr,
        route: RouteHelper.getSignInRoute()),
    MenuModel(
        icon: Images.policy,
        title: 'privacy_policy'.tr,
        route: RouteHelper.getHtmlRoute('privacy-policy')),
    MenuModel(
        icon: Images.about_us,
        title: 'about_us'.tr,
        route: RouteHelper.getHtmlRoute('about-us')),
    MenuModel(
        icon: Images.terms,
        title: 'terms_conditions'.tr,
        route: RouteHelper.getHtmlRoute('terms-and-condition')),
    MenuModel(
      icon: Images.delivery_man_join,
      title: 'join_as_a_delivery_man'.tr,
      route: RouteHelper.getHtmlRoute('terms-and-condition'),
    ),
    MenuModel(icon: Images.log_out, title: 'logout'.tr, route: '')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8,right: 8,bottom: 16,top: 8),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: _menuList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.88,
                  crossAxisSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  mainAxisSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL,
              ),
                itemBuilder: (context,index) => MenuButton(model: _menuList[index],isWallet: index == 3,),
            ),
          ),
        ],
      ),
    );
  }
}
