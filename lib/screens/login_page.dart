import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool kontrol = false;
  String _id, _password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Yap"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Form(
          autovalidate: kontrol,
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  hintText: "Kullanıcı adınızı giriniz.",
                  labelText: "Kullanıcı Adı",
                  prefixIcon: Icon(Icons.account_circle),
                ),
                //validator: _idCheck,
                onSaved: (value) => _id = value,
              ),
              TextFormField(
                obscureText: true,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  hintText: "Şifrenizi giriniz.",
                  labelText: "Şifre",
                  prefixIcon: Icon(Icons.lock),
                ),
                //validator: _passwordCheck,
                onSaved: (value) => _password = value,
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      RaisedButton(
                        elevation: 12,
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          _confirmLogin;
                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.pushNamed(
                            context,
                            '/PetList',
                          );
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Hesabınız yok mu?  "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/Register');
                            },
                            child: Text(
                              "Kayıt ol",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmLogin() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      setState(() {
        kontrol = true;
      });
    }
  }

  void _idCheck(String value) {}
  void _passwordCheck(String value) {}
}
