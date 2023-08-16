import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/color_resources.dart';
import 'item_notification.dart';

class HomeScreent extends StatefulWidget {
  const HomeScreent({Key? key}) : super(key: key);

  @override
  State<HomeScreent> createState() => _HomeScreentState();
}

class _HomeScreentState extends State<HomeScreent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> list = ['Báo hỏng - 12/07/2023 00:12','Bảo trì- 12/07/2023 00:12','Hạn bảo hành - 12/07/2023 00:12'];
  List<String> list2 = ['Khoa điều trị tổng hợp báo hỏng tài sản TS-000023 Thiết bị laser nội mạch',
  'Thông báo danh sách tài sản gần đến hạn bảo trì ngày 31/08/2023',
  'Ngày 31/08/2023 là hạn bảo hành cho tài sản TS-000827 Laser CO2 phẫu thuật siêu xung 40/45W'];
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    Get.find<AuthController>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: GetBuilder<AuthController>
                          (builder: (controller) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/image/waving_hand_icon.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      const Text(
                                        ' Xin chào',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    controller.user.displayName ?? "",
                                    style: TextStyle(
                                        color: ColorResources.getMainColor(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )),
                        ),
                    Container(),
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const Text("data"));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorResources.getMainColor()),
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            child: Lottie.asset(
                                'assets/animationFile/qr_scan_animation.json',
                                fit: BoxFit.contain,
                                height: 48,
                                width: 48),
                          )),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, int index) => FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFE8EAF6)
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ItemNotification(title: list[index],content: list2[index],),
                        )
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const Text("data"),
                                transition: Transition.topLevel,
                                duration: const Duration(milliseconds: 600));
                          },
                          child: FadeInLeft(
                            duration: const Duration(milliseconds: 800),
                            delay: const Duration(milliseconds: 200),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: ColorResources.getPrimaryColor(),
                              ),
                              height: height*0.18,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    SvgPicture.asset('assets/image/inventory_icon.svg'),
                                    const Spacer(),
                                    const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("Kiểm kê",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                    ),
                          ),
                        )),
                    const SizedBox(width: 10,),
                    Flexible(
                        flex: 1,
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 200),
                          child: Container(
                            height: height*0.18,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: ColorResources.getPrimaryColor(),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  const Spacer(),
                                  SvgPicture.asset('assets/image/broken_report_icon.svg'),
                                  const Spacer(),
                                  const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Báo hỏng",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(width: 10,),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){},
                          child: FadeInRight(
                            duration: const Duration(milliseconds: 800),
                            delay: const Duration(milliseconds: 200),
                            child: Container(
                              height: height*0.18,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: ColorResources.getPrimaryColor(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    SvgPicture.asset('assets/image/note_icon.svg'),
                                    const Spacer(),
                                    const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("Ghi chú",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: height*0.05,)
              ],
            ),
          ),
        ));
  }
}
