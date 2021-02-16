import 'package:flutter/material.dart';
import 'components/myformtextfield.dart';
import 'components/myroundedbutton.dart';

class LoginScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  MyFormTextField emailTextField, passwordTextField;
  final borderColor = Colors.blue;

  LoginScreen() {
    // initialize formfields
    emailTextField = MyFormTextField(myTextFieldType: MyTextFieldType.EMAIL, hintText: "Email", borderColor: borderColor);
    passwordTextField = MyFormTextField(myTextFieldType: MyTextFieldType.PASSWORD, hintText: "Password", borderColor: borderColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                emailTextField,
                passwordTextField,
                SimpleRoundButton(
                    buttonText: "LOG IN",
                    backgroundColor: borderColor
                ),
                SimpleRoundButton.getAlternativeButton(true, borderColor, context),
              ],
            )
        )
    );
  }
}