// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  StepperOrnek({Key? key}) : super(key: key);

  @override
  State<StepperOrnek> createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifStep = 0;
  String? isim, mail, sifre;

  late List<Step> tumStepler;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  bool hata = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Örnek"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context,
              {onStepContinue, onStepCancel}) {
            return Row(
              children: [
                RaisedButton(
                  color: Colors.green,
                  onPressed: onStepContinue,
                  child: const Text("Devam"),
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  onPressed: onStepCancel,
                  color: Colors.pink,
                  child: const Text("Geri Gel"),
                )
              ],
            );
          },
          steps: tumStepler,
          currentStep: _aktifStep,
          /*onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          },*/
          onStepContinue: () {
            setState(() {
              _ileriButonuKontrolu();
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

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username title"),
        subtitle: Text("Username Subtitle"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
              labelText: "UsernameLabel",
              hintText: "UsernameHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length <= 5) {
              return "Username en az 6 karakter olmalı!";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Mail title"),
        subtitle: Text("Mail Subtitle"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
              labelText: "MailLabel",
              hintText: "MailHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 5 || !girilenDeger.contains("@")) {
              return "Geçerli mail adresi giriniz.";
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Şifre title"),
        subtitle: Text("Şifre Subtitle"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
              labelText: "ŞifreLabel",
              hintText: "ŞifreHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "Şifre En az 6 karakter olmalı.";
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int i) {
    if (_aktifStep == i) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else
      return StepState.complete;
  }

  void _ileriButonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;

      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifStep = 2;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    String result = "Username: $isim\n E-mail:$mail\n Sfire: $sifre";

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade300,
      content: Text(
        result,
        style: TextStyle(fontSize: 15),
      ),
    ));
    debugPrint("Girilen değerler : İsim: $isim / Mail: $mail / Şifre: $sifre");
  }
}
