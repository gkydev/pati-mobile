import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pati_mobile/models/PetDto.dart';
import 'package:url_launcher/url_launcher.dart';

class PetDetail extends StatefulWidget {
  @override
  _PetDetailState createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  int _selectedIndex = 0;
  String _petName = "pet name placeholder";
  String _petAge = "pet age placeholder";
  String _petSpecies = "pet species placeholder";
  String _petGender = "pet gender placeholder";
  String _petVac = "pet vac placeholder";
  String _petHeight = "pet height placeholder";
  String _petWeight = "pet weight placeholder";
  String _petDescription = "pet description placeholder";
  List<String> _images;

  void _getPetInfo(PetDto dto) {
    setState(() {
      _petName = dto.petName;
      _petAge = max(
                  (((DateTime.now().difference(dto.petBirthDate).inDays) / 30)
                      .round()),
                  1)
              .toString() +
          " Aylık";
      _petSpecies = dto.speciesName;
      _petGender = dto.petGender == 0 ? "Dişi" : "Erkek";
      _petVac = dto.petVaccineInfo;
      _petHeight = dto.petHeight.toString() + " cm";
      _petWeight = dto.petWeight.toString() + " kg";
      _petDescription = dto.petAdditionInfo;
      _images = dto.images;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _makePhoneCall(String number) async {
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw 'Could not launch $number';
    }
  }

  PetDto args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments as PetDto;

    _getPetInfo(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('$_petName'),
      ),
      body: _getScreen(),
      floatingActionButton: (_selectedIndex == 0)
          ? null
          : FloatingActionButton(
              child: Icon(Icons.center_focus_strong),
              onPressed: null,
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white60,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outlined), label: 'Hakkında'),
          BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp), label: 'Barınak Konumu'),
        ],
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getScreen() {
    _getPetInfo(args);
    List<Widget> screens = <Widget>[
      SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
            child: Image.network(
              'https://taninticaret.net/images/pati/adf7dbea50ab937370e9bfda40895c7054e57891.jpg',
              fit: BoxFit.fill,
            ),
            alignment: Alignment.center,
            height: 250.0,
          )),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yaş:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Tür:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Cinsiyet:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Aşılar:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Boy:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Kilo:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$_petAge', style: TextStyle(fontSize: 18)),
                  Text('$_petSpecies', style: TextStyle(fontSize: 18)),
                  Text('$_petGender', style: TextStyle(fontSize: 18)),
                  Text('$_petVac', style: TextStyle(fontSize: 18)),
                  Text('$_petHeight', style: TextStyle(fontSize: 18)),
                  Text('$_petWeight', style: TextStyle(fontSize: 18)),
                ],
              )
            ],
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text('$_petDescription'),
              )),
          Divider(),
          FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Barınak No', style: TextStyle(color: Colors.blue)),
                  Icon(Icons.call, color: Colors.blue),
                ],
              ),
              onPressed: () => setState(() {
                    _makePhoneCall('tel:05078853305');
                  })),
        ],
      )),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Map Here'),
          )
        ],
      )
    ];

    return screens.elementAt(_selectedIndex);
  }
}
