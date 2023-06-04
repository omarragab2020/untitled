import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BuildMyAccount({
  required String text1,
  required String text2,
  IconData? icon1,
  IconData? icon2,
  required Function() onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon2),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    text2,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),

              // SizedBox(width: 15),
            ],
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    ),
  );
}
