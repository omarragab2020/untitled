import 'dart:async';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/app/modules/home/views/widgets/auth/auth_text_from_field.dart';

import '../text_utils.dart';

class AddLocation extends StatelessWidget {
  AddLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'Add new Address'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Your location on map',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              Center(child: Image.asset('assets/images/map.png')),
              const Center(
                child: Text(
                  'Edit your location',
                  style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      color: Color(0xffEA6131)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset('assets/images/location2.png'),
                  const SizedBox(width: 8),
                  const Text(
                    'Extra locations Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Type of the adress',
                style: TextStyle(fontSize: 16),
              ),
              const AuthTextFromField(
                textInputType: TextInputType.text,
                obscureText: true,
              ),
              const Text(
                'The Details of the address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Street name',
                style: TextStyle(fontSize: 16),
              ),
              const AuthTextFromField(
                textInputType: TextInputType.text,
                obscureText: true,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Block number'),
                  Text('Floor number'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: AuthTextFromField(
                      textInputType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: AuthTextFromField(
                      textInputType: TextInputType.number,
                      obscureText: true,
                    ),
                  )
                ],
              ),
              const Text(
                'Apartment number',
                style: TextStyle(fontSize: 16),
              ),
              const AuthTextFromField(
                textInputType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.snackbar('Successful', 'Location added successfully',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: Duration(seconds: 3));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffFFB802)),
                  child: const Center(
                    child: Text(
                      'Save ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
