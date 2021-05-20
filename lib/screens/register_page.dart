import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final formKey = GlobalKey<FormState>();

class _RegisterPageState extends State<RegisterPage> {
  int _aktifStep = 0;
  bool hata = false;
  List<Step> tumStepler;
  String ad, soyad, email, password, id, phone;

  var adKey = GlobalKey<FormFieldState>();
  var soyadKey = GlobalKey<FormFieldState>();
  var idKey = GlobalKey<FormFieldState>();
  var passKey = GlobalKey<FormFieldState>();
  var mailKey = GlobalKey<FormFieldState>();
  var phoneKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    tumStepler = _allSteps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kayıt Ol",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumStepler,
          currentStep: _aktifStep,
          /*onStepTapped: (tappedStep) {
            setState(() {
              _aktifStep = tappedStep;
            });
          },*/
          onStepContinue: () {
            setState(() {
              if (_aktifStep < tumStepler.length - 1) {
                _aktifStep++;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _allSteps() {
    List<Step> steps = [
      Step(
        title: Text("Ad"),
        state: _stateAyarla(0),
        content: TextFormField(
          key: adKey,
          decoration: InputDecoration(
            hintText: "Adınızı giriniz.",
            labelText: "Ad",
            prefixIcon: Icon(Icons.account_circle_sharp),
          ),
          validator: (deger) {
            if (deger.length < 6) {
              return "En az 6 karakter girilmeli.";
            } else
              return null;
          },
          onSaved: (value) {
            ad = value;
          },
        ),
      ),
      Step(
        title: Text("Soyad"),
        state: _stateAyarla(1),
        content: TextFormField(
          key: soyadKey,
          decoration: InputDecoration(
            hintText: "Soyadınızı giriniz.",
            labelText: "Soyad",
            //prefixIcon: Icon(Icons.account_circle_sharp),
          ),
          validator: (deger) {
            if (deger.length < 6) {
              return "En az 6 karakter girilmeli.";
            } else
              return null;
          },
          onSaved: (value) {
            soyad = value;
          },
        ),
      ),
      Step(
        title: Text("Kullanıcı Adı"),
        state: _stateAyarla(2),
        content: TextFormField(
          key: idKey,
          decoration: InputDecoration(
            hintText: "Kullanıcı adınızı giriniz.",
            labelText: "Kullanıcı Adı",
            //prefixIcon: Icon(Icons.account_circle_sharp),
          ),
          validator: (deger) {
            if (deger.length < 6) {
              return "En az 6 karakter girilmeli.";
            } else
              return null;
          },
          onSaved: (value) {
            id = value;
          },
        ),
      ),
      Step(
        title: Text("Şifre"),
        state: _stateAyarla(3),
        content: TextFormField(
          key: passKey,
          decoration: InputDecoration(
            hintText: "Şifrenizi giriniz.",
            labelText: "Şifre",
            //prefixIcon: Icon(Icons.account_circle_sharp),
          ),
          validator: (deger) {
            if (deger.length < 6) {
              return "En az 6 karakter girilmeli.";
            } else
              return null;
          },
          onSaved: (value) {
            password = value;
          },
        ),
      ),
      Step(
        title: Text("Email"),
        state: _stateAyarla(4),
        content: TextFormField(
          key: mailKey,
          decoration: InputDecoration(
            hintText: "Email adresi giriniz.",
            labelText: "Email",
            //prefixIcon: Icon(Icons.account_circle_sharp),
          ),
          validator: (deger) {
            if (deger.length < 6 && !deger.contains("@")) {
              return "Geçerli bir email adresi giriniz.";
            } else
              return null;
          },
          onSaved: (value) {
            email = value;
          },
        ),
      ),
      Step(
        title: Text("Telefon Numarası"),
        state: _stateAyarla(5),
        content: TextFormField(
          key: phoneKey,
          decoration: InputDecoration(
            hintText: "Telefon numaranızı giriniz.",
            labelText: "Telefon",
            //prefixIcon: Icon(Icons.account_circle_sharp),
          ),
          validator: (deger) {
            if (deger.length < 6) {
              return "En az 6 karakter girilmeli.";
            } else
              return null;
          },
          onSaved: (value) {
            phone = value;
          },
        ),
      ),
    ];
    return steps;
  }

  StepState _stateAyarla(int step) {
    if (_aktifStep == step) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  String _isMail(String mail) {
    RegExp regexp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (!regexp.hasMatch(mail))
      return "Geçersiz email adresi";
    else
      return null;
  }

  String _isName(String name) {
    RegExp exp = RegExp("^[a-zA-Z0-9ğüşöçİĞÜŞÖÇ]+");
    if (!exp.hasMatch(name))
      return "Numara kullanmayınız.";
    else
      return null;
  }
}

/*Scaffold(
      appBar: AppBar(
        title: Text(
          "Kayıt Ol",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Adınızı giriniz.",
                  labelText: "Ad",
                  prefixIcon: Icon(Icons.account_circle_sharp),
                ),
                onSaved: (value) => _ad = value,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Soyadınızı giriniz.",
                  labelText: "Soyad",
                  prefixIcon: Icon(Icons.account_circle_sharp),
                ),
                validator: (String data) {
                  if (data.length < 3) {
                    return "3 harften büyük olmalı.";
                  } else
                    return null;
                },
                onSaved: (value) => _soyad = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Kullanıcı adınızı giriniz.",
                  labelText: "Kullanıcı Adı",
                  prefixIcon: Icon(Icons.account_circle),
                ),
                validator: (String data) {
                  if (data.length < 3) {
                    return "3 harften büyük olmalı.";
                  } else
                    return null;
                },
                onSaved: (value) => _id = value,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Şifrenizi giriniz.",
                  labelText: "Şifre",
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (String data) {
                  if (data.length < 6) {
                    return "En az 6 karakter gerekli.";
                  } else
                    return null;
                },
                onSaved: (value) => _password = value,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email adresinizi giriniz.",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
                //validator: _isMail,
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Telefon numaranızı giriniz.",
                  labelText: "Telefon Numarası",
                  prefixIcon: Icon(Icons.phone),
                ),
                onSaved: (value) => _phone = value,
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    elevation: 12,
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      _confirmRegistration;
                      FocusScope.of(context).requestFocus(FocusNode());
                      /*Navigator.pushReplacementNamed(context, "/")
                              .then((popValue) {
                            debugPrint("$popValue");
                          });*/
                    },
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.pink.shade400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );*/
