import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/models/product_model.dart';
import 'package:untitled/app/modules/home/controllers/main_controller.dart';
import 'package:untitled/app/modules/home/views/screens/product_screen/single_product.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';

import '../../../controllers/product_controller.dart';
import '../cart_item_screen.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          centerTitle: true,
          title: const Text('Favorites'),
        ),
        body: Obx(() {
          if (controller.favoritesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/heart.png'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Please, Add your favorites productss',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  )
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                    productModel: controller.favoritesList[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favoritesList.length,
            );
          }
        }));
  }

  Widget buildFavItems({
    required ProductModel productModel,
  }) {
    return InkWell(
      onTap: () {
        Get.to(() => SingleProduct(
              model: productModel,
            ));
      },
      child: Padding(
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
                        SizedBox(width: 10),
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
                        Spacer(),
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
                                Spacer(),
                                const Icon(Icons.star,
                                    size: 13, color: Colors.white)
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
              const Spacer(),
              IconButton(
                onPressed: () {
                  controller.manageFavorites(productModel);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildFavItems2({
  //   required String image,
  //   required String price,
  //   required String discount,
  //   required String title,
  //   required String productid,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: SizedBox(
  //       width: double.infinity,
  //       height: 100,
  //       child: Row(
  //         children: [
  //           SizedBox(
  //             child: Card(
  //               clipBehavior: Clip.antiAlias,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: AspectRatio(
  //                 aspectRatio: 1,
  //                 child: Image.network(
  //                   image,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             width: 15,
  //           ),
  //           Expanded(
  //             flex: 10,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   title,
  //                   style: TextStyle(
  //                     overflow: TextOverflow.ellipsis,
  //                     color: Get.isDarkMode ? Colors.white : Colors.black,
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       '\$ $price',
  //                       style: TextStyle(
  //                         overflow: TextOverflow.ellipsis,
  //                         color: Get.isDarkMode ? Colors.white : Colors.black,
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     Text(
  //                       '\$ $price',
  //                       style: TextStyle(
  //                         overflow: TextOverflow.ellipsis,
  //                         color: Get.isDarkMode ? Colors.white : Colors.black,
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //           // const Spacer(),
  //           // IconButton(
  //           //   onPressed: () {
  //           //     // controller.manageFavorites(productid!);
  //           //   },
  //           //   icon: const Icon(
  //           //     Icons.favorite,
  //           //     color: Colors.red,
  //           //     size: 30,
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
