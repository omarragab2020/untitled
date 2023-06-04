import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home/controllers/auth_controller.dart';

import '../../../../../../utils/helpers.dart';
import '../../../../../services/firebase_handler.dart';

class CardRechargingPage extends StatelessWidget {
  final controller = Get.find<AuthController>();
  final _cardController = TextEditingController().obs;

  TextEditingController get cardController => _cardController.value;

  set cardController(TextEditingController val) => _cardController.value = val;

  CardRechargingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('sadas')),
            // vSpace48,
            // UserBanner(userModel: controller.loggedInUser!),
            // vSpace48,
            const Text('Card Recharging'),
            // vSpace48,
            Obx(() {
              return FormBuilderTextField(
                name: 'cardItem',
                controller: cardController,
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(12),
                    FormBuilderValidators.maxLength(12),
                  ],
                ),
              );
            }),
            const SizedBox(height: 32),
            // FilledButton(
            //   onPressed: submitCard,
            //   child: const Text('Recharge card'),
            // ),
          ],
        ),
      ),
    );
  }

  // Future<void> submitCard() async {
  //   String cardNum = cardController.text.trim();
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> cardDoc =
  //         await FirebaseHandler.getCardBySerialAndTime(cardNum);
  //     if (cardDoc.docs.isEmpty) {
  //       mPrintError('Invalid card num $cardNum');
  //       // mShowToast('Invalid card num', color: Colors.red);
  //     } else {
  //       if (FirebaseHandler.withdrawCard(cardDoc.docs.first)) {
  //         cardController.clear();
  //       }
  //     }
  //   } on Exception catch (e) {
  //     mPrintError('Exception: $e');
  //     // mShowToast('Error getting card', color: Colors.red);
  //   }
  // }
}
