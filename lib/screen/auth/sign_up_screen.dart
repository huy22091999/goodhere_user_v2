import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/controller/auth_controller.dart';
import 'package:animate_do/animate_do.dart';

import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../../view/base/custom_text_field.dart';
import '../../view/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _emailNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _referCodeFocus = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              GetBuilder<AuthController>(builder: (controller) => Opacity(
                  opacity: controller.loading ? 0.3 : 1,
                child: FadeInUp(
                  duration: 1.seconds,
                  child: Column(
                    children: [
                      Container(
                        padding:
                        const EdgeInsets.fromLTRB(100, 0, 100, 0),
                        color: Colors.white,
                        child:  Image.asset(Images.logo, width: 200),
                      ),
                      const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Text(
                          'sign_up'.tr.toUpperCase(),
                          style: robotoBlack.copyWith(fontSize: 30)
                      ),
                      const SizedBox(height: 50),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_SMALL),
                          color: Theme.of(context).cardColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                        ),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'first_name'.tr,
                              controller: _firstNameController,
                              focusNode: _firstNameFocus,
                              nextFocus: _emailNameFocus,
                              inputType: TextInputType.name,
                              capitalization: TextCapitalization.words,
                              prefixIcon: Images.user,
                              divider: true, onChanged: () {  },
                            ),
                            CustomTextField(
                              hintText: 'email'.tr,
                              controller: _emailController,
                              focusNode: _emailNameFocus,
                              nextFocus: _passwordFocus,
                              inputType: TextInputType.emailAddress,
                              prefixIcon: Images.user,
                              divider: true, onChanged: () {  },
                            ),
                            CustomTextField(
                              hintText: 'password'.tr,
                              controller: _passwordController,
                              focusNode: _passwordFocus,
                              nextFocus: _referCodeFocus,
                              inputType: TextInputType.text,
                              isPassword: true,
                              prefixIcon: Images.lock,
                              divider: true, onChanged: () {  },
                            ),
                            CustomTextField(
                              hintText: 'refer_code'.tr,
                              controller: _referCodeController,
                              focusNode: _referCodeFocus,
                              inputType: TextInputType.text,
                              prefixIcon: Images.refer_code,
                              divider: false, onChanged: () {  },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Row(children: [
                        Checkbox(
                          activeColor: Theme.of(context).primaryColor,
                          value: true,
                          onChanged: (bool? isChecked) => (){},
                        ),
                        Text('i_agree_with'.tr, style: robotoRegular),
                        InkWell(
                          onTap: () => Get.toNamed(RouteHelper.getHtmlRoute('terms-and-condition')),
                          child: Padding(
                            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: Text('terms_conditions'.tr, style: robotoMedium.copyWith(color: Colors.blue)),
                          ),
                        ),
                      ]),
                      const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(children: [
                          Expanded(
                              child: CustomButton(
                                buttonText: 'sign_in'.tr,
                                transparent: true,
                                onPressed: () => Get.toNamed(
                                    RouteHelper.getSignInRoute()),
                              )),
                          Expanded(
                              child: CustomButton(
                                buttonText: "sign_up".tr,
                                onPressed:(){},
                              )),
                        ]),
                      ),
                      const SizedBox(height: 20,),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(1, 40),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, RouteHelper.getInitialRoute());
                        },
                        child: RichText(text: TextSpan(children: [
                          TextSpan(text: '${'continue_as'.tr} ', style: robotoRegular.copyWith(color: Theme.of(context).disabledColor)),
                          TextSpan(text: 'guest'.tr, style: robotoMedium.copyWith(color: Theme.of(context).textTheme.bodyText1!.color)),
                        ])),
                      ),
                    ],
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
