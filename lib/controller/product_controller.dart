import 'package:flutter/cupertino.dart';
import 'package:goodhere_user_v2/data/model/response/product_model.dart';
import 'package:goodhere_user_v2/data/repository/product_repo.dart';
import 'package:get/get.dart';
class ProductController extends GetxController implements GetxService {
  final ProductRepo productRepo;

  ProductController({required this.productRepo});
  bool _isLoading = false;
  late List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  List<ProductModel> cart = [];

  Map<int,int> variationIndex = {
    0 : 0,
    1 : 0
  };
  Map<int,int> addOnQuantity = {
    0 : 1,
    1 : 1,
    2 : 1,
    3 : 1,
    4 : 1,
    5 : 1,
  };
  int quantity = 1,indexAddon = 0;

  Future<bool> getProducts({required int pageSize, required int pageIndex}) async {
    _isLoading = true;
    update();
    Response response = await productRepo.getAllProduct(pageIndex: pageIndex, pageSize: pageSize);
    if (response.statusCode == 200) {
      _productList = [];
      response.body['data']['content'].forEach((order) {
        ProductModel product = ProductModel.fromJson(order);
        _productList.add(product);
      });
    } else {
      print('ERORRRRRRRRRRRRRRR');
    }
    _isLoading = false;
    update();
    return(response.isOk);
  }

  void setAddonsIndex(int index){
    indexAddon = index;
    update();
  }

  void setCartVariationIndex(int options, int detail){
    variationIndex[options] = detail;
    update();
  }

  void incrementAddOns(int index){
    int value = addOnQuantity[index]!;
    addOnQuantity[index] = value + 1;
    update();
  }

  void decreaseAddOns(int index){
    if(addOnQuantity[index]! > 1) {
      addOnQuantity[index] = addOnQuantity[index]! - 1;
    }
    update();
  }

  void increment(){
    quantity += 1;
    update();
  }

  void decrease(){
    if(quantity > 1) {
      quantity -= 1;
    }
    update();
  }
  void addToCart(ProductModel model){
    cart.add(model);
    update();
  }
  void clearData(){
    variationIndex = {
      0 : 0,
      1 : 0
    };
    quantity = 1;
    addOnQuantity = {
      0 : 1,
      1 : 1,
      2 : 1,
      3 : 1,
      4 : 1,
      5 : 1,
    };
  }
}