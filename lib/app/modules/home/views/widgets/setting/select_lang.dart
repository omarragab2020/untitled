import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/modules/home/controllers/setting_controller.dart';

Widget SelectLanguage({
  String? txt1,
  String? txt2,
  Widget? widget,
}) {
  return Column(
    children: [
      Row(
        children: [
          Icon(Icons.arrow_back),
          const Spacer(),
          Column(
            children: [
              Text(txt1!),
              Text(
                txt2!,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      const Divider(thickness: 1),
    ],
  );
}

Widget ChangeLanguage() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SizedBox(
      height: Get.height * .4,
      child: GetBuilder<SettingController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'اختيار اللغة',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const Divider(thickness: 1),
            const Text('عربي'),
            const Divider(thickness: 1),
            InkWell(onTap: () {}, child: const Text('English')),
            const Divider(thickness: 1),
            const Text('Pyccknn'),
            const Divider(thickness: 1),
            const Text('Ehhnvika'),
            const Divider(thickness: 1),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(25)),
              width: Get.width,
              height: 40,
              child: const Center(
                child: Text(
                  'َإغلاق',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        );
      }),
    ),
  );
}
