import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/screen/dashboard/dashboard_screen.dart';
import '../../controller/auth_controller.dart';
import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../../view/base/custom_text_field.dart';
import '../../view/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    // auth.setSettings(
    //     appVerificationDisabledForTesting: true,
    //     phoneNumber: "0949392616",
    //     smsCode: "123456",
    //     forceRecaptchaFlow: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Scrollbar(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                  ),
                  GetBuilder<AuthController>(
                    builder: (controller) => Opacity(
                      opacity: controller.loading ? 0.3 : 1,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeInUp(
                              duration: const Duration(milliseconds: 1000),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(100, 0, 100, 0),
                                color: Colors.white,
                                child:  Image.asset(Images.logo, width: 200),
                              ),
                            ),
                            const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            FadeInUp(
                              duration: 1.seconds,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: Column(
                                  children: [
                                    Text(
                                        'sign_in'.tr.toUpperCase(),
                                        style: robotoBlack.copyWith(fontSize: 30)
                                    ),
                                    const SizedBox(height: 50),
                                    Container(
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
                                      child: Column(children: [
                                        Row(children: [
                                          Expanded(
                                              flex: 1,
                                              child: CustomTextField(
                                                hintText: 'email'.tr,
                                                controller: _usernameController,
                                                focusNode: _usernameFocusNode,
                                                // nextFocus: _passwordFocus,
                                                inputType: TextInputType.emailAddress,
                                                divider: false,
                                                prefixIcon: Images.user, onChanged: () {  },
                                              )),
                                        ]),
                                      ]),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
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
                                      child: Column(children: [
                                        Row(children: [
                                          Expanded(
                                              flex: 1,
                                              child: CustomTextField(
                                                hintText: 'password'.tr,
                                                isPassword: true,
                                                controller: _passwordController,
                                                focusNode: _passwordFocusNode,
                                                // nextFocus: _passwordFocus,
                                                inputType: TextInputType.text,
                                                divider: false,
                                                prefixIcon: Images.lock, onChanged: () {  },
                                              )),
                                        ]),
                                      ]),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(children: [
                                      Expanded(
                                        child: ListTile(
                                          // onTap: () => controller.toggleRememberMe(),
                                          leading: Checkbox(
                                            activeColor: Theme.of(context).primaryColor,
                                            value: true,
                                            onChanged: (bool? isChecked) =>
                                            (){},
                                          ),
                                          title: Text('remember_me'.tr),
                                          contentPadding: EdgeInsets.zero,
                                          dense: true,
                                          horizontalTitleGap: 0,
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
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
                                    Row(children: [
                                      Expanded(
                                          child: CustomButton(
                                            buttonText: 'sign_up'.tr,
                                            transparent: true,
                                            onPressed: () =>
                                                Get.toNamed(RouteHelper.getSignUpRoute()),
                                          )),
                                      Expanded(
                                          child: CustomButton(
                                            buttonText: "login".tr,
                                            onPressed : (){_login();},
                                          )),
                                    ]),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                    ],
                  ),
                )
            ),
            Center(child: GetBuilder<AuthController>(
              builder: (controller) {
                return Visibility(
                  visible: controller.loading,
                  child: const CircularProgressIndicator(),
                );
              },
            ))
          ],
        ));
  }

  _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    FocusManager.instance.primaryFocus?.unfocus();
    if (username.isEmpty || password.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Bạn cần điền đầy đủ tài khoản mật khẩu.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Get.find<AuthController>().login(username, password).then((value) => {
            if (value == 200)
              {Get.off(() => DashboardScreen(pageIndex: 0),transition: Transition.size,duration: const Duration(milliseconds: 500),curve: Curves.easeIn)}
            else if (value == 400)
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Tài khoản mật khẩu không chính xác")))
              }
            else
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Đã xảy ra lỗi xin vui lòng thử lại")))
              }
          });
      // .then((value) => {

      // })
    }
  }
}
