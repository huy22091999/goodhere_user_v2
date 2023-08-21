
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/base/footer_view.dart';

class ItemView extends StatelessWidget {
  final bool isItem;
  ItemView({required this.isItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("item view")
      // GetBuilder<SearchController1>(builder: (searchController) {
      //   return SingleChildScrollView(
      //     child: FooterView(
      //       child: SizedBox(width: Dimensions.WEB_MAX_WIDTH, child: ItemsView(
      //         isStore: isItem, items: searchController.searchItemList, stores: searchController.searchStoreList,
      //       )),
      //     ),
      //   );
      // }),
    );
  }
}
