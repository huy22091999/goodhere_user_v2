import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class ProductRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProductRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAllProduct({required int pageIndex, required int pageSize}) {
    return apiClient.getData('${AppConstants.GET_PRODUCTS}?pageIndex=$pageIndex&pageSize=$pageSize');
  }
}