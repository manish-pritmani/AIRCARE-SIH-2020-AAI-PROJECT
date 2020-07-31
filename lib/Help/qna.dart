import 'package:flutter/material.dart';


class Query extends StatefulWidget {
  Query() : super();

  final String title = "AirCare FAQ";

  @override
  StepperDemoState createState() => StepperDemoState();
}

class StepperDemoState extends State<Query> {
  //
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Text('What is AirCare?'),
      content: Text(
          'AirCare is a platform to provide convient facilities while travelling from flight!'),
      isActive: true,
    ),
    Step(
      title: Text('How can avail services in AirCare App'),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 3 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 4 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 5 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 6 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 7 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 8 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 9 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 10 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 11 '),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Question 8'),
      content: Text('Hello World!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Frequently Asked Questions",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          )),
      body: Container(
        child: Stepper(
          currentStep: this.current_step,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              current_step = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (current_step < steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
          },
        ),
      ),
    );
  }
}
