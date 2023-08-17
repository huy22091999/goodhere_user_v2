import 'package:get/get.dart';

import '../data/model/response/order_model.dart';
import '../data/model/response/order_product_model.dart';
import '../data/repository/order_repo.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});

  bool _isLoading = false;
  late List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;


  Future<void> getAllOrders() async {
    _isLoading = true;
    update();
    Response response = await orderRepo.getAllOrder();
    if (response.statusCode == 200) {
      _orderList = [];
      response.body['data'].forEach((order) {
        OrderModel orderModel = OrderModel.fromJson(order);
        _orderList.add(orderModel);
      });
    } else {
      print('ERORRRRRRRRRRRRRRR');
    }
    _isLoading = false;
    update();
  }
}