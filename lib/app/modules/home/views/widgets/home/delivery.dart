import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../text_utils.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_left),
            const Spacer(),
            Column(
              children: [
                Column(
                  children: [
                    Text(': عرض المتاجر التي تقوم بالتوصيل إلي'.tr),
                    const Text(
                      'Omar Street 23',
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
            const Icon(Icons.location_on_outlined)
          ],
        ),
      ),
    );
  }
}
