import 'package:flutter/material.dart';
import 'package:pati_mobile/screens/first_page.dart';
import 'package:pati_mobile/screens/login_page.dart';
import 'package:pati_mobile/screens/pet_detail.dart';
import 'package:pati_mobile/screens/petlist.dart';
import 'package:pati_mobile/screens/register_page.dart';
import 'package:pati_mobile/utilities/Auth.dart';

void main()  async {
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
