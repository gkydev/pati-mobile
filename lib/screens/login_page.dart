import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pati_mobile/models/UserLoginDto.dart';
import 'package:pati_mobile/services/UserService.dart';
import 'package:pati_mobile/utilities/Auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool kontrol = false;
  String _id, _password;
  String errorMsgFromApi = null;
  final formKey = GlobalKey<FormState>();

  bool isLoginProcessing = false;

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
                onTap: () {},
                decoration: InputDecoration(
                  errorText: errorMsgFromApi != null ? errorMsgFromApi : "",
                  hintText: "Kullanıcı adınızı giriniz.",
                  labelText: "Kullanıcı Adı",
                  prefixIcon: Icon(Icons.account_circle),
                ),
                //validator: _idCheck,
                onSaved: (value) => _id = value,
              ),
              TextFormField(
                obscureText: true,
                onTap: () {},
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
                      ElevatedButton(
                        onPressed: isLoginProcessing ? null : _confirmLogin,
                        child: Text(
                          isLoginProcessing ? "Yükleniyor.." : "Giriş Yap",
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            padding: EdgeInsets.all(12),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
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
    setState(() {
      errorMsgFromApi = null;
      isLoginProcessing = true;
    });

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      login();
    } else {
      setState(() {
        kontrol = true;
        isLoginProcessing = false;
      });
    }
  }

  void login() {
    UserService().loginAsync(new UserLoginDto(_id, _password)).then((result) {
      setState(() {
        isLoginProcessing = false;
      });

      if (result.success) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/PetList',
          (Route<dynamic> route) => false,
        );
      } else {
        setState(() {
          errorMsgFromApi = result.message;
        });
      }
    });
  }

  void _idCheck(String value) {}
  void _passwordCheck(String value) {}
}
