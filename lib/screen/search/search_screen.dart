
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/screen/search/widget/search_field.dart';

import '../../controller/auth_controller.dart';
import '../../controller/search_controller.dart';
import '../../helper/responsive_helper.dart';
import '../../utils/dimensions.dart';
import '../../view/base/menu_drawer.dart';

class SearchScreen extends StatefulWidget {
  final String queryText;
  SearchScreen({required this.queryText});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();

    // _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    // if(_isLoggedIn) {
    //   Get.find<SearchController1>().getSuggestedItems();
    // }
    // Get.find<SearchController1>().getHistoryList();
    // if(widget.queryText.isNotEmpty) {
    //   _actionSearch(true, widget.queryText, true);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return

      WillPopScope(
      onWillPop: () async {
        if(Get.find<SearchController1>().isSearchMode) {
          return true;
        }else {
          Get.find<SearchController1>().setSearchMode(true);
          return false;
        }
      },
      child: Scaffold(
        endDrawer: MenuDrawer(),
        body: SafeArea(child: Padding(
          padding: ResponsiveHelper.isDesktop(context) ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
          child: Text("")
          // GetBuilder<SearchController1>(builder: (searchController) {
          //   _searchController.text = searchController.searchText;
          //   return Column(children: [
          //
          //     widget.queryText.isNotEmpty ? SizedBox() : Center(child: SizedBox(width: Dimensions.WEB_MAX_WIDTH, child: Row(children: [
          //       SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
          //       Expanded(child: SearchField(
          //         controller: _searchController,
          //         hint: Get.find<SplashController>().configModel!.moduleConfig!.module!.showRestaurantText!
          //             ? 'search_food_or_restaurant'.tr : 'search_item_or_store'.tr,
          //         suffixIcon: !searchController.isSearchMode ? Icons.filter_list : Icons.search,
          //         iconPressed: () => _actionSearch(false, _searchController.text.trim(), false),
          //         onSubmit: (text) => _actionSearch(true, _searchController.text.trim(), false),
          //       )),
          //       CustomButton(
          //         onPressed: () => searchController.isSearchMode ? Get.back() : searchController.setSearchMode(true),
          //         buttonText: 'cancel'.tr,
          //         transparent: true,
          //         width: 80,
          //       ),
          //     ]))),
          //
          //     Expanded(child: searchController.isSearchMode ? SingleChildScrollView(
          //       physics: BouncingScrollPhysics(),
          //       padding: ResponsiveHelper.isDesktop(context) ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
          //       child: FooterView(
          //         child: SizedBox(width: Dimensions.WEB_MAX_WIDTH, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //
          //           searchController.historyList.length > 0 ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //             Text('history'.tr, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
          //             InkWell(
          //               onTap: () => searchController.clearSearchAddress(),
          //               child: Padding(
          //                 padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL, horizontal: 4),
          //                 child: Text('clear_all'.tr, style: robotoRegular.copyWith(
          //                   fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor,
          //                 )),
          //               ),
          //             ),
          //           ]) : SizedBox(),
          //
          //           ListView.builder(
          //             itemCount: searchController.historyList.length,
          //             physics: NeverScrollableScrollPhysics(),
          //             shrinkWrap: true,
          //             itemBuilder: (context, index) {
          //               return Column(children: [
          //                 Row(children: [
          //                   Expanded(
          //                     child: InkWell(
          //                       onTap: () => searchController.searchData(searchController.historyList[index], false),
          //                       child: Padding(
          //                         padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          //                         child: Text(
          //                           searchController.historyList[index],
          //                           style: robotoRegular.copyWith(color: Theme.of(context).disabledColor),
          //                           maxLines: 1, overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   InkWell(
          //                     onTap: () => searchController.removeHistory(index),
          //                     child: Padding(
          //                       padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          //                       child: Icon(Icons.close, color: Theme.of(context).disabledColor, size: 20),
          //                     ),
          //                   )
          //                 ]),
          //                 index != searchController.historyList.length-1 ? Divider() : SizedBox(),
          //               ]);
          //             },
          //           ),
          //           SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
          //
          //           (_isLoggedIn && searchController.suggestedItemList != null) ? Text(
          //             'suggestions'.tr, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),
          //           ) : SizedBox(),
          //           SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
          //           (_isLoggedIn && searchController.suggestedItemList != null) ? searchController.suggestedItemList!.length > 0 ?  GridView.builder(
          //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: ResponsiveHelper.isMobile(context) ? 2 : 4, childAspectRatio: (1/ 0.4),
          //               mainAxisSpacing: Dimensions.PADDING_SIZE_SMALL, crossAxisSpacing: Dimensions.PADDING_SIZE_SMALL,
          //             ),
          //             physics: NeverScrollableScrollPhysics(),
          //             shrinkWrap: true,
          //             itemCount: searchController.suggestedItemList?.length,
          //             itemBuilder: (context, index) {
          //               return InkWell(
          //                 onTap: () {
          //                   Get.find<ItemController>().navigateToItemPage(searchController.suggestedItemList![index], context);
          //                 },
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     color: Theme.of(context).cardColor,
          //                     borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
          //                   ),
          //                   child: Row(children: [
          //                     SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
          //                     ClipRRect(
          //                       borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
          //                       child: CustomImage(
          //                         image: '${Get.find<SplashController>().configModel?.baseUrls!.itemImageUrl}'
          //                             '/${searchController.suggestedItemList?[index].image}',
          //                         width: 45, height: 45, fit: BoxFit.cover,
          //                       ),
          //                     ),
          //                     SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
          //                     Expanded(child: Text(
          //                       searchController.suggestedItemList![index].name!,
          //                       style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
          //                       maxLines: 2, overflow: TextOverflow.ellipsis,
          //                     )),
          //                   ]),
          //                 ),
          //               );
          //             },
          //           ) : Padding(padding: EdgeInsets.only(top: 10), child: Text('no_suggestions_available'.tr)) : SizedBox(),
          //         ])),
          //       ),
          //     ) : SearchResultWidget(searchText: _searchController.text.trim())),
          //
          //   ]);
          // }),
        )),
      ),
    );
  }

  // void _actionSearch(bool isSubmit, String queryText, bool fromHome) {
  //   if(Get.find<SearchController1>().isSearchMode || isSubmit) {
  //     if(queryText.isNotEmpty) {
  //       Get.find<SearchController1>().searchData(queryText, fromHome);
  //     }else {
  //       showCustomSnackBar(Get.find<SplashController>().configModel!.moduleConfig!.module!.showRestaurantText!
  //           ? 'search_food_or_restaurant'.tr : 'search_item_or_store'.tr);
  //     }
  //   }else {
  //     List<int> _prices = [];
  //     if(!Get.find<SearchController1>().isStore) {
  //       Get.find<SearchController1>().allItemList!.forEach((product) => _prices.add(product.price));
  //       _prices.sort();
  //     }
  //     double _maxValue = _prices.length > 0 ? _prices[_prices.length-1].toDouble() : 1000;
  //     Get.dialog(FilterWidget(maxValue: _maxValue, isStore: Get.find<SearchController1>().isStore));
  //   }
  // }
}
