import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home/views/screens/payment_screen.dart';

import '../../../../../routes/app_pages.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/payment_controller.dart';
import '../text_utils.dart';

class DeliveryContinerWidget extends StatefulWidget {
  const DeliveryContinerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContinerWidget> createState() => _DeliveryContinerWidgetState();
}

class _DeliveryContinerWidgetState extends State<DeliveryContinerWidget> {
  final TextEditingController phoneController = TextEditingController();
  int radioContinerIndes = 1;
  bool changeColors = false;

  final controller = Get.find<PayMentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
          address: "Egypt,mansoura asafra",
          name: "Omar Ragab",
          phone: "01018027405",
          title: "My details",
          value: 1,
          color: Colors.white,
          icon: Container(),
          onChanged: (int? value) {
            setState(() {
              radioContinerIndes = value!;
              changeColors = !changeColors;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        // Obx(
        //   () => buildRadioContiner(
        //     name: controller.address.value,
        //     address: "Egypt,mansoura asafra",
        //     phone: controller.phoneNumber.value,
        //     title: "Delivery",
        //     value: 2,
        //     color: changeColors ? Colors.grey.shade300 : Colors.white,
        //     icon: InkWell(
        //       onTap: () {
        //         Get.defaultDialog(
        //           title: "Enter Your Phone Number",
        //           titleStyle: const TextStyle(
        //             fontSize: 16,
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold,
        //           ),
        //           backgroundColor: Colors.white,
        //           radius: 10,
        //           textCancel: " Cancel ",
        //           confirmTextColor: Colors.black,
        //           textConfirm: " Save ",
        //           cancelTextColor: Colors.black,
        //           onCancel: () {
        //             Get.to(() => PayMentScreen());
        //           },
        //           onConfirm: () {
        //             Get.back();
        //             controller.phoneNumber.value = phoneController.text;
        //           },
        //           buttonColor: mainColor,
        //           content: Padding(
        //             padding: const EdgeInsets.all(15),
        //             child: TextField(
        //               controller: phoneController,
        //               cursorColor: Colors.black,
        //               maxLength: 11,
        //               keyboardType: TextInputType.text,
        //               onSubmitted: (value) {
        //                 phoneController.text = value;
        //               },
        //               decoration: InputDecoration(
        //                 fillColor: mainColor.withOpacity(0.2),
        //                 focusColor: Colors.red,
        //                 prefixIcon: const Icon(
        //                   Icons.phone,
        //                   color: mainColor,
        //                 ),
        //                 suffixIcon: IconButton(
        //                   onPressed: () {
        //                     phoneController.clear();
        //                   },
        //                   icon: const Icon(Icons.close, color: Colors.black),
        //                 ),
        //                 hintText: "Enter Your Phone Number",
        //                 hintStyle: const TextStyle(
        //                   color: Colors.black45,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //                 filled: true,
        //                 enabledBorder: OutlineInputBorder(
        //                   borderSide: const BorderSide(color: Colors.white),
        //                   borderRadius: BorderRadius.circular(10),
        //                 ),
        //                 focusedBorder: OutlineInputBorder(
        //                   borderSide: const BorderSide(color: Colors.white),
        //                   borderRadius: BorderRadius.circular(10),
        //                 ),
        //                 errorBorder: OutlineInputBorder(
        //                   borderSide: const BorderSide(color: Colors.white),
        //                   borderRadius: BorderRadius.circular(10),
        //                 ),
        //                 focusedErrorBorder: OutlineInputBorder(
        //                   borderSide: const BorderSide(color: Colors.white),
        //                   borderRadius: BorderRadius.circular(10),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //       child: const Icon(
        //         Icons.contact_phone,
        //         color: mainColor,
        //         size: 20,
        //       ),
        //     ),
        //     onChanged: (int? value) {
        //       setState(() {
        //         radioContinerIndes = value!;
        //         changeColors = !changeColors;
        //       });
        //       controller.updatePosition();
        //     },
        //   ),
        // ),
      ],
    );
  }

  Widget buildRadioContiner({
    required Color color,
    int? value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value!,
            groupValue: radioContinerIndes,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: title,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: name,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('🇪🇬+02 '),
                    TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: phone,
                      color: Colors.black,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: address,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
