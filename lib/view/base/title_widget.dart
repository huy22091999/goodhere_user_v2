
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import '../../helper/responsive_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  TitleWidget({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title!,
          style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
      (onTap != null && !ResponsiveHelper.isDesktop(context))
          ? InkWell(
              onTap: onTap!,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                child: Text(
                  'view_all'.tr,
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeSmall,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            )
          : const SizedBox(),
    ]);
  }
}
