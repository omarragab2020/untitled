import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyLocations extends StatelessWidget {
  MyLocations({Key? key}) : super(key: key);
  bool? check1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/location.png',
            height: Get.height * .1,
            width: Get.width * .1,
          ),
          SizedBox(width: 15),
          Column(
            children: [
              Text('ASafra'),
              Text('taqwa street'),
              Text('mansoura,Egypt'),
            ],
          ),
          Spacer(),
          Checkbox(
              value: check1,
              onChanged: (bool? value) {
                check1 = value;
              })
        ],
      ),
    );
  }
}
