import 'package:flutter/material.dart';
import 'components/myformtextfield.dart';
import 'components/myroundedbutton.dart';

class SignupScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  MyFormTextField emailTextField, passwordTextField, confirmPasswordTextField;
  final borderColor = Colors.green;

  SignupScreen() {
    // initialize formfields
    emailTextField = MyFormTextField(myTextFieldType: MyTextFieldType.EMAIL, hintText: "Email", borderColor: borderColor);
    passwordTextField = MyFormTextField(myTextFieldType: MyTextFieldType.PASSWORD, hintText: "Password", borderColor: borderColor);
    // confirmPasswordTextField takes reference of passwordTextField TextEditingController for validation
    confirmPasswordTextField = MyFormTextField(
        myTextFieldType: MyTextFieldType.PASSWORD_CONFIRM,
        hintText: "Confirm Password",
        passwordController: passwordTextField.textEditingController,
        borderColor: borderColor,
    );
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
                confirmPasswordTextField,
                SimpleRoundButton(
                  buttonText: "SIGN UP",
                  backgroundColor: borderColor
                ),
                SimpleRoundButton.getAlternativeButton(false, borderColor, context),
              ],
            )
        )
    );
  }
}
