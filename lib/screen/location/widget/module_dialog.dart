import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../../controller/splash_controller.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';
import '../../../view/base/custom_image.dart';

class ModuleDialog extends StatelessWidget {
  final Function callback;
  ModuleDialog({required this.callback});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
      insetPadding: EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: PointerInterceptor(child: SingleChildScrollView(child: Container(
        width: 700,
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        color: Theme.of(context).primaryColor.withAlpha(20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Text('select_the_type_of_stores_for_your_order'.tr, style: robotoMedium.copyWith(fontSize: 24)),
          ),

          GetBuilder<SplashController>(builder: (splashController) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                color: Theme.of(context).cardColor,
              ),
              child: splashController.moduleList != null ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: (1/1),
                  mainAxisSpacing: Dimensions.PADDING_SIZE_LARGE, crossAxisSpacing: Dimensions.PADDING_SIZE_LARGE,
                ),
                itemCount: splashController.moduleList.length,
                shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.find<SplashController>().setModule(index);
                      callback();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        color: Theme.of(context).cardColor,
                        boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300]!, spreadRadius: 1, blurRadius: 5)],
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                        CustomImage(
                          image: '',
                          height: 80, width: 80,
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        Text(
                          splashController.moduleList![index].moduleName!,
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                        ),

                      ]),
                    ),
                  );
                },
              ) : const Center(child: CircularProgressIndicator()),
            );
          }),

        ]),
      ))),
    );
  }
}
