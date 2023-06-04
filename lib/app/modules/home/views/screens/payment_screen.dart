import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home/controllers/main_controller.dart';

import '../../../../data/models/product_model.dart';
import '../../controllers/card_controller.dart';
import '../../controllers/payment_controller.dart';
import '../widgets/payment/delivery_continer_widget.dart';
import '../widgets/payment/payment_method_widget.dart';
import '../widgets/text_utils.dart';

class PayMentScreen extends StatelessWidget {
  PayMentScreen({
    Key? key,
  }) : super(key: key);

  final cartController = Get.find<CartController>();
  final payMentController = Get.find<PayMentController>();
  final mainController = Get.find<MainController>();
  ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PayMent"),
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: "Shipping to",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                const DeliveryContinerWidget(),
                const SizedBox(
                  height: 20,
                ),
                TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: "Payment method",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PayMentMethodWidget(),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "Total: ${cartController.total}\$",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: mainColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        print(mainController.currentPoint);
                        Get.snackbar('Successful',
                            'Your order has been successfully added to the order list, and your shop point increased 10 points',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            duration: Duration(seconds: 3));

                        mainController.currentPoint += 10;
                        mainController.manageLastOrder(productModel!);
                      },
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
