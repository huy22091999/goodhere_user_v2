import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/controller/product_controller.dart';
import 'package:goodhere_user_v2/screen/cart.dart';
import 'package:goodhere_user_v2/screen/dashboard/widget/bottom_nav_item.dart';
import 'package:goodhere_user_v2/screen/order/order_screen.dart';

import '../../controller/splash_controller.dart';
import '../../helper/responsive_helper.dart';
import '../../utils/dimensions.dart';
import '../../view/base/cart_widget.dart';
import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';
import '../menu/menu_screen.dart';
class DashboardScreen extends StatefulWidget {
  final int? pageIndex;

  DashboardScreen({required this.pageIndex});

  @override
  _DashboardScreenState createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  List<Widget>? _screens;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.pageIndex!;

    _pageController = PageController(initialPage: widget.pageIndex!);

    _screens = [
      const HomeScreent(),
      FavouriteScreen(),
      CartScreen(),
      OrderScreen(),
      // CartScreen(fromNav: true),
      // OrderScreen(),
      Container(),
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    /*if(GetPlatform.isMobile) {
      NetworkInfo.checkConnectivity(_scaffoldKey.currentContext);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          if (!ResponsiveHelper.isDesktop(context)) {
            Get.find<SplashController>().setModule(-1);
            return false;
          } else {
            if (_canExit) {
              return true;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('back_press_again_to_exit'.tr,
                    style: const TextStyle(color: Colors.white)),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              ));
              _canExit = true;
              Timer(const Duration(seconds: 2), () {
                _canExit = false;
              });
              return false;
            }
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: ResponsiveHelper.isDesktop(context)
            ? null
            : GetBuilder<ProductController>(builder: (productController) => Stack(
          children: [
            FloatingActionButton(
              elevation: 5,
              backgroundColor: _pageIndex == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).cardColor,
              onPressed: () => _setPage(2),
              child: CartWidget(
                  color: _pageIndex == 2
                      ? Theme.of(context).cardColor
                      : Theme.of(context).disabledColor,
                  size: 30),
            ),
            Positioned(
                right: 0,
                top: 0,
                child: Visibility(
                  visible: productController.cart.isNotEmpty,
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(productController.cart.length.toString(),style: const TextStyle(color: Colors.white),),
                      )
                  ),
                )
            )
          ],
        ),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ResponsiveHelper.isDesktop(context)
            ? const SizedBox()
            : BottomAppBar(
                elevation: 5,
                notchMargin: 5,
                clipBehavior: Clip.antiAlias,
                shape: const CircularNotchedRectangle(),
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: Row(children: [
                    BottomNavItem(
                        iconData: Icons.home,
                        isSelected: _pageIndex == 0,
                        onTap: () => _setPage(0)),
                    BottomNavItem(
                        iconData: Icons.favorite,
                        isSelected: _pageIndex == 1,
                        onTap: () => _setPage(1)),
                    const Expanded(child: SizedBox()),
                    BottomNavItem(
                        iconData: Icons.shopping_bag,
                        isSelected: _pageIndex == 3,
                        onTap: () => _setPage(3)),
                    BottomNavItem(
                        iconData: Icons.menu,
                        isSelected: _pageIndex == 4,
                        onTap: () {
                          Get.bottomSheet(
                              const MenuScreen(),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true);
                        }),
                  ]),
                ),
              ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens![index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
