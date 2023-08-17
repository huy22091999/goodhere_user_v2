import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/data/model/response/order_model.dart';

import '../../../helper/responsive_helper.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';
import '../../../view/base/custom_image.dart';
import '../../../view/base/rating_bar.dart';

class CartItemWidget extends StatelessWidget {
  final List<OrderModel> cart;
  final int cartIndex;
  // final List<AddOns> addOns;
  final bool isAvailable;

  CartItemWidget(
      {required this.cart,
      required this.cartIndex,
      required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
      child: InkWell(
        onTap: () {
          print('show detail');
          // ResponsiveHelper.isMobile(context)
          //     ? showModalBottomSheet(
          //         context: context,
          //         isScrollControlled: true,
          //         backgroundColor: Colors.transparent,
          //         builder: (con) => ItemBottomSheet(
          //             item: cart.item, cartIndex: cartIndex, cart: cart),
          //       )
          //     : showDialog(
          //         context: context,
          //         builder: (con) => Dialog(
          //               child: ItemBottomSheet(
          //                   item: cart.item, cartIndex: cartIndex, cart: cart),
          //             ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
          child: Stack(children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Icon(Icons.delete, color: Colors.white, size: 50),
            ),
            Dismissible(
              key: UniqueKey(),
              onDismissed: (DismissDirection direction){},
                  //Get.find<CartController>().removeFromCart(cartIndex),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.RADIUS_SMALL),
                            child: CustomImage(
                              image: '',
                              height: 65,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          isAvailable
                              ? SizedBox()
                              : Positioned(
                                  top: 0,
                                  left: 0,
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.RADIUS_SMALL),
                                        color: Colors.black.withOpacity(0.6)),
                                    child: Text('not_available_now_break'.tr,
                                        textAlign: TextAlign.center,
                                        style: robotoRegular.copyWith(
                                          color: Colors.white,
                                          fontSize: 8,
                                        )),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'cart.item!.name!',
                                style: robotoMedium.copyWith(
                                    fontSize: Dimensions.fontSizeSmall),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 2),
                              // RatingBar(
                              //     rating: cart.item!.avgRating!,
                              //     size: 12,
                              //     ratingCount: cart.item!.ratingCount!),
                              // SizedBox(height: 5),
                              // Row(
                              //   children: [
                              //     Text(
                              //       PriceConverter.convertPrice(
                              //           cart.discountedPrice!),
                              //       style: robotoMedium.copyWith(
                              //           fontSize: Dimensions.fontSizeSmall),
                              //     ),
                              //     SizedBox(width: 10,),
                              //     Text(
                              //       PriceConverter.convertPrice(
                              //           cart.discountAmount! +
                              //               cart.discountedPrice!),
                              //       style: robotoMedium.copyWith(
                              //         fontSize: Dimensions.fontSizeSmall,
                              //         decoration: TextDecoration.lineThrough,
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ]),
                      ),
                      // Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       ((Get.find<SplashController>()
                      //                       .configModel!
                      //                       .moduleConfig!
                      //                       .module!
                      //                       .unit! &&
                      //                   cart.item!.unitType != null) ||
                      //               (Get.find<SplashController>()
                      //                       .configModel!
                      //                       .moduleConfig!
                      //                       .module!
                      //                       .vegNonVeg! &&
                      //                   Get.find<SplashController>()
                      //                       .configModel!
                      //                       .toggleVegNonVeg!))
                      //           ? Container(
                      //               padding: EdgeInsets.symmetric(
                      //                   vertical:
                      //                       Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      //                   horizontal:
                      //                       Dimensions.PADDING_SIZE_SMALL),
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(
                      //                     Dimensions.RADIUS_SMALL),
                      //                 color: Theme.of(context).primaryColor,
                      //               ),
                      //               child: Text(
                      //                 Get.find<SplashController>()
                      //                         .configModel!
                      //                         .moduleConfig!
                      //                         .module!
                      //                         .unit!
                      //                     ? cart.item!.unitType ?? ''
                      //                     : cart.item!.veg == 0
                      //                         ? 'non_veg'.tr
                      //                         : 'veg'.tr,
                      //                 style: robotoRegular.copyWith(
                      //                     fontSize:
                      //                         Dimensions.fontSizeExtraSmall,
                      //                     color: Colors.white),
                      //               ),
                      //             )
                      //           : SizedBox(),
                      //       SizedBox(
                      //           height: Get.find<SplashController>()
                      //                   .configModel!
                      //                   .toggleVegNonVeg!
                      //               ? Dimensions.PADDING_SIZE_EXTRA_SMALL
                      //               : 0),
                      //       Row(children: [
                      //         QuantityButton(
                      //           onTap: () {
                      //             if (cart.quantity > 1) {
                      //               Get.find<CartController>().setQuantity(
                      //                   false, cartIndex, cart.stock!);
                      //             } else {
                      //               Get.find<CartController>()
                      //                   .removeFromCart(cartIndex);
                      //             }
                      //           },
                      //           isIncrement: false,
                      //         ),
                      //         Text(cart.quantity.toString(),
                      //             style: robotoMedium.copyWith(
                      //                 fontSize: Dimensions.fontSizeExtraLarge)),
                      //         QuantityButton(
                      //           onTap: () => Get.find<CartController>()
                      //               .setQuantity(true, cartIndex, cart.stock!),
                      //           isIncrement: true,
                      //         ),
                      //       ]),
                      //     ]),
                      // !ResponsiveHelper.isMobile(context)
                      //     ? Padding(
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: Dimensions.PADDING_SIZE_SMALL),
                      //         child: IconButton(
                      //           onPressed: () {
                      //             Get.find<CartController>()
                      //                 .removeFromCart(cartIndex);
                      //           },
                      //           icon: Icon(Icons.delete, color: Colors.red),
                      //         ),
                      //       )
                      //     : SizedBox(),
                    ]),
                    // (Get.find<SplashController>()
                    //             .configModel!
                    //             .moduleConfig!
                    //             .module!
                    //             .addOn! &&
                    //         _addOnText.isNotEmpty)
                    //     ? Padding(
                    //         padding: EdgeInsets.only(
                    //             top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    //         child: Row(children: [
                    //           SizedBox(width: 80),
                    //           Text('${'addons'.tr}: ',
                    //               style: robotoMedium.copyWith(
                    //                   fontSize: Dimensions.fontSizeSmall)),
                    //           Flexible(
                    //               child: Text(
                    //             _addOnText,
                    //             style: robotoRegular.copyWith(
                    //                 fontSize: Dimensions.fontSizeSmall,
                    //                 color: Theme.of(context).disabledColor),
                    //           )),
                    //         ]),
                    //       )
                    //     : SizedBox(),
                    // cart.item!.variations!.length > 0
                    //     ? Padding(
                    //         padding: EdgeInsets.only(
                    //             top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    //         child: Row(children: [
                    //           SizedBox(width: 80),
                    //           Text('${'variations'.tr}: ',
                    //               style: robotoMedium.copyWith(
                    //                   fontSize: Dimensions.fontSizeSmall)),
                    //           Flexible(
                    //               child: Text(
                    //             _variationText,
                    //             style: robotoRegular.copyWith(
                    //                 fontSize: Dimensions.fontSizeSmall,
                    //                 color: Theme.of(context).disabledColor),
                    //           )),
                    //         ]),
                    //       )
                    //     : SizedBox(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
