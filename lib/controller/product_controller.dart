import 'package:goodhere_user_v2/data/model/response/product_model.dart';
import 'package:goodhere_user_v2/data/repository/product_repo.dart';
import 'package:get/get.dart';
class ProductController extends GetxController implements GetxService {
  final ProductRepo productRepo;

  ProductController({required this.productRepo});
  bool _isLoading = false;
  late List<ProductModel> _productList = [];
  List<ProductModel> get orderList => _productList;

  Future<bool> getProducts({required int pageSize, required int pageIndex}) async {
    _isLoading = true;
    update();
    Response response = await productRepo.getAllProduct(pageIndex: pageIndex, pageSize: pageSize);
    if (response.statusCode == 200) {
      _productList = [];
      response.body['data'].forEach((order) {
        ProductModel product = ProductModel.fromJson(order);
        _productList.add(product);
      });
      return true;
    } else {
      print('ERORRRRRRRRRRRRRRR');
      return false;
    }
    _isLoading = false;
    update();
  }
}