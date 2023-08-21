import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../controller/location_controller.dart';
import '../../data/model/response/address_model.dart';
import '../../helper/responsive_helper.dart';
import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../../view/base/custom_app_bar.dart';
import '../../view/base/custom_button.dart';
import '../../view/base/custom_loader.dart';
import '../../view/base/footer_view.dart';
import '../../view/base/menu_drawer.dart';
import '../../view/base/no_data_screen.dart';

class AccessLocationScreen extends StatefulWidget {
  final bool fromSignUp;
  final bool fromHome;
  final String route;

  AccessLocationScreen(
      {required this.fromSignUp,
      required this.fromHome,
      required this.route});

  @override
  State<AccessLocationScreen> createState() => _AccessLocationScreenState();
}

class _AccessLocationScreenState extends State<AccessLocationScreen> {
  final bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();

  @override
  void initState() {
    super.initState();
    // if (!widget.fromHome &&
    //     Get.find<LocationController>().getUserAddress() != null) {
    //   Future.delayed(Duration(milliseconds: 500), () {
    //     Get.dialog(CustomLoader(), barrierDismissible: false);
    //     Get.find<LocationController>().autoNavigate(
    //       Get.find<LocationController>().getUserAddress()!,
    //       widget.fromSignUp,
    //       widget.route,
    //       widget.route != null,
    //       ResponsiveHelper.isDesktop(context),
    //     );
    //   });
    // }
    // if (_isLoggedIn) {
    //   Get.find<LocationController>().getAddressList();
    // }
    // if (Get.find<SplashController>().configModel?.module == null &&
    //     Get.find<SplashController>().moduleList == null) {
    //   Get.find<SplashController>().getModules();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: 'set_location'.tr, backButton: widget.fromHome),
      endDrawer: MenuDrawer(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: GetBuilder<LocationController>(builder: (locationController) {
          return
            _isLoggedIn
                  ? Column(children: [
                      Expanded(
                          child: SingleChildScrollView(
                        child: FooterView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              locationController.addressList != null
                                  ? locationController.addressList!.length > 0
                                      ? ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: locationController
                                              .addressList!.length,
                                          itemBuilder: (context, index) {
                                            return Text("data");
                                              // Center(
                                              //   child: SizedBox(
                                              //       width: 700,
                                              //       child: AddressWidget(
                                              //         address:
                                              //             locationController
                                              //                     .addressList![
                                              //                 index],
                                              //         fromAddress: false,
                                              //         onTap: () {
                                              //           Get.dialog(
                                              //               CustomLoader(),
                                              //               barrierDismissible:
                                              //                   false);
                                              //           AddressModel _address =
                                              //               locationController
                                              //                       .addressList![
                                              //                   index];
                                              //           locationController
                                              //               .saveAddressAndNavigate(
                                              //             _address,
                                              //             widget.fromSignUp,
                                              //             widget.route,
                                              //             widget.route != null,
                                              //             ResponsiveHelper
                                              //                 .isDesktop(
                                              //                     context),
                                              //           );
                                              //         }, onRemovePressed: () {  }, onEditPressed: () {  },
                                              //       )));
                                          },
                                        )
                                      : NoDataScreen(
                                          text: 'no_saved_address_found'.tr)
                                  : Center(child: CircularProgressIndicator()),
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                              ResponsiveHelper.isDesktop(context)
                                  ? BottomButton(
                                      locationController: locationController,
                                      fromSignUp: widget.fromSignUp,
                                      route: widget.route)
                                  : SizedBox(),
                            ])),
                      )),
                      ResponsiveHelper.isDesktop(context)
                          ? SizedBox()
                          : BottomButton(
                              locationController: locationController,
                              fromSignUp: widget.fromSignUp,
                              route: widget.route),
                    ])
                  : Center(
                      child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: FooterView(
                          child: SizedBox(
                              width: 700,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(Images.delivery_location,
                                        height: 220),
                                    SizedBox(
                                        height: Dimensions.PADDING_SIZE_LARGE),
                                    Text(
                                        'find_stores_and_items'
                                            .tr
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: robotoMedium.copyWith(
                                            fontSize:
                                                Dimensions.fontSizeExtraLarge)),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          Dimensions.PADDING_SIZE_LARGE),
                                      child: Text(
                                        'by_allowing_location_access'.tr,
                                        textAlign: TextAlign.center,
                                        style: robotoRegular.copyWith(
                                            fontSize: Dimensions.fontSizeSmall,
                                            color: Theme.of(context)
                                                .disabledColor),
                                      ),
                                    ),
                                    SizedBox(
                                        height: Dimensions.PADDING_SIZE_LARGE),
                                    BottomButton(
                                        locationController: locationController,
                                        fromSignUp: widget.fromSignUp,
                                        route: widget.route),
                                  ]))),
                    ));
        }),
      )),
    );
  }
}

class BottomButton extends StatelessWidget {
  final LocationController locationController;
  final bool fromSignUp;
  final String? route;




  BottomButton(
      {required this.locationController,
      required this.fromSignUp,
      required this.route});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 700,
            child: Column(children: [
              CustomButton(
                buttonText: 'user_current_location'.tr,
                onPressed: () async {
                  // String _color = '0xFFAA6843';
                  // String _color1 = '0xFFc7794c';
                  // Get.find<ThemeController>().changeTheme(Color(int.parse(_color)), Color(int.parse(_color1)));
                  Get.find<LocationController>().checkPermission(() async {
                    Get.dialog(CustomLoader(), barrierDismissible: false);
                    //
                    // AddressModel _address = await Get.find<LocationController>()
                    //     .getCurrentLocation(true);
                    // ZoneResponseModel _response = await locationController
                    //     .getZone(_address.latitude!, _address.longitude!, false);

                    // if (_response.isSuccess!) {
                    //   locationController.saveAddressAndNavigate(
                    //     _address,
                    //     fromSignUp,
                    //     route,
                    //     route != null,
                    //     ResponsiveHelper.isDesktop(context),
                    //   );
                    // } else {
                    //   Get.back();
                    //   Get.toNamed(RouteHelper.getPickMapRoute(
                    //       route == null ? RouteHelper.accessLocation : route!,
                    //       route != null)
                    //   );
                    //   showCustomSnackBar(
                    //       'service_not_available_in_current_location'.tr);
                    // }
                    // locationController.saveAddressAndNavigate(
                    //   AddressModel(additionalAddress: "",address: "Hà nội", addressType: "Home",latitude: "52675785",longitude: "5736874859",zoneId: 7, zoneIds: [1,6]),
                    //   fromSignUp,
                    //   route,
                    //   route != null,
                    //   ResponsiveHelper.isDesktop(context),
                    // );
                    final newLocalData = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.low);
                    Get.lazyPut(() => newLocalData);
                  });
                },
                icon: Icons.my_location,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 2, color: Theme.of(context).primaryColor),
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_SMALL),
                  ),
                  minimumSize: Size(Dimensions.WEB_MAX_WIDTH, 50),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Get.toNamed(RouteHelper.getPickMapRoute(
                  route == null
                      ? fromSignUp
                          ? RouteHelper.signUp
                          : RouteHelper.accessLocation
                      : route!,
                  route != null,
                )),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    child:
                        Icon(Icons.map, color: Theme.of(context).primaryColor),
                  ),
                  Text('set_from_map'.tr,
                      textAlign: TextAlign.center,
                      style: robotoBold.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: Dimensions.fontSizeLarge,
                      )),
                ]),
              ),
            ])));
  }
}
