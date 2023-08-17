import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/screen/home/theme1/theme1_home_screen.dart';
import 'package:lottie/lottie.dart';
import '../../controller/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/color_resources.dart';
import '../../view/base/menu_drawer.dart';
import 'item_notification.dart';

class HomeScreent extends StatefulWidget {
  const HomeScreent({Key? key}) : super(key: key);

  @override
  State<HomeScreent> createState() => _HomeScreentState();
}

class _HomeScreentState extends State<HomeScreent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Get.find<AuthController>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: MenuDrawer(),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
            },
            child:  Theme1HomeScreen(
              scrollController: ScrollController(),
              showMobileModule: true,
            )
              //   : CustomScrollView(
              // controller: _scrollController,
              // physics: AlwaysScrollableScrollPhysics(),
              // slivers: [
              //   // App Bar
              //   SliverAppBar(
              //     floating: true,
              //     elevation: 0,
              //     automaticallyImplyLeading: false,
              //     backgroundColor:
              //     ResponsiveHelper.isDesktop(context)
              //         ? Colors.transparent
              //         : Theme.of(context).backgroundColor,
              //     title: Center(
              //         child: Container(
              //           width: Dimensions.WEB_MAX_WIDTH,
              //           height: 50,
              //           color: Theme.of(context).backgroundColor,
              //           child: Row(
              //               children: [
              //                 (splashController.module != null &&
              //                     splashController
              //                         .configModel?.module ==
              //                         null)
              //                     ? InkWell(
              //                   onTap: () => splashController
              //                       .removeModule(),
              //                   child: Image.asset(
              //                       Images.module_icon,
              //                       height: 22,
              //                       width: 22,
              //                       color: Theme.of(context)
              //                           .textTheme
              //                           .bodyText1!
              //                           .color),
              //                 )
              //                     : SizedBox(),
              //                 SizedBox(
              //                     width: (splashController.module !=
              //                         null &&
              //                         splashController.configModel!
              //                             .module ==
              //                             null)
              //                         ? Dimensions
              //                         .PADDING_SIZE_EXTRA_SMALL
              //                         : 0),
              //                 Expanded(
              //                     child: InkWell(
              //                       onTap: () => Get.toNamed(RouteHelper
              //                           .getAccessLocationRoute('home')),
              //                       child: Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           vertical:
              //                           Dimensions.PADDING_SIZE_SMALL,
              //                           horizontal:
              //                           ResponsiveHelper.isDesktop(
              //                               context)
              //                               ? Dimensions
              //                               .PADDING_SIZE_SMALL
              //                               : 0,
              //                         ),
              //                         child:
              //                         GetBuilder<LocationController>(
              //                             builder:
              //                                 (locationController) {
              //
              //                               AddressModel? address = locationController.addressUserModel;
              //                               final isLoading = locationController.isLoading;
              //
              //                               return Row(
              //                                 crossAxisAlignment:
              //                                 CrossAxisAlignment.center,
              //                                 mainAxisAlignment:
              //                                 MainAxisAlignment.start,
              //                                 children: [
              //                                   Icon(
              //                                     locationController
              //                                         .getUserAddress()!
              //                                         .addressType ==
              //                                         'home'
              //                                         ? Icons.home_filled
              //                                         : locationController
              //                                         .getUserAddress()!
              //                                         .addressType ==
              //                                         'office'
              //                                         ? Icons.work
              //                                         : Icons.location_on,
              //                                     size: 20,
              //                                     color: Theme.of(context)
              //                                         .textTheme
              //                                         .bodyText1!
              //                                         .color,
              //                                   ),
              //                                   SizedBox(width: 10),
              //                                   // Flexible(
              //                                   //   child: isLoading
              //                                   //       ? CustomLoader() // Hiển thị loading khi đang tải dữ liệu
              //                                   //       : Text(
              //                                   //     // locationController.getUserAddress().address;
              //                                   //     address?.address ?? '',
              //                                   //     style: robotoRegular.copyWith(
              //                                   //       color: Theme.of(context).textTheme.bodyText1!.color,
              //                                   //       fontSize: Dimensions.fontSizeSmall,
              //                                   //     ),
              //                                   //     maxLines: 1,
              //                                   //     overflow: TextOverflow.ellipsis,
              //                                   //   ),
              //                                   // ),
              //                                   Flexible(
              //                                     child: Text(
              //                                       locationController.getUserAddress()!.address!,
              //                                       style: robotoRegular.copyWith(
              //                                         color:
              //                                         Theme.of(context).textTheme.bodyText1!.color,
              //                                         fontSize: Dimensions.fontSizeSmall,
              //                                       ),
              //                                       maxLines: 1,
              //                                       overflow: TextOverflow.ellipsis,
              //                                     ),
              //                                   ),
              //                                   Icon(Icons.arrow_drop_down,
              //                                       color: Theme.of(context)
              //                                           .textTheme
              //                                           .bodyText1!
              //                                           .color),
              //                                 ],
              //                               );
              //                             }),
              //                       ),
              //                     )),
              //                 InkWell(
              //                   child: GetBuilder<
              //                       NotificationController>(
              //                       builder:
              //                           (notificationController) {
              //                         return Stack(children: [
              //                           Icon(Icons.notifications,
              //                               size: 25,
              //                               color: Theme.of(context)
              //                                   .textTheme
              //                                   .bodyText1!
              //                                   .color),
              //                           notificationController
              //                               .hasNotification
              //                               ? Positioned(
              //                               top: 0,
              //                               right: 0,
              //                               child: Container(
              //                                 height: 10,
              //                                 width: 10,
              //                                 decoration:
              //                                 BoxDecoration(
              //                                   color:
              //                                   Theme.of(context)
              //                                       .primaryColor,
              //                                   shape:
              //                                   BoxShape.circle,
              //                                   border: Border.all(
              //                                       width: 1,
              //                                       color: Theme.of(
              //                                           context)
              //                                           .cardColor),
              //                                 ),
              //                               ))
              //                               : SizedBox(),
              //                         ]);
              //                       }),
              //                   onTap: () => Get.toNamed(RouteHelper
              //                       .getNotificationRoute()),
              //                 ),
              //               ]),
              //         )),
              //     actions: [SizedBox()],
              //   ),
              //
              //   // Search Button
              //   !_showMobileModule
              //       ? SliverPersistentHeader(
              //     pinned: true,
              //     delegate: SliverDelegate(
              //         child: Center(
              //             child: Container(
              //               height: 50,
              //               width: Dimensions.WEB_MAX_WIDTH,
              //               color: Theme.of(context)
              //                   .backgroundColor,
              //               padding: EdgeInsets.symmetric(
              //                   horizontal: Dimensions
              //                       .PADDING_SIZE_SMALL),
              //               child: InkWell(
              //                 onTap: () => Get.toNamed(
              //                     RouteHelper.getSearchRoute()),
              //                 child: Container(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: Dimensions
              //                           .PADDING_SIZE_SMALL),
              //                   decoration: BoxDecoration(
              //                     color: Theme.of(context)
              //                         .cardColor,
              //                     borderRadius:
              //                     BorderRadius.circular(
              //                         Dimensions
              //                             .RADIUS_SMALL),
              //                     boxShadow: [
              //                       BoxShadow(
              //                           color: Colors.grey[
              //                           Get.isDarkMode
              //                               ? 800
              //                               : 200]!,
              //                           spreadRadius: 1,
              //                           blurRadius: 5)
              //                     ],
              //                   ),
              //                   child: Row(children: [
              //                     Icon(
              //                       Icons.search,
              //                       size: 25,
              //                       color: Theme.of(context)
              //                           .primaryColor,
              //                     ),
              //                     SizedBox(
              //                         width: Dimensions
              //                             .PADDING_SIZE_EXTRA_SMALL),
              //                     Expanded(
              //                         child: Text(
              //                           textSearch,
              //                           style: robotoRegular
              //                               .copyWith(
              //                             fontSize: Dimensions
              //                                 .fontSizeSmall,
              //                             color: Theme.of(context)
              //                                 .hintColor,
              //                           ),
              //                         )),
              //                   ]),
              //                 ),
              //               ),
              //             ))),
              //   )
              //       : SliverToBoxAdapter(),
              //   SliverToBoxAdapter(
              //     child: Center(
              //         child: SizedBox(
              //           width: Dimensions.WEB_MAX_WIDTH,
              //           child: !_showMobileModule
              //               ? Column(
              //               crossAxisAlignment:
              //               CrossAxisAlignment.start,
              //               children: [
              //                 BannerView(isFeatured: false),
              //                 CategoryView(),
              //                 PopularStoreView(
              //                   isPopular: true,
              //                   isFeatured: false,
              //                   newLocalData: newLocalData,
              //                 ),
              //                 ItemCampaignView(),
              //                 PopularItemView(
              //                     isPopular: true),
              //                 PopularStoreView(
              //                   isPopular: false,
              //                   isFeatured: false,
              //                   newLocalData: newLocalData,
              //                 ),
              //                 PopularItemView(
              //                     isPopular: false),
              //                 Padding(
              //                   padding:
              //                   EdgeInsets.fromLTRB(
              //                       10, 15, 0, 5),
              //                   child: Row(children: [
              //                     Expanded(
              //                         child: Text(
              //                           Get.find<SplashController>()
              //                               .configModel!
              //                               .moduleConfig!
              //                               .module!
              //                               .showRestaurantText!
              //                               ? 'all_restaurants'
              //                               .tr
              //                               : 'all_stores'.tr,
              //                           style: robotoMedium.copyWith(
              //                               fontSize: Dimensions
              //                                   .fontSizeLarge),
              //                         )),
              //                     FilterView(),
              //                   ]),
              //                 ),
              //                 GetBuilder<StoreController>(
              //                     builder:
              //                         (storeController) {
              //                       return PaginatedListView(
              //                         scrollController:
              //                         _scrollController,
              //                         totalSize: storeController
              //                             .storeModel !=
              //                             null
              //                             ? storeController
              //                             .storeModel!
              //                             .totalSize
              //                             : null,
              //                         offset: storeController
              //                             .storeModel !=
              //                             null
              //                             ? storeController
              //                             .storeModel!.offset
              //                             : null,
              //                         onPaginate: (int
              //                         offset) async =>
              //                         await storeController
              //                             .getStoreList(
              //                             offset,
              //                             false),
              //                         itemView: ItemsView(
              //                           isStore: true,
              //                           items: null,
              //                           stores: storeController
              //                               .storeModel !=
              //                               null
              //                               ? storeController
              //                               .storeModel!
              //                               .stores
              //                               : null,
              //                           padding: EdgeInsets
              //                               .symmetric(
              //                             horizontal: ResponsiveHelper
              //                                 .isDesktop(
              //                                 context)
              //                                 ? Dimensions
              //                                 .PADDING_SIZE_EXTRA_SMALL
              //                                 : Dimensions
              //                                 .PADDING_SIZE_SMALL,
              //                             vertical: ResponsiveHelper
              //                                 .isDesktop(
              //                                 context)
              //                                 ? Dimensions
              //                                 .PADDING_SIZE_EXTRA_SMALL
              //                                 : 0,
              //                           ),
              //                           newLocalData: newLocalData,
              //                         ),
              //                       );
              //                     }),
              //               ])
              //               :  ModuleView(
              //             splashController:
              //             splashController,
              //           ),
              //         )),
              //   ),
              //
              // ],
            ),
          ),
        );
  }
}
