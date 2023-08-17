import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class OrderRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrderRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getAllOrder() {
    return apiClient.getData(AppConstants.GET_CART);
  }

}