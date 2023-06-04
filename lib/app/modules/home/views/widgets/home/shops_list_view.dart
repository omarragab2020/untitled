import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled/app/modules/home/views/screens/product_screen/category_screen.dart';
import 'package:untitled/app/services/firebase_handler.dart';

import '../../../../../data/models/shop_model.dart';
import '../../../controllers/main_controller.dart';

class ShopsListView extends GetView<MainController> {
  const ShopsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseHandler.getShops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<ShopModel> list = ShopModel.fromMapList(
                  snapshot.data!.docs.map((e) => e.data()).toList());

              return Obx(() {
                if (controller.currentTypeSelected == 1) {
                  list.sort((a, b) => ((a.rating)).compareTo(b.rating));
                } else if (controller.currentTypeSelected == 2) {
                  list.sort((a, b) => ((b.rating)).compareTo(a.rating));
                }
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => CategoryScreen(shop: list[index]));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                list[index].image!,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index].rateNum.toString(),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        list[index].rating.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      const Spacer(),
                                      Text(
                                        list[index].name!,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        list[index].address!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              });
            }
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
