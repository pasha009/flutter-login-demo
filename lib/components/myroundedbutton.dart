import 'package:flutter/material.dart';
import 'package:crystaspace_login_task/signup.dart';
import 'package:crystaspace_login_task/login.dart';

class SimpleRoundButton extends StatelessWidget {
  final buttonText;
  final backgroundColor;

  const SimpleRoundButton({Key key, this.buttonText, this.backgroundColor}) : super(key: key);

  static Widget getAlternativeButton(bool loginScreen, Color color, BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    loginScreen ? "DON'T HAVE AN ACCOUNT?" : "HAVE AN ACCOUNT?",
                    style: TextStyle(color: color),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      if(loginScreen) return SignupScreen();
                      return LoginScreen();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              splashColor: this.backgroundColor,
              color: this.backgroundColor,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      this.buttonText,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(28.0)),
                      splashColor: Colors.white,
                      color: Colors.white,
                      child: Icon(
                        Icons.arrow_forward,
                        color: this.backgroundColor,
                      ),
                      onPressed: () => {},
                    ),
                  )
                ],
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
