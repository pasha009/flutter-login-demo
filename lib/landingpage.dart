import 'package:crystaspace_login_task/login.dart';
import 'package:crystaspace_login_task/signup.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {

  Widget getButton(String text, Color color, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: FlatButton(
        height: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        splashColor: color,
        color: color,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Icon(
                  icon,
                  size: 60,
                  color: Colors.white),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              if(text == "LOG IN") return LoginScreen();
              return SignupScreen();
            }),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getButton("LOG IN", Colors.blue, Icons.login, context),
            getButton("SIGN UP", Colors.green, Icons.assignment, context),
          ],
        ),
      ),
    );
  }
}
