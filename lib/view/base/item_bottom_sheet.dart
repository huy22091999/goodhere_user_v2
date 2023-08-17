
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/controller/product_controller.dart';
import 'package:goodhere_user_v2/data/model/response/product_model.dart';
import 'package:goodhere_user_v2/view/base/quantity_button.dart';
import 'package:goodhere_user_v2/view/base/rating_bar.dart';

import '../../helper/responsive_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../custom_button.dart';
import 'custom_image.dart';
import 'discount_tag.dart';

class ItemBottomSheet extends StatefulWidget {
  final ProductModel item;
  //final bool isCampaign;
  //final CartModel? cart;
  //final int? cartIndex;
  //final bool inStorePage;
  ItemBottomSheet(
      {
        required this.item,
      //this.isCampaign = false,
      //this.cart,
      //this.cartIndex,
      //this.inStorePage = false
      });

  @override
  State<ItemBottomSheet> createState() => _ItemBottomSheetState();
}

class _ItemBottomSheetState extends State<ItemBottomSheet> {
  @override
  void initState() {
    super.initState();

    //Get.find<ItemController>().initData(widget.item!, widget.cart);
  }

  @override
  Widget build(BuildContext context) {
    bool inStorePage = false;
    String storeName = 'storeName';
    double avgRating = 4.3;
    int ratingCount = 30;
    List<String> choiceOptions = ['Sấy', 'Ủi'];
    List<List<String>> optionsDetail = [['Khô','Thơm'],['Không','Có']];
    int quantity = 1;
    List<Map<String,String>> addOns = [
      {'title': 'Dịu nhẹ', 'price':'10.000 đ'},
      {'title': 'Hoa nhiệt đới', 'price':'11.000 đ'},
      {'title': 'Anh đào', 'price':'10.000 đ'},
      {'title': 'Roman', 'price':'13.000 đ'},
      {'title': 'Gió biển', 'price':'10.000 đ'},
    ];
    int addOnsChooseIndex = 0;
    int addOnQty = 1;
    String total = '60,000 đ';
    return Container(
      width: 550,
      margin: EdgeInsets.only(top: GetPlatform.isWeb ? 0 : 30),
      padding: EdgeInsets.only(
          left: Dimensions.PADDING_SIZE_DEFAULT,
          bottom: Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: ResponsiveHelper.isMobile(context)
            ? BorderRadius.vertical(
                top: Radius.circular(Dimensions.RADIUS_EXTRA_LARGE))
            : BorderRadius.all(Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
      ),
      child: GetBuilder<ProductController>(builder: (productController) {
        // int _startingPrice;
        // int? _endingPrice;
        // if (widget.item!.choiceOptions!.length != 0) {
        //   List<int> _priceList = [];
        //   widget.item!.variations!
        //       .forEach((variation) => _priceList.add(variation.price!));
        //   _priceList.sort((a, b) => a.compareTo(b));
        //   _startingPrice = _priceList[0];
        //   if (_priceList[0] < _priceList[_priceList.length - 1]) {
        //     _endingPrice = _priceList[_priceList.length - 1];
        //   }
        // } else {
        //   _startingPrice = widget.item!.price!;
        // }
        //
        // List<String> _variationList = [];
        // for (int index = 0;
        //     index < widget.item!.choiceOptions!.length;
        //     index++) {
        //   _variationList.add(widget.item!.choiceOptions![index]
        //       .options![productController.variationIndex![index]]
        //       .replaceAll(' ', ''));
        // }
        // String variationType = '';
        // bool isFirst = true;
        // _variationList.forEach((variation) {
        //   if (isFirst) {
        //     variationType = '$variationType$variation';
        //     isFirst = false;
        //   } else {
        //     variationType = '$variationType-$variation';
        //   }
        // });
        //
        // int price = widget.item!.price;
        // Variation? _variation;
        // int? _stock = widget.item!.stock;
        // for (Variation variation in widget.item!.variations!) {
        //   if (variation.type == variationType) {
        //     price = variation.price!;
        //     _variation = variation;
        //     _stock = variation.stock!;
        //     break;
        //   }
        // }
        //
        // int _discount = ((widget.isCampaign || widget.item!.storeDiscount == 0)
        //     ? widget.item!.discount
        //     : widget.item!.storeDiscount) as int;
        // String _discountType =
        //     (widget.isCampaign || widget.item!.storeDiscount == 0)
        //         ? widget.item!.discountType!
        //         : 'percent';
        // int priceWithDiscount =
        //     PriceConverter.convertWithDiscount(price, _discount, _discountType);
        // int priceWithQuantity = priceWithDiscount * productController.quantity;
        // int addonsCost = 0;
        // List<AddOn> _addOnIdList = [];
        // List<AddOns> _addOnsList = [];
        // for (int index = 0; index < widget.item!.addOns!.length; index++) {
        //   if (productController.addOnActiveList[index]) {
        //     addonsCost = addonsCost +
        //         (widget.item!.addOns![index].price! *
        //             productController.addOnQtyList[index]);
        //     _addOnIdList.add(AddOn(
        //         id: widget.item!.addOns![index].id!,
        //         quantity: productController.addOnQtyList[index]));
        //     _addOnsList.add(widget.item!.addOns![index]);
        //   }
        // }
        // int priceWithAddons = priceWithQuantity +
        //     (Get.find<SplashController>()
        //             .configModel!
        //             .moduleConfig!
        //             .module!
        //             .addOn!
        //         ? addonsCost
        //         : 0);
        // // bool _isRestAvailable = DateConverter.isAvailable(widget!.product.restaurantOpeningTime, widget!.product.restaurantClosingTime);
        // bool _isAvailable = DateConverter.isAvailable(
        //     widget.item!.availableTimeStarts!, widget.item!.availableTimeEnds!);
        //
        // CartModel _cartModel = CartModel(
        //   price,
        //   priceWithDiscount,
        //   _variation != null ? [_variation] : [],
        //   (price -
        //       PriceConverter.convertWithDiscount(
        //           price, _discount, _discountType)),
        //   productController.quantity,
        //   _addOnIdList,
        //   _addOnsList,
        //   widget.isCampaign,
        //   _stock!,
        //   widget.item!,
        // );

        return SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Icon(Icons.close),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    right: Dimensions.PADDING_SIZE_DEFAULT,
                    top: ResponsiveHelper.isDesktop(context)
                        ? 0
                        : Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Product
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  print('Ảnh store click show detail');
                                },
                                // widget.isCampaign
                                //     ? null
                                //     : () {
                                //         if (!widget.isCampaign) {
                                //           Get.toNamed(
                                //               RouteHelper.getItemImagesRoute(
                                //                   widget.item!));
                                //         }
                                //       },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.RADIUS_SMALL),
                                    child: CustomImage(
                                      image:'',
                                          // '${widget.isCampaign ? Get.find<SplashController>().configModel?.baseUrls!.campaignImageUrl : Get.find<SplashController>().configModel?.baseUrls!.itemImageUrl}/${widget.item!.image}',
                                      width: ResponsiveHelper.isMobile(context)
                                          ? 100
                                          : 140,
                                      height: ResponsiveHelper.isMobile(context)
                                          ? 100
                                          : 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  DiscountTag(
                                      discount: 10000,//_discount,
                                      discountType: 'discount',//_discountType,
                                      fromTop: 20),
                                ]),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.item.name}',
                                        style: robotoMedium.copyWith(
                                            fontSize: Dimensions.fontSizeLarge),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (inStorePage) {
                                            Get.back();
                                          } else {
                                            print('Get Detail Store');
                                            // Get.offNamed(
                                            //     RouteHelper.getStoreRoute(
                                            //         widget.item!.storeId!,
                                            //         'item'));
                                          }
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 5, 5),
                                          child: Text(
                                            storeName,
                                            style: robotoRegular.copyWith(
                                                fontSize:
                                                    Dimensions.fontSizeSmall,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      ),
                                      RatingBar(
                                          rating: avgRating,
                                          size: 15,
                                          ratingCount:ratingCount),
                                      Text('50,000 đ - 90,000 đ',
                                        style: robotoMedium.copyWith(
                                            fontSize: Dimensions.fontSizeLarge),
                                      ),
                                      true
                                          ? Text('40,000 đ - 80,000 đ',
                                              style: robotoMedium.copyWith(
                                                  color: Theme.of(context)
                                                      .disabledColor,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            )
                                          : SizedBox(),
                                    ]),
                              ),
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                   true
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL,
                                                horizontal: Dimensions
                                                    .PADDING_SIZE_SMALL),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.RADIUS_SMALL),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            child: Text('non_veg'.tr,
                                              style: robotoRegular.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeExtraSmall,
                                                  color: Colors.white),
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(height: 50),

                                    false
                                        ? SizedBox(height: 25)
                                        : GetBuilder<ProductController>(
                                            builder: (wishList) {
                                            return InkWell(
                                              onTap: () {
                                                print('love onclick');
                                              },
                                              child: Icon(
                                               false
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: false
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Theme.of(context)
                                                        .disabledColor,
                                              ),
                                            );
                                          }),
                                  ]),
                            ]),

                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                        (widget.item!.description != null &&
                                widget.item!.description!.isNotEmpty)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('description'.tr, style: robotoMedium),
                                  SizedBox(
                                      height:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  Text(widget.item!.description!,
                                      style: robotoRegular),
                                  SizedBox(
                                      height: Dimensions.PADDING_SIZE_LARGE),
                                ],
                              )
                            : SizedBox(),

                        // Variation
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: choiceOptions.length,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      choiceOptions[index],
                                      style: robotoMedium),
                                  SizedBox(
                                      height:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          ResponsiveHelper.isMobile(context)
                                              ? 3
                                              : 4,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: (1 / 0.25),
                                    ),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: optionsDetail.length,
                                    itemBuilder: (context, i) {
                                      return InkWell(
                                        onTap: () {
                                           print('Choose options');
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL),
                                          decoration: BoxDecoration(
                                            color:
                                                    i==0
                                                ? Theme.of(context)
                                                    .backgroundColor
                                                : Theme.of(context)
                                                    .primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.RADIUS_SMALL),
                                            border:
                                                 i == 0
                                                    ? Border.all(
                                                        color: Theme.of(context)
                                                            .disabledColor,
                                                        width: 2)
                                                    : null,
                                          ),
                                          child: Text(
                                            optionsDetail[index][i],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: robotoRegular.copyWith(
                                              color:
                                                      i == 0
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                      height: index != choiceOptions.length - 1
                                          ? Dimensions.PADDING_SIZE_LARGE
                                          : 0),
                                ]);
                          },
                        ),
                        SizedBox(
                            height: choiceOptions.length > 0
                                ? Dimensions.PADDING_SIZE_LARGE
                                : 0),

                        // Quantity
                        Row(children: [
                          Text('quantity'.tr, style: robotoMedium),
                          Expanded(child: SizedBox()),
                          Row(children: [
                            QuantityButton(
                              onTap: () {
                                print('Decrease Quantity onclick');
                              },
                              isIncrement: false,
                            ),
                            Text( '${quantity}' ,
                                style: robotoMedium.copyWith(
                                    fontSize: Dimensions.fontSizeLarge)),
                            QuantityButton(
                              onTap: () =>
                                  print('Increment Quantity onclick'),
                              isIncrement: true,
                            ),
                          ]),
                        ]),
                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                        // Addons
                        addOns.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('addons'.tr, style: robotoMedium),
                                  SizedBox(
                                      height:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: (1 / 1.1),
                                    ),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: addOns.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          print('AddOns onclick');
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                              bottom: index == addOnsChooseIndex
                                                  ? 2
                                                  : 20),
                                          decoration: BoxDecoration(
                                            color: index == addOnsChooseIndex
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .backgroundColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.RADIUS_SMALL),
                                            border: index == addOnsChooseIndex
                                                ? null
                                                : Border.all(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    width: 2),
                                            boxShadow: index == addOnsChooseIndex
                                                ? [
                                                    BoxShadow(
                                                        color: Colors.grey[
                                                            Get.isDarkMode
                                                                ? 700
                                                                : 300]!,
                                                        blurRadius: 5,
                                                        spreadRadius: 1)
                                                  ]
                                                : null,
                                          ),
                                          child: Column(children: [
                                            Expanded(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                     '${addOns[index]['title']}',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          robotoMedium.copyWith(
                                                        color: index == addOnsChooseIndex
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeSmall,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                     true
                                                          ? '${addOns[index]['price']}'
                                                          : 'free'.tr,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: robotoRegular
                                                          .copyWith(
                                                        color: addOnsChooseIndex == index
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeExtraSmall,
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            addOnsChooseIndex == index
                                                ? Container(
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(Dimensions
                                                                .RADIUS_SMALL),
                                                        color: Theme.of(context)
                                                            .cardColor),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                print('reduce onclick addon quantity');
                                                              },
                                                              child: Center(child: Icon(Icons.remove, size: 15)),
                                                            ),
                                                          ),
                                                          Text('$addOnQty',style: robotoMedium.copyWith(fontSize:Dimensions.fontSizeSmall)),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () => print('Incremace quantity addons'),
                                                              child: Center(child: Icon(Icons.add, size: 15)),
                                                            ),
                                                          ),
                                                        ]),
                                                  )
                                                : SizedBox(),
                                          ]),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                ],
                              )
                            : SizedBox(),

                        Row(children: [
                          Text('${'total_amount'.tr}:', style: robotoMedium),
                          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          Text(total,style: robotoBold.copyWith(color: Theme.of(context).primaryColor)),
                        ]),
                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                        //Add to cart Button

                        // _isAvailable
                        true
                            ? SizedBox()
                            : Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_SMALL),
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.PADDING_SIZE_SMALL),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.RADIUS_SMALL),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                ),
                                child: Column(children: [
                                  Text('not_available_now'.tr,
                                      style: robotoMedium.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: Dimensions.fontSizeLarge,
                                      )),
                                  Text('${'available_will_be'.tr}'
                                    // '${'available_will_be'.tr} ${DateConverter.convertTimeToTime(widget.item!.availableTimeStarts!)} '
                                    // '- ${DateConverter.convertTimeToTime(widget.item!.availableTimeEnds!)}'
                                    , style: robotoRegular,
                                  ),
                                ]),
                              ),

                        //(!widget.item!.scheduleOrder! && !_isAvailable)
                    false
                            ? SizedBox()
                            : Row(children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(50, 50),
                                    primary: Theme.of(context).cardColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.RADIUS_SMALL),
                                      side: BorderSide(
                                          width: 2,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  onPressed: () {
                                    print('Show store detail');
                                    // if (widget.inStorePage) {
                                    //   Get.back();
                                    // } else {
                                    //   Get.offNamed(RouteHelper.getStoreRoute(
                                    //       widget.item!.storeId!, 'item'));
                                    // }
                                  },
                                  child: Image.asset(Images.house,
                                      color: Theme.of(context).primaryColor,
                                      height: 30,
                                      width: 30),
                                ),
                                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                Expanded(
                                  child: GetBuilder<ProductController>(
                                    builder: (itemController) => CustomButton(
                                      width: ResponsiveHelper.isDesktop(context)
                                          ? MediaQuery.of(context).size.width /
                                              2.0
                                          : null,
                                      buttonText:'add_to_cart'.tr,
                                      onPressed: (){
                                        print('Thêm vào giỏ hàng');
                                      },
                                    ),
                                  ),
                                )
                              ]),
                      ]),
                ),
              ]),
        );
      }),
    );
  }
}
