import 'package:flutter/material.dart';
import 'package:pati_mobile/screens/first_page.dart';
import 'package:pati_mobile/screens/login_page.dart';
import 'package:pati_mobile/screens/register_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Dersleri",
    initialRoute: "",
    routes: {
      '/': (context) => FirstPage(),
      '/Login': (context) => LoginPage(),
      '/Register': (context) => RegisterPage(),
    },
    onUnknownRoute: (RouteSettings settings) =>
        MaterialPageRoute(builder: (context) => LoginPage()),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}

