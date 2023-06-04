import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home/controllers/card_controller.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';

import '../../../../../data/models/cart_product_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../controllers/main_controller.dart';

class CartProductCard extends StatelessWidget {
  final CartProductModel cartProductModel;
  final int index;
  CartProductCard({
    required this.cartProductModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: mainColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  controller.removeOneCartProduct(cartProductModel!);
                },
                icon: const Icon(
                  Icons.close,
                  size: 25,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 100,
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(cartProductModel!.productModel!.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartProductModel!.productModel!.descriptionEn!,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          // productModel!.price!,
                          "\$${controller.productSubTotal[index]}",
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          // productModel!.price!,
                          (controller.productSubTotalDis[index] ?? 0)
                              .toString(),
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller
                              .removeCartProductFromCart(cartProductModel!);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        "${cartProductModel!.count}",
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.addCartProductToCart(cartProductModel);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
