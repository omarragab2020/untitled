import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../utils/my_string.dart';
import '../../../controllers/setting_controller.dart';
import '../../widgets/language_widget.dart';
import '../../widgets/my_account/my_account_widget.dart';
import '../../widgets/my_account/text_feild.dart';
import '../../widgets/setting/logout_widget.dart';
import '../../widgets/setting/select_lang.dart';
import '../../widgets/setting/setting_widget.dart';
import '../../widgets/text_utils.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool lights = false;
  bool lights2 = false;
  bool lights3 = false;
  bool lights4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'Settings'.tr,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'GENERAL'.tr,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  LanguageWidget(),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'SEARCH'.tr,
              //           style:
              //               const TextStyle(color: Colors.grey, fontSize: 16),
              //         ),
              //         SizedBox(height: 10),
              //         Text(
              //           'Predictive search'.tr,
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 16),
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           'Show product suggestions as you type'.tr,
              //           style: TextStyle(color: Colors.grey, fontSize: 16),
              //         ),
              //       ],
              //     ),
              //     const Spacer(),
              //     Switch(
              //       value: lights!,
              //       activeColor: Colors.redAccent,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           lights = value!;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              // const Divider(thickness: 1),
              // SizedBox(height: 10),
              // Text(
              //   'Clear search history'.tr,
              //   style: TextStyle(
              //       color: mainColor,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20),
              // ),
              // SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'SERVICE'.tr,
              //             style:
              //                 const TextStyle(color: Colors.grey, fontSize: 16),
              //           ),
              //           SizedBox(height: 10),
              //           Text(
              //             'Nearby places'.tr,
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 16),
              //           ),
              //           SizedBox(height: 10),
              //           Text(
              //             'Notify visiting places where shop is available'.tr,
              //             style: TextStyle(color: Colors.grey, fontSize: 16),
              //           ),
              //         ],
              //       ),
              //     ),
              //     const Spacer(),
              //     Switch(
              //       value: lights2!,
              //       activeColor: Colors.redAccent,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           lights2 = value!;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              // const Divider(thickness: 1),
              // SizedBox(height: 20),
              // Column(
              //   children: [
              //     Row(
              //       // mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'SUBSTITUTION'.tr,
              //               style: TextStyle(color: Colors.grey, fontSize: 16),
              //             ),
              //             SizedBox(height: 10),
              //             Text(
              //               'Default Substitution'.tr,
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 16),
              //             ),
              //             SizedBox(height: 10),
              //             Text(
              //               'Automatically substitute products'.tr,
              //               style: TextStyle(color: Colors.grey, fontSize: 16),
              //             ),
              //           ],
              //         ),
              //         const Spacer(),
              //         Switch(
              //           value: lights3!,
              //           activeColor: Colors.redAccent,
              //           onChanged: (bool? value) {
              //             setState(() {
              //               lights3 = value!;
              //             });
              //           },
              //         ),
              //       ],
              //     ),
              //     const Divider(thickness: 1),
              //   ],
              // ),
              // SizedBox(height: 20),
              // Column(
              //   children: [
              //     Row(
              //       // mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Preferred Substitution'.tr,
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 16),
              //             ),
              //             SizedBox(height: 10),
              //             Text(
              //               'Automatically substitute products'.tr,
              //               style: TextStyle(color: Colors.grey, fontSize: 16),
              //             ),
              //           ],
              //         ),
              //         const Spacer(),
              //         Switch(
              //           value: lights4!,
              //           activeColor: Colors.redAccent,
              //           onChanged: (bool? value) {
              //             setState(() {
              //               lights4 = value!;
              //             });
              //           },
              //         ),
              //       ],
              //     ),
              //     const Divider(thickness: 1),
              //   ],
              // ),
              SizedBox(height: 20),
              Text(
                'Delete account'.tr,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                  'For security reasons we will need you to provide us your email address in order for us to be able to initiate the deletion of your account'
                      .tr),
              SizedBox(height: 20),

              LogOutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
