import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../text_utils.dart';

class LastOrderState extends GetView<MainController> {
  LastOrderState({required this.onTap, Key? key}) : super(key: key);
  void Function(dynamic n) onTap;

  final List<String> productList = [
    'All',
    'Completed',
    'Not Complete',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[100]),
                    child: Obx(() {
                      return Center(
                        child: Text(
                          productList[index],
                          style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color:
                                  controller.currentOrderStateSelected == index
                                      ? mainColor
                                      : Colors.black),
                        ),
                      );
                    }),
                  ));
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: productList.length),
      ),
    );
  }
}
