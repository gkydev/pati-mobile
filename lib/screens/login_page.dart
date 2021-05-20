import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textController1;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: "default");
  }

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Yap"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Kullanıcı adınızı giriniz.",
                  labelText: "Kullanıcı Adı",
                  prefixIcon: Icon(Icons.account_circle),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Şifrenizi giriniz.",
                  labelText: "Şifre",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autofocus: false,
                  controller: textController1,
                  decoration: InputDecoration(
                    hintText: "Kullanıcı adınızı giriniz.",
                    labelText: "Kullanıcı Adı",
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Şifrenizi giriniz.",
                    labelText: "Şifre",
                    prefixIcon: Icon(Icons.keyboard),
                  ),
                ),
              ],
            ),
          ),

          /*Container(
            margin: EdgeInsets.all(5),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue.shade100,
            child:
                Align(alignment: Alignment.center, child: Text("Form Alanı")),
          ),*/
        ],
      ),*/
