import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/modules/home/controllers/setting_controller.dart';
import 'package:untitled/app/modules/home/views/screens/account_scceen/last_order.dart';
import 'package:untitled/app/modules/home/views/screens/account_scceen/pesronal_details.dart';
import 'package:untitled/app/modules/home/views/screens/account_scceen/loyality_point.dart';
import 'package:untitled/app/modules/home/views/screens/account_scceen/settings.dart';

import '../../../../../../utils/my_string.dart';
import '../../../../../routes/app_pages.dart';
import '../../widgets/my_account/my_account_widget.dart';
import '../../widgets/text_utils.dart';
import '../auth/login_screen.dart';
import 'wallet.dart';
import 'location_delivery.dart';
import 'my_evaluation.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'My account'.tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BuildMyAccount(
                  text1: 'Personal Details'.tr,
                  text2: 'name , phone number'.tr,
                  // icon1: Icons.arrow_forward_ios_rounded,
                  icon2: Icons.person,
                  onTap: () {
                    Get.to(() => PersonalDetailsScreen());
                  },
                ),
                BuildMyAccount(
                  text1: 'Delivery addresses'.tr,
                  text2: 'addition and remove titles'.tr,
                  // icon1: Icons.arrow_left,
                  icon2: Icons.location_on_outlined,
                  onTap: () {
                    Get.to(() => LocationDelivery());
                  },
                ),
                BuildMyAccount(
                  text1: 'Wallet'.tr,
                  text2: 'Manage shop points'.tr,
                  // icon1: Icons.arrow_left,
                  icon2: Icons.person,
                  onTap: () {
                    Get.to(() => WalletScreen());
                  },
                ),
                BuildMyAccount(
                  text1: 'Loyalty points'.tr,
                  text2: 'Add and delete loyalty cards'.tr,
                  // icon1: Icons.arrow_left,
                  icon2: Icons.person,
                  onTap: () {
                    Get.to(() => LoyaltyPoint());
                  },
                ),
                BuildMyAccount(
                  text1: 'Last Order'.tr,
                  text2: 'All the reviews you have made'.tr,
                  // icon1: Icons.arrow_left,
                  icon2: Icons.star,
                  onTap: () {
                    Get.to(() => LastOrder());
                  },
                ),
                BuildMyAccount(
                  text1: 'Settings'.tr,
                  text2: 'Languages, and log out'.tr,
                  // icon1: Icons.arrow_left,
                  icon2: Icons.settings,
                  onTap: () {
                    Get.to(() => SettingScreen());
                  },
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: mainColor, fontSize: 18),
                    ))
              ],
            ),
          ),
        ));
  }
}
