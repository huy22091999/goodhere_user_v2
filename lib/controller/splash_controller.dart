import 'package:get/get.dart';

import '../data/model/response/module_model.dart';
import '../data/repository/splash_repo.dart';

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

  ModuleModel? _currentModule;

  ModuleModel? get currentModule => _currentModule;

  List<ModuleModel> get moduleList => _moduleList;

  String get version => _version;

  setModule(int index) {
    _currentModule = moduleList[index];
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
}
