import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class CartRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  CartRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getCart() {
    return apiClient.getData(AppConstants.GET_CART);
  }

  // List<CartModel> getCartList() {
  //   List<String>? carts = [];
  //   if(sharedPreferences.containsKey(AppConstants.CART_LIST)) {
  //     carts = sharedPreferences.getStringList(AppConstants.CART_LIST);
  //   }
  //   List<CartModel> cartList = [];
  //   carts!.forEach((cart) => cartList.add(CartModel.fromJson(jsonDecode(cart))) );
  //   return cartList;
  // }
  //
  // void addToCartList(List<CartModel> cartProductList) {
  //   List<String> carts = [];
  //   cartProductList.forEach((cartModel) => carts.add(jsonEncode(cartModel)) );
  //   sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
  // }

}