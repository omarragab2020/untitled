import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/modules/home/views/screens/my_order/talabat_list.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';

import '../../../../../routes/app_pages.dart';
import 'clean.dart';

class TalabatScreen extends StatelessWidget {
  const TalabatScreen({Key? key}) : super(key: key);

  @override
  TabBar get _tabBar => TabBar(
        tabs: [
          Tab(
              icon: Text('Order'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.black))),
          Tab(
              icon: Text('Archived Scheduled'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.black))),
          // Tab(
          //     icon: Text(
          //   'House Cleaning'.tr,
          //   style: TextStyle(fontSize: 18, color: Colors.black),
          // )),
        ],
      );
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'My Orders'.tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 100, color: mainColor),
                  Text(
                    'You havent made any order yet'.tr,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 15),
                  Text('Every grocery order you make will be added here'.tr,
                      style: TextStyle(fontSize: 18, color: Colors.black38)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_balance, size: 100, color: mainColor),
                  Text(
                    'Hmmm....!'.tr,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                      'There are no scheduled orders to be generated. you can check the Instant tab.'
                          .tr,
                      style: TextStyle(fontSize: 18, color: Colors.black38)),
                ],
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.account_balance, size: 100, color: mainColor),
              //     Text(
              //       'Hmmm....!'.tr,
              //       style: TextStyle(fontSize: 20, color: Colors.black),
              //     ),
              //     SizedBox(height: 20),
              //     Text(
              //         'You hav not set a cleaning services yet. How about setting one right now?'
              //             .tr,
              //         style: TextStyle(fontSize: 18, color: Colors.black38)),
              //     InkWell(
              //       onTap: () {
              //         Get.to(CleanHome());
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.all(16.0),
              //         child: Container(
              //           decoration: BoxDecoration(
              //               border: Border.all(color: Colors.grey, width: 2),
              //               borderRadius: BorderRadius.circular(25)),
              //           height: 50,
              //           width: Get.width - 100,
              //           child: Center(
              //             child: Text(
              //               'Setup cleaning service'.tr,
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20,
              //                   color: Colors.black),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
