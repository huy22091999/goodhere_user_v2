import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/controller/product_controller.dart';
import 'package:goodhere_user_v2/controller/splash_controller.dart';
import 'package:goodhere_user_v2/data/model/response/product_model.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../helper/route_helper.dart';
import '../../../theme/theme_controller.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';
import '../../../view/base/custom_image.dart';
import '../../../view/base/discount_tag.dart';
import '../../../view/base/not_available_widget.dart';
import '../../../view/base/rating_bar.dart';
import '../../../view/base/title_widget.dart';

class PopularItemView extends StatelessWidget {
  // final bool isPopular;

  // PopularItemView({required this.isPopular});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
      // List<ProductModel>? _itemList = isPopular
      //     ? productController.popularItemList
      //     : productController.reviewedItemList;
      List<ProductModel> itemList = productController.productList;
      bool isPopular = true;
      bool itemProductIsAvailable = true;
      String storeName = 'Thanh Xuyen';
      var rate = 4.5;
      int ratingCount = 40;
      int discount = 10000;
      return (itemList.isEmpty)
          ? const SizedBox()
          : Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: TitleWidget(
                title: isPopular
                    ? 'popular_items_nearby'.tr
                    : 'best_reviewed_item'.tr,
                onTap: (){
                  print('Get.toNamed(RouteHelper.getPopularItemRoute(isPopular))');
                }
            ),
          ),
          SizedBox(
            height: 90,
            child: itemList != null
                ? ListView.builder(
              controller: ScrollController(),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                  left: Dimensions.PADDING_SIZE_SMALL),
              itemCount:
              itemList.length > 10 ? 10 : itemList.length,
              itemBuilder: (context, index) {
                // final distance = Geolocator.distanceBetween(
                //     newLocalData.latitude,
                //     newLocalData.longitude,
                //     double.parse(_itemList[index].latitude),
                //     double.parse(_itemList[index].longitude));
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                      2, 2, Dimensions.PADDING_SIZE_SMALL, 2),
                  child: InkWell(
                    onTap: () {
                      Get.find<SplashController>().navigateToItemPage(itemList[index],context);
                      // Get.find<ItemController>().navigateToItemPage(
                      //     itemList[index], context);
                    },
                    child: Container(
                      height: 90,
                      width: 250,
                      padding: EdgeInsets.all(
                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_SMALL),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[
                            Get.find<ThemeController>()
                                .darkTheme
                                ? 800
                                : 300]!,
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.RADIUS_SMALL),
                                child: CustomImage(
                                  image: '',
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              DiscountTag(
                                discount: 2000,
                                discountType: 'VND',
                              ),
                              itemProductIsAvailable
                                  ? SizedBox()
                                  : NotAvailableWidget(),
                            ]),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions
                                        .PADDING_SIZE_EXTRA_SMALL),
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        itemList[index].name!,
                                        style: robotoMedium
                                            .copyWith(
                                            fontSize: Dimensions
                                                .fontSizeSmall),
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        storeName,
                                        style: robotoMedium.copyWith(
                                            fontSize: Dimensions
                                                .fontSizeExtraSmall,
                                            color: Theme.of(context)
                                                .disabledColor),
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                      RatingBar(
                                        rating: rate,
                                        size: 12,
                                        ratingCount: ratingCount,
                                      ),
                                      Row(children: [
                                        Expanded(
                                          child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .end,
                                              children: [
                                                Text('${itemList[index].price}',
                                                  style: robotoBold
                                                      .copyWith(
                                                      fontSize:
                                                      Dimensions
                                                          .fontSizeSmall),
                                                ),
                                                SizedBox(
                                                    width:
                                                    true
                                                        ?
                                                    Dimensions.PADDING_SIZE_EXTRA_SMALL
                                                        :
                                                    0
                                                ),
                                                true
                                                    ? Flexible(
                                                    child: Text('$discount',
                                                      style: robotoMedium
                                                          .copyWith(
                                                        fontSize:
                                                        Dimensions
                                                            .fontSizeExtraSmall,
                                                        color: Theme.of(
                                                            context)
                                                            .disabledColor,
                                                        decoration:
                                                        TextDecoration
                                                            .lineThrough,
                                                      ),
                                                    ))
                                                    : SizedBox(),
                                              ]),
                                        ),
                                        Icon(Icons.add, size: 20),
                                      ]),
                                    ]),
                              ),
                            ),
                          ]),
                    ),
                  ),
                );
              },
            )
                : PopularItemShimmer(enabled: itemList == null),
          ),
        ],
      );
    });
  }
}

class PopularItemShimmer extends StatelessWidget {
  final bool enabled;

  PopularItemShimmer({required this.enabled});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(2, 2, Dimensions.PADDING_SIZE_SMALL, 2),
          child: Container(
            height: 90,
            width: 250,
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
              boxShadow: [
                BoxShadow(
                  color: Colors
                      .grey[Get.find<ThemeController>().darkTheme ? 700 : 300]!,
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Shimmer(
              duration: Duration(seconds: 1),
              interval: Duration(seconds: 1),
              enabled: enabled,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        color: Colors.grey[300],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 15,
                                  width: 100,
                                  color: Colors.grey[300]),
                              SizedBox(height: 5),
                              Container(
                                  height: 10,
                                  width: 130,
                                  color: Colors.grey[300]),
                              SizedBox(height: 5),
                              RatingBar(rating: 0, size: 12, ratingCount: 0),
                              Row(children: [
                                Expanded(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                            height: 15,
                                            width: 50,
                                            color: Colors.grey[300]),
                                        SizedBox(
                                            width: Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL),
                                        Container(
                                            height: 10,
                                            width: 50,
                                            color: Colors.grey[300]),
                                      ]),
                                ),
                                Icon(Icons.add, size: 20),
                              ]),
                            ]),
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
