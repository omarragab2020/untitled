import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:untitled/app/data/models/user_model.dart';
import 'package:untitled/app/data/models/wallet.dart';
import 'package:untitled/app/modules/home/controllers/auth_controller.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';
import 'package:untitled/app/services/firebase_handler.dart';

import '../../../../../services/encryption_service.dart';
import '../../../controllers/main_controller.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/text_utils.dart';

class WalletScreen extends GetView<MainController> {
  WalletScreen({Key? key}) : super(key: key);
  final TextEditingController transferController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  int currentBalance = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          // iconTheme: const IconThemeData(
          //   color: mainColor, //change your color here
          // ),
          backgroundColor: mainColor,
          title: Text(
            'Wallet'.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('E-wallet balance amount : 0'),
              const Text('Top_Up your wallet'),
              buildPaymentType(context),
              const Text('Transfer amount'),
              Row(
                children: [
                  Text('Transfer amount'),
                  Expanded(
                      child: AuthTextFromField(
                    obscureText: true,
                    controller: transferController,
                    textInputType: TextInputType.number,
                  ))
                ],
              ),
              Row(
                children: [
                  Text('Account'),
                  Expanded(
                      child: AuthTextFromField(
                    obscureText: true,
                    controller: amountController,
                    textInputType: TextInputType.phone,
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: mainColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text('Share your id with other'),
                    onPressed: () {
                      ///TODO
                      String cipheredID = EncryptionService.encrypt(
                          AuthController.to.user!.id!);
                      Share.share('This is my user id:\n $cipheredID');

                      if (AuthController.to.isSignedIn) {
                        String cipheredID = EncryptionService.encrypt(
                            AuthController.to.user!.id!);

                        Share.share('This is my user id:\n $cipheredID');
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: mainColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text('Transfer'),
                    onPressed: () {
                      transfer(transferController.text,
                          double.parse(amountController.text));
                    },
                  ),
                ),
              ),
            ],
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Column(
        //     children: [
        //       Text('You must sign up first to find your friend'),
        //       MyTextField(
        //         searchController,
        //         onChanged: (s) {
        //           controller.addSearchToList(s);
        //         },
        //       ),
        //       Text(
        //         'Current balance : $currentBalance',
        //         style: const TextStyle(
        //             // fontWeight: FontWeight.bold,
        //             fontSize: 20,
        //             color: Colors.black),
        //       ),
        //       TextField(),
        //       TextButton(onPressed: () {}, child: Text('Charge')),
        //       Text('Share your points '),
        //       TextField(
        //         keyboardType: TextInputType.number,
        //       ),
        //       TextField(),
        //       TextButton(onPressed: () {}, child: Text('Send')),
        //     ],
        //   ),
        // )

        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(8),
        //               color: Colors.blue[50]),
        //           child: Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               children: [
        //                 Text(
        //                   'You must have a verified phone number to use ShopPoints'
        //                       .tr,
        //                   maxLines: 3,
        //                   style: TextStyle(fontSize: 16),
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //                 Text(
        //                   'Verify phone number'.tr,
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 16,
        //                       color: mainColor),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         const SizedBox(height: 15),
        //         const CircleAvatar(
        //           radius: 40,
        //           backgroundColor: Colors.green,
        //           child: Icon(
        //             Icons.star,
        //             size: 50,
        //             color: Colors.yellow,
        //           ),
        //         ),
        //         Text(
        //           'What are ShopPoints ?'.tr,
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        //         ),
        //         const SizedBox(height: 8),
        //         Text(
        //           'ShopPoints are your ShopPoint credits! You can claim them by redeeming a coupon code'
        //               .tr,
        //           style: TextStyle(fontSize: 20),
        //         ),
        //         const SizedBox(height: 10),
        //         Text(
        //           'For your country 1 ShopPoint is equal to 5 l.e'.tr,
        //           style: TextStyle(fontSize: 20, color: Colors.grey),
        //         ),
        //         const SizedBox(height: 15),
        //         Divider(thickness: 2),
        //         const SizedBox(height: 15),
        //         CircleAvatar(
        //           radius: 60,
        //           child: Image.network(
        //               'https://pngimg.com/uploads/globe/globe_PNG63.png'),
        //         ),
        //         const SizedBox(height: 15),
        //         Text(
        //           'How can I use them ?'.tr,
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //         ),
        //         const SizedBox(height: 10),
        //         Text(
        //           'ShopPoints can be applied on all eligible orders placed from any shop taht has the ShopPoints star badge. To use your ShopPooints tab Add discount form the basket screen or the Checkout screen and the amount will be automatically deducted from your total bill.'
        //               .tr,
        //           style: TextStyle(fontSize: 20),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }

  void transfer(String cipheredID, double amount) {
    String userID = EncryptionService.decrypt(cipheredID);

    if (AuthController.to.user!.balance > amount) {
      FirebaseHandler.updateMyUser({
        UserModelFields.balance: FieldValue.increment(-1 * amount),
      });

      FirebaseHandler.updateUser(
          userID, {UserModelFields.balance: FieldValue.increment(1 * amount)});
    }
  }
}

Widget buildPaymentType(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        decoration: BoxDecoration(
            color: mainColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          child: const Text('Via Code'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    child: Column(
                      children: [
                        const Text(
                            'Please enter the code to top_up your wallet'),
                        const TextField(),
                        TextButton(
                            onPressed: () {}, child: const Text('Verify'))
                      ],
                    ),
                  );
                });
          },
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: mainColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          child: const Text('Visa'),
          onPressed: () {},
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: mainColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          child: const Text('G'),
          onPressed: () {},
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: mainColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          child: const Text('IOS'),
          onPressed: () {},
        ),
      ),
    ],
  );
}
