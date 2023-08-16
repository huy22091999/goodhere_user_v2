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
        body: Column(
          children: [
            Text("data")
          ],
        )
    );
  }
}
