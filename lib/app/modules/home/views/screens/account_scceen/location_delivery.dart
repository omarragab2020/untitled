import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/modules/home/views/widgets/auth/auth_text_from_field.dart';

import '../../widgets/my_account/empty_location.dart';
import '../../widgets/my_account/text_feild.dart';
import '../../widgets/text_utils.dart';

class LocationDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: Text(
            'Delivery addresses'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: EmptyLocation());
  }
}
