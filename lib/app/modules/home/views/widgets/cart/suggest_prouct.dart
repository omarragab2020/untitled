import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../../../data/models/category_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../services/firebase_handler.dart';
import '../text_utils.dart';

class SuggestsProducts extends StatelessWidget {
  SuggestsProducts(
      {Key? key, required this.category, required this.productModel})
      : super(key: key);
  final CategoryModel category;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<QuerySnapshot>(
          future: FirebaseHandler.getCategoryProducts(category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<ProductModel> list = ProductModel.fromMapList(
                    snapshot.data!.docs.map((e) => e.data()).toList());

                List<ProductModel> displayList = [...list];
                return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 5);
                    },
                    itemCount: displayList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Column(
                        children: [
                          Container(
                            width: Get.width,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              productModel.image!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            color: mainColor,
                            child: const Center(
                                child: Text(
                              'ADD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      );
                    });
              }
              return const Text("No data");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
