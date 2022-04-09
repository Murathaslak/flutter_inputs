// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unused_import

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  _TextFormFieldKullanimiState createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = "", _password = "", _userName = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Textform field kullanimi"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Divider(),
                  TextFormField(
                    //initialValue: "murathaslak",
                    decoration: InputDecoration(
                        //errorStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(),
                        labelText: "Username",
                        hintText: "Username"),
                    onSaved: (deger) {
                      _userName = deger!;
                    },
                    validator: (deger) {
                      if (deger!.isEmpty) {
                        return "Username boş olamaz";
                      }
                      if (deger.length < 4) {
                        return "Username en az 4 karakter olmalı";
                      } else
                        return null;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    //initialValue: "murathaslak@windowslive.com",
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        //errorStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(),
                        labelText: "E-mail",
                        hintText: "E-mail"),
                    onSaved: (deger) {
                      _email = deger!;
                    },
                    validator: (deger) {
                      if (deger!.isEmpty) {
                        return "E-mail boş olamaz";
                      }
                      if (!EmailValidator.validate(deger)) {
                        return "Geçerli mail giriniz:";
                      } else
                        return null;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    //initialValue: "murathaslak",
                    decoration: InputDecoration(
                        //errorStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Password"),
                    onSaved: (deger) {
                      _password = deger!;
                    },
                    validator: (deger) {
                      if (deger!.isEmpty) {
                        return "Password boş olamaz";
                      }
                      if (deger.length < 6) {
                        return "Password en az 6 karakter olmalı";
                      } else
                        return null;
                    },
                  ),
                  Divider(),
                  ElevatedButton(
                    onPressed: () {
                      bool _validate = _formKey.currentState!.validate();
                      if (_validate) {
                        _formKey.currentState!.save();
                        String result =
                            "Username:$_userName\nE-mail:$_email\nSfire:$_password";

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.orange.shade300,
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 15),
                          ),
                        ));
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text("Onayla"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
