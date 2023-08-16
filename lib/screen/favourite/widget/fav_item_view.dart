
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavItemView extends StatelessWidget {
  final bool isStore;
  final bool isSearch;
  FavItemView({super.key, required this.isStore, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("")
      // GetBuilder<WishListController>(builder: (wishController) {
      //   return RefreshIndicator(
      //     onRefresh: () async {
      //       await wishController.getWishList();
      //     },
      //     child: SingleChildScrollView(
      //       physics: AlwaysScrollableScrollPhysics(),
      //       child: FooterView(
      //         child: Container(
      //           width: Dimensions.WEB_MAX_WIDTH,
      //           child: ItemsView(
      //             isStore: isStore, items: wishController.wishItemList, stores: wishController.wishStoreList,
      //             noDataText: 'no_wish_data_found'.tr,
      //           ),
      //         ),
      //       ),
      //     ),
      //   );
      // }),
    );
  }
}
