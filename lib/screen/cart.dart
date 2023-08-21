import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/controller/product_controller.dart';

import '../utils/images.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductController>(builder: (controller) =>
            ListView.builder(
              itemCount: controller.cart.length,
            shrinkWrap: true,
            itemBuilder: (context,index) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: 70,
                      height: 70,
                      child: Image.asset(Images.placeholder,fit: BoxFit.cover,)
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.cart[index].name ?? '-'),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(text: choiceOptions[controller.cart[index].options!.keys.first] ?? '-'),
                          const TextSpan(text: " "),
                          TextSpan(text: optionsDetail[controller.cart[index].options!.keys.first][controller.cart[index].options![controller.cart[index].options!.keys.first] ?? 0] ?? '-'),
                        ],
                            style: const TextStyle(color: Colors.black)
                      )),
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(text: choiceOptions[controller.cart[index].options!.keys.last] ?? '-'),
                                const TextSpan(text: " "),
                                TextSpan(text: optionsDetail[controller.cart[index].options!.keys.last][controller.cart[index].options![controller.cart[index].options!.keys.last] ?? 0] ?? '-'),
                              ],
                              style: const TextStyle(color: Colors.black)
                          ))
                    ],
                  )
                ],
              );
            }
        ),)
      ),
    );
  }
  List<String> choiceOptions = ['Sấy', 'Ủi'];
  List<List<String>> optionsDetail = [['Khô','Thơm'],['Không','Có']];
  int quantity = 1;
  List<Map<String,String>> addOns = [
    {'title': 'Dịu nhẹ', 'price':'10.000 đ'},
    {'title': 'Hoa nhiệt đới', 'price':'11.000 đ'},
    {'title': 'Anh đào', 'price':'10.000 đ'},
    {'title': 'Roman', 'price':'13.000 đ'},
    {'title': 'Gió biển', 'price':'10.000 đ'},
  ];
}
