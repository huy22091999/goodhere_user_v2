import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/view/base/zopay/roundedButton.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';
import 'custom_ink_well.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function? onTap;
  final bool isSkip;
  final Function? function;

  const CustomAppbar(
      {required this.title, this.onTap, this.isSkip = false, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResources.getPrimaryColor(),
      child: SafeArea(
        child: Container(
          color: ColorResources.getPrimaryColor(),
          padding:  EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomInkWell(
                  onTap: onTap == null
                      ? () {
                          Get.back();
                        }
                      : onTap!(),
                  radius: Dimensions.RADIUS_SIZE_SMALL,
                  child: Container(
                    height: 40,
                    width: 40,
                    // padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorResources.INNER_BORDER_COLOR, width: 0.5),
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_SIZE_SMALL),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: Dimensions.ARROW_ICON_SIZE,
                        color: ColorResources.COLOR_WHITE,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                Text(
                  title,
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                      color: Colors.white),
                ),
                isSkip ? Spacer() : SizedBox(),
                isSkip
                    ? SizedBox(
                        child: RoundedButton(
                        buttonText: 'skip'.tr,
                        onTap: function!,
                        isSkip: true,
                      ))
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size(double.maxFinite, Dimensions.APPBAR_HIGHT_SIZE);
}
