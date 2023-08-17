import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/splash_controller.dart';
import '../../../helper/responsive_helper.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../widget/module_view.dart';

class Theme1HomeScreen extends StatelessWidget {
  final ScrollController scrollController;
  final bool showMobileModule;

  const Theme1HomeScreen(
      {required this.scrollController, required this.showMobileModule});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        // App Bar
        SliverAppBar(
          floating: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: ResponsiveHelper.isDesktop(context)
              ? Colors.transparent
              : Theme.of(context).backgroundColor,
          title: Center(
              child: Container(
            width: Dimensions.WEB_MAX_WIDTH,
            height: 50,
            color: Theme.of(context).backgroundColor,
            child: Row(children: [
              InkWell(
                onTap: () => {},
                child: Image.asset(Images.module_icon, height: 22, width: 22),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              Expanded(
                  child: InkWell(
                onTap: () =>
                    Get.toNamed("RouteHelper.getAccessLocationRoute('home')"),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_SMALL,
                    horizontal: ResponsiveHelper.isDesktop(context)
                        ? Dimensions.PADDING_SIZE_SMALL
                        : 0,
                  ),
                  child: GetBuilder<SplashController>(
                      builder: (locationController) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          // locationController.getUserAddress()?.addressType ==
                          //         'home'
                          //     ?
                          Icons.home_filled
                          // : locationController
                          //             .getUserAddress()!
                          //             .addressType ==
                          //         'office'
                          //     ? Icons.work
                          //     : Icons.location_on
                          ,
                          size: 20,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        SizedBox(width: 10),
                        // hiển thị vị trí
                        Flexible(
                          child: Text(
                            "467 Nguyễn trãi Hà Nội",
                            style: robotoRegular.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                      ],
                    );
                  }),
                ),
              )),
              InkWell(
                child: GetBuilder<SplashController>(
                    builder: (notificationController) {
                  return Stack(children: [
                    Icon(Icons.notifications,
                        size: 25,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1, color: Theme.of(context).cardColor),
                          ),
                        ))
                    // : SizedBox()
                    ,
                  ]);
                }),
                onTap: () => Get.toNamed("RouteHelper.getNotificationRoute()"),
              ),
            ]),
          )),
          actions: [SizedBox()],
        ),

        // Search Button
        !showMobileModule
            ? SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                    child: Center(
                        child: Container(
                  height: 50,
                  width: Dimensions.WEB_MAX_WIDTH,
                  color: Theme.of(context).backgroundColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_SMALL),
                  child: InkWell(
                    onTap: () => Get.toNamed("RouteHelper.getSearchRoute()"),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                              spreadRadius: 1,
                              blurRadius: 5)
                        ],
                      ),
                      child: Row(children: [
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Icon(
                          Icons.search,
                          size: 25,
                          color: Theme.of(context).hintColor,
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Expanded(
                            child: Text(
                          'search_item_or_store'.tr,
                          style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context).hintColor,
                          ),
                        )),
                      ]),
                    ),
                  ),
                ))),
              )
            : SliverToBoxAdapter(),

        SliverToBoxAdapter(
          child: Center(
              child: SizedBox(
                  width: Dimensions.WEB_MAX_WIDTH,
                  child:
                      ModuleView(splashController: Get.find<SplashController>())
                  // Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       // BannerView1(isFeatured: false),
                  //       // CategoryView1(),
                  //       // ItemCampaignView1(),
                  //       // BestReviewedItemView(),
                  //       // PopularStoreView1(isPopular: true, isFeatured: false),
                  //       // PopularItemView1(isPopular: true),
                  //       // PopularStoreView1(isPopular: false, isFeatured: false),
                  //       Padding(
                  //         padding: EdgeInsets.fromLTRB(10, 15, 0, 5),
                  //         child: Row(children: [
                  //           Expanded(
                  //               child: Text(
                  //             'all_stores'.tr,
                  //             style: robotoMedium.copyWith(
                  //                 fontSize: Dimensions.fontSizeLarge),
                  //           )),
                  //           // FilterVie w(),
                  //         ]),
                  //       ),
                  //       GetBuilder<SplashController>(
                  //           builder: (storeController) {
                  //         return PaginatedListView(
                  //             scrollController: scrollController,
                  //             // totalSize:
                  //             // storeController.storeModel != null
                  //             //     ? storeController.storeModel!.totalSize
                  //             //     : null,
                  //             // offset: storeController.storeModel != null
                  //             //     ? storeController.storeModel!.offset
                  //             //     : null,
                  //             // onPaginate: (int offset) async =>
                  //             //     await storeController.getStoreList(
                  //             //         offset, false),
                  //             itemView: Text("data")
                  //
                  //             // ItemsView(
                  //             //   isStore: true,
                  //             //   items: null,
                  //             //   showTheme1Store: true,
                  //             //   stores: storeController.storeModel != null
                  //             //       ? storeController.storeModel!.stores
                  //             //       : null,
                  //             //   padding: EdgeInsets.symmetric(
                  //             //     horizontal: ResponsiveHelper.isDesktop(context)
                  //             //         ? Dimensions.PADDING_SIZE_EXTRA_SMALL
                  //             //         : Dimensions.PADDING_SIZE_SMALL,
                  //             //     vertical: ResponsiveHelper.isDesktop(context)
                  //             //     vertical: ResponsiveHelper.isDesktop(context)
                  //             //         ? Dimensions.PADDING_SIZE_EXTRA_SMALL
                  //             //         : 0,
                  //             //   ),
                  //             // ),
                  //             );
                  //       }),
                  //     ])
                  // ModuleView(splashController: splashController,),
                  )),
        ),
      ],
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 ||
        oldDelegate.minExtent != 50 ||
        child != oldDelegate.child;
  }
}
