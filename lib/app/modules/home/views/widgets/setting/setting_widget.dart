import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildSettingSelection extends StatefulWidget {
  BuildSettingSelection({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildSettingSelection> createState() => _BuildSettingSelectionState();
}

class _BuildSettingSelectionState extends State<BuildSettingSelection> {
  bool? lights;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Switch(
              value: lights!,
              activeColor: Colors.redAccent,
              onChanged: (bool? value) {
                setState(() {
                  lights = value!;
                });
              },
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'txt1',
                  style: const TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text('txt2'),
                Text(
                  'txt3',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}

Widget buildTextSetting({
  required String txt1,
  required String txt2,
  required String txt3,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        txt1,
        style: const TextStyle(color: Colors.grey),
      ),
      SizedBox(height: 10),
      Text(txt2),
      Text(
        txt3,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
}
