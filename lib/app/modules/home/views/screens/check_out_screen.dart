import 'package:flutter/material.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: mainColor,
          title: Text('Delivery')),
      body: StepperExample(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                        primary: mainColor,
                      ),
                      onPressed: () {
                        // cartController.addProductToCart(model);
                      },
                      child: Text(
                        "Buy Order Now",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          hintColor: mainColor,
          colorScheme: ColorScheme.light(primary: mainColor)),
      child: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 0) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            title: new Text('Account'),
            subtitle: new Text('Add your personal information'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email Address'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ],
            ),
            isActive: _index >= 0,
            state: _index >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: new Text('Address'),
            subtitle: new Text('Add your address'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Home Address'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Postcode'),
                ),
              ],
            ),
            isActive: _index >= 0,
            state: _index >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: new Text('Mobile Number'),
            subtitle: new Text('Add your phone'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                ),
              ],
            ),
            isActive: _index >= 0,
            state: _index >= 0 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
