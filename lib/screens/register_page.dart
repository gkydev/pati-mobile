import 'package:flutter/material.dart';
import 'package:pati_mobile/models/UserDto.dart';
import 'package:pati_mobile/services/UserService.dart';

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
  bool isRegisterProcessing = false;

  var adKey = GlobalKey<FormFieldState>();
  var soyadKey = GlobalKey<FormFieldState>();
  var idKey = GlobalKey<FormFieldState>();
  var passKey = GlobalKey<FormFieldState>();
  var mailKey = GlobalKey<FormFieldState>();
  var phoneKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _allSteps();
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
              _continueButtonControl();
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
        isActive: true,
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
            if (deger.length < 3) {
              return "En az 3 karakter girilmeli.";
            } else
              return null;
          },
          onSaved: (value) {
            ad = value;
          },
        ),
      ),
      Step(
        isActive: true,
        title: Text("Soyad"),
        state: _stateAyarla(1),
        content: TextFormField(
          key: soyadKey,
          decoration: InputDecoration(
            hintText: "Soyadınızı giriniz.",
            labelText: "Soyad",
            prefixIcon: Icon(Icons.account_circle_sharp),
          ),
          validator: (deger) {
            if (deger.length < 3) {
              return "En az 3 karakter girilmeli.";
            } else
              return null;
          },
          onSaved: (value) {
            soyad = value;
          },
        ),
      ),
      Step(
        isActive: true,
        title: Text("Kullanıcı Adı"),
        state: _stateAyarla(2),
        content: TextFormField(
          key: idKey,
          decoration: InputDecoration(
            hintText: "Kullanıcı adınızı giriniz.",
            labelText: "Kullanıcı Adı",
            prefixIcon: Icon(Icons.account_circle),
          ),
          validator: (deger) {
            if (deger.length < 6) {
              return "En az 6 karakter giriniz.";
            } else if (deger.length > 12) {
              return "En fazla 12 karakter giriniz.";
            } else
              return null;
          },
          onSaved: (value) {
            id = value;
          },
        ),
      ),
      Step(
        isActive: true,
        title: Text("Şifre"),
        state: _stateAyarla(3),
        content: TextFormField(
          obscureText: true,
          key: passKey,
          decoration: InputDecoration(
            hintText: "Şifrenizi giriniz.",
            labelText: "Şifre",
            prefixIcon: Icon(Icons.lock),
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
        isActive: true,
        title: Text("Email"),
        state: _stateAyarla(4),
        content: TextFormField(
          keyboardType: TextInputType.emailAddress,
          key: mailKey,
          decoration: InputDecoration(
            hintText: "Email adresi giriniz.",
            labelText: "Email",
            prefixIcon: Icon(Icons.email),
          ),
          validator: _emailValidator,
          onSaved: (value) {
            email = value;
          },
        ),
      ),
      Step(
        isActive: true,
        title: Text("Telefon Numarası"),
        state: _stateAyarla(5),
        content: TextFormField(
          keyboardType: TextInputType.phone,
          key: phoneKey,
          decoration: InputDecoration(
            hintText: "Telefon numaranızı giriniz.",
            labelText: "Telefon",
            prefixIcon: Icon(Icons.phone_android_rounded),
          ),
          validator: _phoneNumberValidator,
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

  void _continueButtonControl() {
    switch (_aktifStep) {
      case 0:
        if (adKey.currentState.validate()) {
          adKey.currentState.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (soyadKey.currentState.validate()) {
          soyadKey.currentState.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (idKey.currentState.validate()) {
          idKey.currentState.save();
          hata = false;
          _aktifStep = 3;
        } else {
          hata = true;
        }
        break;
      case 3:
        if (passKey.currentState.validate()) {
          passKey.currentState.save();
          hata = false;
          _aktifStep = 4;
        } else {
          hata = true;
        }
        break;
      case 4:
        if (mailKey.currentState.validate()) {
          mailKey.currentState.save();
          hata = false;
          _aktifStep = 5;
        } else {
          hata = true;
        }
        break;
      case 5:
        if (phoneKey.currentState.validate()) {
          phoneKey.currentState.save();
          hata = false;
          _aktifStep = 5;
          completedForm();
        } else {
          hata = true;
        }
        break;
    }
  }

  void completedForm() {
    print(ad);

    UserService()
        .registerAsync(new UserDto(ad, soyad, email, phone, password))
        .then((res) {
          if (res.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/Login',
              (Route<dynamic> route) => false,
            );
          } else {
            print(res.message);
          }
    });
  }

  String _emailValidator(String mail) {
    RegExp regexp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (!regexp.hasMatch(mail))
      return "Geçersiz email adresi.";
    else
      return null;
  }

  String _letterValidator(String name) {
    RegExp exp = RegExp("^[a-zA-Z+ğüşöçİĞÜŞÖÇ]+");
    if (!exp.hasMatch(name))
      return "Sadece harf kullanınız.";
    else
      return null;
  }

  String _phoneNumberValidator(String value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = new RegExp(pattern);
    if (value.length != 11) {
      return 'Telefon numarası giriniz.';
    } else if (!regex.hasMatch(value)) {
      return 'Geçerli bir telefon numarası giriniz.';
    }
    return null;
  }
}
