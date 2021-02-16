import 'package:flutter/material.dart';

enum MyTextFieldType {
  EMAIL,
  PASSWORD,
  PASSWORD_CONFIRM,
}

class MyFormTextField extends StatefulWidget {
  final MyTextFieldType myTextFieldType;
  final String hintText;
  final TextEditingController passwordController;
  final TextEditingController textEditingController = TextEditingController();
  final Color borderColor;

  MyFormTextField({Key key, this.myTextFieldType, this.hintText, this.passwordController, this.borderColor}) : super(key: key);

  @override
  _MyFormTextFieldState createState() => _MyFormTextFieldState();
}

class _MyFormTextFieldState extends State<MyFormTextField> {
  bool _hiding = true;

  // border property for TextFormField
  OutlineInputBorder _getInputBorder(Color color) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: color,
            width: 2.0
        )
    );
  }

  // common validator for all TextFormFields
  String _validator(String value) {
    if (value.isEmpty) return "Required field";
    switch (widget.myTextFieldType) {
      case MyTextFieldType.EMAIL:
        return validateEmail(value);
      case MyTextFieldType.PASSWORD:
        return validatePassword(value);
      case MyTextFieldType.PASSWORD_CONFIRM:
        return validateConfirmPassword(value);
    }
    return null;
  }

  String validateEmail(String value) {
    // https://stackoverflow.com/questions/63292839/how-to-validate-email-in-a-textformfield
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    return null;
  }

  String validatePassword(String value) {
    if(value.length < 8) return "Password must be at least 8 characters long";
    if(!value.contains(RegExp(r"\d"), 0)) return "Password must contain a number";
    if(!value.contains(RegExp(r"[A-Z]"), 0)) return "Password must contain an UPPERCASE letter";
    if(value.contains(RegExp(r"^[\w&.-]+$"), 0)) return "Password must contain a special character";
    return null;
  }

  String validateConfirmPassword(String value) {
    final passwordText = widget.passwordController.text;
    if(passwordText.isNotEmpty && passwordText != value)
      return "Passwords do not match";
    return null;
  }

  IconButton getSuffixIcon() {
    if(widget.myTextFieldType == MyTextFieldType.EMAIL) return null;
    Icon icon = Icon(Icons.visibility_off_outlined, color: widget.borderColor);
    if(_hiding) icon = Icon(Icons.visibility_outlined, color: widget.borderColor);
    return IconButton(
      icon: icon,
      onPressed: () {
        setState(() {
          _hiding = ! _hiding;
        });
      }
    );
  }

  Icon getPrefixIcon() {
    if(widget.myTextFieldType == MyTextFieldType.EMAIL)
      return Icon(Icons.person_outline, color: widget.borderColor);
    return Icon(Icons.lock_open, color: widget.borderColor);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
      child: TextFormField(
        // obscureText is the cause of the lag. No idea how
        obscureText: widget.myTextFieldType != MyTextFieldType.EMAIL ? _hiding : false,
        controller: widget.textEditingController,
        style: TextStyle(fontSize: 18),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: TextStyle(
            color: widget.borderColor,
          ),
          hintText: widget.hintText,
          enabledBorder: _getInputBorder(widget.borderColor),
          focusedBorder: _getInputBorder(widget.borderColor),
          errorBorder: _getInputBorder(Colors.red),
          focusedErrorBorder: _getInputBorder(Colors.red),
          suffixIcon: getSuffixIcon(),
          prefixIcon: getPrefixIcon(),
        ),
        validator: _validator,
      ),
    );
  }
}
