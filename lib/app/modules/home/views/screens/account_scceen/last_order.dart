import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../data/models/cart_product_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../controllers/main_controller.dart';
import '../../widgets/setting/last_order_state.dart';
import '../../widgets/text_utils.dart';

class LastOrder extends StatelessWidget {
  LastOrder({Key? key}) : super(key: key);
  final controller = Get.put(MainController());
  CartProductModel? cartProductModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: Text(
            'Last Order'.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            LastOrderState(
              onTap: (n) {},
            )
          ],
        )
        // Obx(() {
        //   if (controller.favoritesList.isEmpty) {
        //     return const Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(
        //             Icons.shopping_cart_outlined,
        //             size: 100,
        //           ),
        //           SizedBox(height: 20),
        //           Text(
        //             'You hav\'nt buy anything yet',
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.black,
        //                 fontSize: 18),
        //           )
        //         ],
        //       ),
        //     );
        //   } else {
        //     return ListView.separated(
        //       itemBuilder: (context, index) {
        //         return buildLastOrder(
        //             productModel: controller.lastProductList[index]);
        //       },
        //       separatorBuilder: (context, index) {
        //         return const Divider(
        //           color: Colors.grey,
        //           thickness: 1,
        //         );
        //       },
        //       itemCount: controller.lastProductList.length,
        //     );
        //   }
        // })
        );
  }

  Widget buildLastOrder({
    required ProductModel productModel,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            if (productModel.image != null)
              SizedBox(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      productModel.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.descriptionEn ?? '',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ ${productModel.price}',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        (productModel.discount ?? 0).toString(),
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          overflow: TextOverflow.ellipsis,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 20,
                        width: 45,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtils(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                text: productModel.rating.toString(),
                                color: Colors.white,
                              ),
                              const Spacer(),
                              const Icon(Icons.star,
                                  size: 13, color: Colors.white),
                              Text(
                                "${cartProductModel!.count}",
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     controller.manageFavorites(productModel);
                  //   },
                  //   icon: const Icon(
                  //     Icons.favorite,
                  //     color: Colors.red,
                  //     size: 30,
                  //   ),
                  // ),
                ],
              ),
            ),
            // const Spacer(),
            // IconButton(
            //   onPressed: () {
            //     controller.manageFavorites(productModel);
            //   },
            //   icon: const Icon(
            //     Icons.favorite,
            //     color: Colors.red,
            //     size: 30,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
