// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CheckboxListTileKullanimi extends StatefulWidget {
  CheckboxListTileKullanimi({Key? key}) : super(key: key);

  @override
  State<CheckboxListTileKullanimi> createState() =>
      _CheckboxListTileKullanimiState();
}

class _CheckboxListTileKullanimiState extends State<CheckboxListTileKullanimi> {
  bool checkBoxState = false;
  bool checkBoxRenkDegisimi = false;
  String sehir = "";
  bool switchState = false;
  bool switchListTileRenkDegisimi = false;
  double sliderDeger = 10;

  String? dropdownValue = "";
  String? listlidropdownValue = "Muş";
  String hintText = "Kirmizi";

  List<String> sehirler = ["Ankara", "Bursa", "Edirne", "Muş"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: Text("Diğer Form Elemanlari"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi!;
                  checkBoxRenkDegisimi = secildi;
                });
              },
              activeColor: Colors.purple,
              title: Text("Checkbox Title"),
              subtitle: Text("Checkbox Subtitle"),
              secondary: Icon(Icons.add),
              selected: checkBoxRenkDegisimi,
            ),
            RadioListTile<String>(
              value: "Adana",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Secilen Deger: $deger");
                });
              },
              title: Text("Adana"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "Ankara",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Secilen Deger: $deger");
                });
                debugPrint("Secilen Deger: $deger");
              },
              title: Text("Ankara"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "Bursa",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Secilen Deger: $deger");
                });
                debugPrint("Secilen Deger: $deger");
              },
              title: Text("Bursa"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  switchState = deger;
                  switchListTileRenkDegisimi = deger;
                });
              },
              title: Text("Switch Title"),
              subtitle: Text("Switch Subtitle"),
              secondary: Icon(Icons.ac_unit),
              activeColor: Colors.purple,
              selected: switchListTileRenkDegisimi,
              selectedTileColor: Colors.blueAccent,
            ),
            Text("Değeri sliderdan seciniz"),
            Slider(
              value: sliderDeger,
              onChanged: (deger) {
                setState(() {
                  sliderDeger = deger;
                  debugPrint(sliderDeger.toString());
                });
              },
              min: 10,
              max: 20,
              divisions: 20,
              label: sliderDeger.toString(),
              inactiveColor: Colors.red,
              thumbColor: Colors.blue,
            ),
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 20,
                        height: 20,
                        color: Colors.red,
                      ),
                      Text("Kırmızı"),
                      Icon(Icons.redeem_sharp),
                    ],
                  ),
                  value: "Kirmizi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 20,
                        height: 20,
                        color: Colors.blue,
                      ),
                      Text("Mavi"),
                      Icon(Icons.ac_unit_sharp),
                    ],
                  ),
                  value: "Mavi",
                ),
                DropdownMenuItem<String>(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 20,
                          height: 20,
                          color: Colors.green,
                        ),
                        Text("Yeşil"),
                        Icon(Icons.adb_outlined),
                      ],
                    ),
                  ),
                  value: "Yeşil",
                ),
              ],
              onChanged: (value) {
                debugPrint("Seçilen: $value");
                setState(() {
                  hintText = value!;
                });
              },
              hint: Text("Seçiniz"),
              value: hintText,
            ),

            //DropdownButton da ilk çalıştırmada yazacak değer
            // Lisetemizin içinde olan bir değer olmalı
            // Farklı olunca hata veriyor
            DropdownButton<String>(
              items: sehirler.map((e) {
                return DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (s) {
                setState(() {
                  listlidropdownValue = s!;
                  debugPrint("Seçilen: $s");
                });
              },
              value: listlidropdownValue,
            ),
          ],
        ),
      ),
    );
  }
}
