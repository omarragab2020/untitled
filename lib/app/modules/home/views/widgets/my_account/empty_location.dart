import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/app/modules/home/views/widgets/my_account/add_location.dart';

class EmptyLocation extends StatelessWidget {
  const EmptyLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 80)),
        Center(child: Image.asset('assets/images/location.png')),
        const SizedBox(height: 20),
        GradientText(
          'No Delivery addresses',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          colors: const [
            Color(0xffFA4126),
            Color(0xffFD5431),
            Color(0xffFF793D),

            //add mroe colors here.
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'No registered address found',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 20),
        Container(
          width: Get.width - 100,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffFFB802)),
          child: InkWell(
            onTap: () {
              Get.to(() => AddLocation());
            },
            child: const Center(
              child: Text(
                'Add new address',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
