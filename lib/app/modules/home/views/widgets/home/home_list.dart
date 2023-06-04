import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/models/product_model.dart';
import 'package:untitled/app/modules/home/controllers/main_controller.dart';

import '../text_utils.dart';

class HomeListFilter extends GetView<MainController> {
  HomeListFilter({Key? key}) : super(key: key);

  final List<String> homeList = [
    'الكل',
    'الأقل تقييم',
    'الأعلي تقييم',
    'الأقرب',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Obx(() {
                return GestureDetector(
                    onTap: () {
                      controller.currentTypeSelected = index;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[100]),
                      child: Text(
                        homeList[index],
                        style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: controller.currentTypeSelected == index
                                ? mainColor
                                : Colors.black),
                      ),
                    ));
              });
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: homeList.length),
      ),
    );
  }
}
