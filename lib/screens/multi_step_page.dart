import 'package:flutter/material.dart';
import '../widgets/custom_imput_field.dart';
import '../widgets/custom_button.dart';



class MultiStepFormPage extends StatefulWidget {
  const MultiStepFormPage({Key? key}) : super(key: key);

  @override
  State<MultiStepFormPage> createState() => _MultiStepFormPageState();
}

class _MultiStepFormPageState extends State<MultiStepFormPage> {
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text("Details"),
        content: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Personal Details',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CustomInput(
              hint: "First Name",
            ),
            CustomInput(
              hint: "Last Name",
            ),
            CustomInput(
              hint: "Email",
            ),
            CustomInput(
              hint: "Phone number",
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text("Address"),
        content: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Billing Address',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CustomInput(
              hint: "Street Name",
            ),
            CustomInput(
              hint: "Apartment Number (Optional)",
            ),
            CustomInput(
              hint: "City",
            ),
            CustomInput(
              hint: "Country",
            ),
            CustomInput(
              hint: "ZIP / Postcode",
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text("Payment"),
        content: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Payment Details',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CustomInput(
              hint: "Card number",
            ),
            CustomInput(
              hint: "Expiry date",
            ),
            CustomInput(
              hint: "CVV",
            ),
          ],
        ),
      ),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "@lumberjack_programmer",
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: Stepper(
              elevation: 0.0,
              type: StepperType.vertical,
              currentStep: currentStep,
              onStepCancel: () => currentStep == 0
                  ? null
                  : setState(() {
                currentStep -= 1;
              }),
              onStepContinue: () {
                bool isLastStep = (currentStep == getSteps().length - 1);
                if (isLastStep) {
                  //Do something with this information
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                currentStep = step;
              }),
              steps: getSteps(),
            )),
      ),
    );
  }
}
