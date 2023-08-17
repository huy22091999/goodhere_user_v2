import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../helper/responsive_helper.dart';
import '../../utils/dimensions.dart';
import '../../view/base/custom_app_bar.dart';
import '../../view/base/footer_view.dart';
import '../../view/base/web_constrained_box.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CartController>().getCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: 'my_cart'.tr, // Đơn hàng của tôi
            backButton: false),
        body: GetBuilder<CartController>(
        builder: (cartController) {
          return cartController.cartList.isNotEmpty
              ?
          Column(
            children: [
              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: ResponsiveHelper.isDesktop(context)
                        ? EdgeInsets.only(
                      top: Dimensions.PADDING_SIZE_SMALL,
                    )
                        : EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    physics: BouncingScrollPhysics(),
                    child: FooterView(
                      child: SizedBox(
                        width: Dimensions.WEB_MAX_WIDTH,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product
                              // WebConstrainedBox(
                              //   dataLength:
                              //   cartController.cartList.length,
                              //   minLength: 5,
                              //   minHeight: 0.6,
                              //   child: ListView.builder(
                              //     physics: NeverScrollableScrollPhysics(),
                              //     shrinkWrap: true,
                              //     itemCount:
                              //     cartController.cartList.length,
                              //     itemBuilder: (context, index) {
                              //       return CartItemWidget(
                              //           cart: cartController
                              //               .cartList[index],
                              //           cartIndex: index,
                              //           addOns: _addOnsList[index],
                              //           isAvailable:
                              //           _availableList[index]);
                              //     },
                              //   ),
                              // ),
                              // SizedBox(
                              //     height: Get.find<SplashController>()
                              //         .configModel!
                              //         .moduleConfig!
                              //         .module!
                              //         .addOn!
                              //         ? 10
                              //         : 0),
                              //
                              // Get.find<SplashController>()
                              //     .configModel!
                              //     .moduleConfig!
                              //     .module!
                              //     .addOn!
                              //     ? Row(
                              //   mainAxisAlignment:
                              //   MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text('addons'.tr,
                              //         style: robotoRegular),
                              //     Text(
                              //         '(+) ${PriceConverter.convertPrice(_addOns)}',
                              //         style: robotoRegular),
                              //   ],
                              // )
                              //     : SizedBox(),
                              //
                              // Get.find<SplashController>()
                              //     .configModel!
                              //     .moduleConfig!
                              //     .module!
                              //     .addOn!
                              //     ? Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       vertical: Dimensions
                              //           .PADDING_SIZE_SMALL),
                              //   child: Divider(
                              //       thickness: 1,
                              //       color: Theme.of(context)
                              //           .hintColor
                              //           .withOpacity(0.5)),
                              // )
                              //     : SizedBox(),
                              //
                              // Get.find<SplashController>()
                              //     .configModel!
                              //     .moduleConfig!
                              //     .module!
                              //     .addOn!
                              //     ? Row(
                              //   mainAxisAlignment:
                              //   MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text('subtotal'.tr,
                              //         style: robotoMedium),
                              //     Text(
                              //         PriceConverter.convertPrice(
                              //             _subTotal),
                              //         style: robotoMedium),
                              //   ],
                              // )
                              //     : SizedBox(),
                              //
                              // ResponsiveHelper.isDesktop(context)
                              //     ? CheckoutButton(
                              //     cartController: cartController,
                              //     availableList: _availableList)
                              //     : SizedBox.shrink(),
                            ]),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
              :
          const SizedBox();
        }),
    );
  }
}