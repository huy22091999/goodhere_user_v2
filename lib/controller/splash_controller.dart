import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/response/module_model.dart';
import '../data/model/response/product_model.dart';
import '../data/repository/splash_repo.dart';
import '../helper/responsive_helper.dart';
import '../helper/route_helper.dart';
import '../view/base/item_bottom_sheet.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo repo;

  SplashController({required this.repo});

  bool _hasConnection = true;

  bool get hasConnection => _hasConnection;

  String _version = "";

  final List<ModuleModel> _moduleList = [
    ModuleModel(
        moduleName: "TIỆM GIẶT (SẤY, ỦI, HẤP)",
        icon:
            "https://goodhere.vn/storage/app/public/module/2022-07-20-62d780072ae0e.png",
        id: 0),
    ModuleModel(
        moduleName: "ĐẠI LÝ GẦN BẠN",
        icon:
            "https://goodhere.vn/storage/app/public/module/2022-11-03-63630dd534561.png",
        id: 1),
    ModuleModel(
        moduleName: "SETUP TIỆM GIẶT",
        icon:
            "https://goodhere.vn/storage/app/public/module/2022-07-22-62db0b5bd2a5f.png",
        id: 2)
  ];

  late int _chooseModuleIndex;
  int get chooseModuleIndex => _chooseModuleIndex;

  ModuleModel? _currentModule;

  ModuleModel? get currentModule => _currentModule;

  List<ModuleModel> get moduleList => _moduleList;

  String get version => _version;

  setModule(int index) {
    if (index < 0) {
      _currentModule = null;
    } else {
      _chooseModuleIndex = index;
      _currentModule = moduleList[index];
    }
    update();
  }

  Future<bool> isUpdateVersion() async {
    // Response response = await repo.getConfig();
    // if (response.statusCode == 200) {
    //   ConfigResponse _data = ConfigResponse.fromJson(response.body);
    //   return _data.versionName == AppConstants.APP_VERSION;
    // } else {
    //   return false;
    // }
    return true;
  }

  void navigateToItemPage(ProductModel item, BuildContext context) {
    if(_chooseModuleIndex == 0) {
      ResponsiveHelper.isMobile(context)
          ?
      Get.bottomSheet(
        ItemBottomSheet(item: item),
        backgroundColor: Colors.transparent, isScrollControlled: true,
      )
          :
      Get.dialog(Dialog(child: ItemBottomSheet(item: item)),);
    }else {
      print('Show ItemDetails Screen');
      //Get.toNamed(RouteHelper.getItemDetailsRoute(item.id!, inStore), arguments: ItemDetailsScreen(item: item, inStorePage: inStore));
    }
  }
}
