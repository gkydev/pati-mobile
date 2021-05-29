import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.pink,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                Colors.pink.shade500,
                Colors.blue.shade500,
              ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 60),
                    child: Text(
                      "PATİ",
                      style: TextStyle(
                          fontSize: 100,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decorationStyle: TextDecorationStyle.dotted),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RaisedButton(
                        elevation: 12,
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/Login",
                          ).then((popValue) {
                          });
                        },
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.pink.shade400,
                      ),
                      RaisedButton(
                        elevation: 8,
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/Register",
                          ).then((popValue) {
                          });
                        },
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.pink.shade300,
                      ),
                      RaisedButton(
                        elevation: 8,
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/Home",
                          ).then((popValue) {
                          });
                        },
                        child: Text(
                          "Hayvan Sahiplenmenin Faydaları",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        color: Colors.pink.shade300,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
