import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/app/data/models/personal_details.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';

import '../../widgets/auth/auth_text_from_field.dart';

class PersonalDetailsScreen extends StatefulWidget {
  PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController addressController2 = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSaveData();
  }

  void getSaveData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonDetails =
        jsonDecode(sharedPreferences.getString('userData')!);
    PersonalDetailsModel model = PersonalDetailsModel.fromJson(jsonDetails);
    if (jsonDetails.isNotEmpty) {
      nameController.value = TextEditingValue(text: model.name!);
      addressController.value = TextEditingValue(text: model.address!);
      addressController2.value = TextEditingValue(text: model.address2 ?? '');
      phoneController.value = TextEditingValue(text: model.phone!);
    }
  }

  void storeData() {
    PersonalDetailsModel model = PersonalDetailsModel(nameController.text,
        addressController.text, phoneController.text, addressController2.text);
    String userData = jsonEncode(model);
    sharedPreferences.setString('userData', userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'Personal details'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            AuthTextFromField(
              controller: nameController,
              obscureText: false,
              suffixIcon: const Text(""),
              hintText: 'Name',
              onChanged: () {},
            ),
            const SizedBox(height: 10),
            AuthTextFromField(
              controller: addressController,
              obscureText: false,
              suffixIcon: const Text(""),
              hintText: 'Address 1',
            ),
            const SizedBox(height: 10),
            AuthTextFromField(
              controller: addressController2,
              obscureText: false,
              suffixIcon: const Text(""),
              hintText: 'Address 2',
              textInputType: TextInputType.text,
            ),
            AuthTextFromField(
              controller: phoneController,
              obscureText: false,
              suffixIcon: const Text(""),
              hintText: 'Phone number',
              textInputType: TextInputType.number,
            ),
            TextButton(
              onPressed: () {
                storeData();

                Get.snackbar(
                  "Successfully !",
                  "Your information has been saved",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                width: 100,
                height: 50,
                child: Center(
                  child: Text(
                    'Save'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                sharedPreferences.remove('userData');
                nameController.value = const TextEditingValue(text: '');
                addressController.value = const TextEditingValue(text: '');
                phoneController.value = const TextEditingValue(text: '');

                Get.snackbar(
                  "Successfully !",
                  "Your information has been saved",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                // width: 100,
                height: 50,
                child: Center(
                  child: Text(
                    'Clear and Update Data'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
