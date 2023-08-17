import 'package:get/get.dart';
import 'package:goodhere_user_v2/data/repository/cart_repo.dart';

import '../data/model/response/order_model.dart';

class CartController extends GetxController implements GetxService {
  final CartRepo cartRepo;

  late List<OrderModel> _cartList;
  List<OrderModel> get cartList => _cartList;

  CartController({required this.cartRepo});

  Future<void> getCart() async {
    Response response = await cartRepo.getCart();
    if(response.isOk){
      response.body['data'].forEach((order) {
        OrderModel _item = OrderModel.fromJson(order);
        _cartList.add(_item);
      });
    } else {
      print('ERORRRRRRRRRRRRRRR');
    }
    update();
  }

}
