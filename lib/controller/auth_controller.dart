
import 'package:get/get.dart';

import '../data/api/api_checker.dart';
import '../data/model/body/user.dart';
import '../data/model/response/token_resposive.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo repo;

  AuthController({required this.repo});

  bool _loading = false;
  bool _isLogin = false;
  User _user = User();

  bool get loading => _loading;

  User get user => _user;

  Future<int> login(String username, String password) async {
    _loading = true;
    update();
    Response response =
        await repo.login(username: username, password: password);
    if (response.statusCode == 200) {
      TokenResponsive tokeBody = TokenResponsive.fromJson(response.body);
      repo.saveUserToken(tokeBody.accessToken!);
      _isLogin = true;
    }
    else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return response.statusCode!;
  }
  Future<int> logOut() async {
    _loading = true;
    Response response = await repo.logOut();
    if(response.statusCode == 200){
      repo.clearUserToken();
      _isLogin = true;
    }
    else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return response.statusCode!;
  }
  Future<int> getUser() async {
    Response response = await repo.getCurrentUser();
    if(response.statusCode == 200){
      _user = User.fromJson(response.body);
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    return response.statusCode!;
  }

  Future<int> checkToken() async {
    Response response = await repo.checkToken();
    return response.statusCode!;
  }

  void clearData() {
    _loading = false;
    _user = User();
  }

  isLoggedIn() {
    return _isLogin;
  }
}
