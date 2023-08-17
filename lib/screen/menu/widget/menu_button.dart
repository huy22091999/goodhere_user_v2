import 'package:flutter/material.dart';
import 'package:goodhere_user_v2/controller/auth_controller.dart';
import 'package:goodhere_user_v2/data/model/response/menu_model.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';
import 'package:get/get.dart';

import '../../../view/base/custom_image.dart';

class MenuButton extends StatelessWidget {
  final MenuModel model;
  final bool? isWallet;
  const MenuButton({super.key, required this.model, this.isWallet});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: size.height*0.082,
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          margin:
          const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
            color: isWallet != null && isWallet! ? Colors.blue : Colors.green,
          ),
          child: isWallet != null && isWallet!
              ? Image.asset(model.icon!, width: 34)
              : Image.asset(
            model.icon!,
            width: 34,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        Text(model.title!,
            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
            textAlign: TextAlign.center),
      ],
    );
  }
}
