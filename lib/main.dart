import 'package:flutter/material.dart';

import 'screens/first_page.dart';
import 'screens/login_page.dart';
import 'screens/pet_detail.dart';
import 'screens/petlist.dart';
import 'screens/register_page.dart';
import 'utilities/Auth.dart';

void main() async {
  await Auth.create();

  runApp(MaterialApp(
    title: "Pati",
    initialRoute: "",
    routes: {
      '/': (context) => FirstPage(),
      '/Login': (context) => LoginPage(),
      '/Register': (context) => RegisterPage(),
      '/PetList': (context) => PetList(),
      '/PetDetail': (context) => PetDetail()
    },
    onUnknownRoute: (RouteSettings settings) =>
        MaterialPageRoute(builder: (context) => LoginPage()),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}
