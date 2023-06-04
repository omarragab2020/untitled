import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/modules/home/views/screens/my_order/fawry_screen.dart';

class TalabattList extends StatefulWidget {
  const TalabattList({Key? key}) : super(key: key);

  @override
  State<TalabattList> createState() => _TalabattListState();
}

class _TalabattListState extends State<TalabattList> {
  final List<String> productList = [
    'التنظيف ',
    'مجدول',
    'فوري',
  ];

  var currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (currentSelected == 1) {
                  Get.to(() => FawryScreen());
                }
              },
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSelected = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      productList[index],
                      style: TextStyle(
                          color: currentSelected == index
                              ? Colors.redAccent
                              : Colors.black),
                    ),
                  )),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 1),
          itemCount: productList.length),
    );
  }
}
