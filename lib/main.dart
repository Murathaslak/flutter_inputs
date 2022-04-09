// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_inputs/date_time_picker.dart';
import 'package:flutter_inputs/diger_form_elemanlari.dart';
import 'package:flutter_inputs/global_key_kullanimi.dart';
import 'package:flutter_inputs/stepper_kullanimi.dart';
import 'package:flutter_inputs/text_form_field_kullanimi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: StepperOrnek(),
    );
  }
}

class TextFieldIslemleri extends StatefulWidget {
  final String title;
  const TextFieldIslemleri({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;
  @override
  void initState() {
    super.initState();
    _emailController =
        TextEditingController(text: "murathaslak@windowslive.com");
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: maxLineCount,
              maxLength: 20,
              // Her yazılanı tek tek alır iletir
              onChanged: (String value) {
                if (value.length > 3) {
                  setState(() {
                    _emailController.value = TextEditingValue(
                        text: value,
                        selection:
                            TextSelection.collapsed(offset: value.length));
                  });
                }
              },
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                labelText: "Label Text",
                hintText: "Email giriniz",
                hintStyle: TextStyle(fontSize: 19),
                //icon: Icon(Icons.add),
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.access_alarm_outlined),
                filled: true,
                fillColor: Colors.orange.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
              // Yazılan onaylanınca komple olarak alır
              onSubmitted: (String deger) {
                print("Onaylandı:" + deger);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailController.text = "murathaslak";
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
