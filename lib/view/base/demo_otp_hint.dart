import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';

class DemoOtpHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
           EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
      child: Text(
        'for_demo_1234'.tr,
        style: robotoMedium.copyWith(
            fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Colors.black54),
      ),
    );
  }
}
