// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';

class GlobalKeyKullanimi extends StatelessWidget {
  GlobalKeyKullanimi({Key? key}) : super(key: key);

  final sayacWidgetKey = GlobalKey<_SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    print("1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona basılma miktarı:"),
            SayacWidget(
              key: sayacWidgetKey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SayacWidget extends StatefulWidget {
  SayacWidget({Key? key}) : super(key: key);

  @override
  State<SayacWidget> createState() => _SayacWidgetState();
}

class _SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;
  void arttir() {
    setState(() {
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("2");
    return Text(
      _sayac.toString(),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
