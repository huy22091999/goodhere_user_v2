import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order_controller.dart';
import '../../../helper/date_converter.dart';
import '../../../helper/responsive_helper.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../view/base/custom_image.dart';
import '../../../view/base/footer_view.dart';
import '../../../view/base/no_data_screen.dart';
import '../../../view/base/paginated_list_view.dart';
import 'order_shimmer.dart';

class OrderView extends StatelessWidget {
  final bool isRunning;
  OrderView({required this.isRunning});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController) {
        return RefreshIndicator(
          onRefresh: () async {
            if(isRunning) {
              await orderController.getAllOrders();
            }else {
              await orderController.getAllOrders();
            }
          },
          child: Scrollbar(child: SingleChildScrollView(
            controller: scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            child: FooterView(
              child: SizedBox(
                width: Dimensions.WEB_MAX_WIDTH,
                child: PaginatedListView(
                  scrollController: scrollController,
                  onPaginate: (int offset) {
                    // if(isRunning) {
                    //   Get.find<OrderController>().getAllOrders();
                    // }else {
                    //   Get.find<OrderController>().getAllOrders();
                    // }
                  },
                  // totalSize: paginatedOrderModel != null ? paginatedOrderModel.totalSize : null,
                  // offset: paginatedOrderModel != null ? paginatedOrderModel.offset : null,
                  itemView: ListView.builder(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    itemCount: orderController.orderList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      //bool _isParcel = paginatedOrderModel!.orders![index].orderType == 'parcel';
                      bool _isParcel = false;
                      //Show Detail
                      return InkWell(
                        onTap: () {
                          // Get.toNamed(
                          //   RouteHelper.getOrderDetailsRoute(paginatedOrderModel!.orders![index].id!),
                          //   arguments: OrderDetailsScreen(
                          //     orderId: paginatedOrderModel.orders![index].id!,
                          //     orderModel: paginatedOrderModel.orders![index],
                          //   ),
                          // );
                        },
                        child: Container(
                          padding: ResponsiveHelper.isDesktop(context) ? EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL) : null,
                          margin: ResponsiveHelper.isDesktop(context) ? EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL) : null,
                          decoration: ResponsiveHelper.isDesktop(context) ? BoxDecoration(
                            color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                            boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300]!, blurRadius: 5, spreadRadius: 1)],
                          ) : null,
                          child: Column(children: [

                            Row(children: [

                              Stack(children: [
                                Container(
                                  height: 60, width: 60, alignment: Alignment.center,
                                  decoration: _isParcel ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                                  ) : null,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                                    child: CustomImage(
                                      image: '',
                                      height: _isParcel ? 35 : 60, width: _isParcel ? 35 : 60, fit: _isParcel ? null : BoxFit.cover,
                                    ),
                                  ),
                                ),
                                _isParcel ? Positioned(left: 0, top: 10, child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(right: Radius.circular(Dimensions.RADIUS_SMALL)),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Text('parcel'.tr, style: robotoMedium.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall, color: Colors.white,
                                  )),
                                )) : SizedBox(),
                              ]),
                              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),

                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Row(children: [
                                    Text(
                                      '${_isParcel ? 'delivery_id'.tr : 'order_id'.tr}:',
                                      style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                                    ),
                                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                    Text('#${orderController.orderList[index].id?.substring(0,6)}', style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall)),
                                  ]),
                                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    DateConverter.dateTimeStringToDateTime("2023-08-07 11:13:00"),
                                    style: robotoRegular.copyWith(color: Theme.of(context).disabledColor, fontSize: Dimensions.fontSizeSmall),
                                  ),
                                ]),
                              ),
                              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),

                              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Text('Đã xác nhận', style: robotoMedium.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).cardColor,
                                  )),
                                ),
                                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                isRunning
                                    ?
                                InkWell(
                                  onTap: () {
                                    print('Show map. Theo dõi đơn hàng');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                                      border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                    ),
                                    child: Row(children: [
                                      Image.asset(Images.tracking, height: 15, width: 15, color: Theme.of(context).primaryColor),
                                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      Text(_isParcel ? 'track_delivery'.tr : 'track_order'.tr, style: robotoMedium.copyWith(
                                        fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).primaryColor,
                                      )),
                                    ]),
                                  ),
                                )
                                    :
                                Text(
                                  true ? 'items'.tr : 'item'.tr,
                                  style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall),
                                ),
                              ]),
                            ]),

                            false ? SizedBox() : Padding(
                              padding: EdgeInsets.only(left: 70),
                              child: Divider(
                                color: Theme.of(context).disabledColor, height: Dimensions.PADDING_SIZE_LARGE,
                              ),
                            ),

                          ]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )),
        );
        // :
        // NoDataScreen(text: 'no_order_found'.tr, showFooter: true) : OrderShimmer(orderController: orderController);
      }),
    );
  }
}
