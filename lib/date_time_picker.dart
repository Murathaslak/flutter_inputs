// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class TarihSaatOrnekState extends StatefulWidget {
  TarihSaatOrnekState({Key? key}) : super(key: key);

  @override
  State<TarihSaatOrnekState> createState() => _TarihSaatOrnekState();
}

class _TarihSaatOrnekState extends State<TarihSaatOrnekState> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay suankiSaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1997),
                  lastDate: DateTime(2023),
                ).then((secilenTarih) {
                  debugPrint(secilenTarih.toString());
                  debugPrint(secilenTarih!.toIso8601String());
                  debugPrint(secilenTarih.millisecondsSinceEpoch.toString());
                  debugPrint(secilenTarih.toUtc().toString());
                  debugPrint("20 GÜN EKLENMİŞ HALİ:" +
                      secilenTarih.add(Duration(days: 20)).toString());
                  debugPrint("20 GÜN CIKARILMIŞ HALİ" +
                      secilenTarih.subtract(Duration(days: 20)).toString());
                  var yeniDate =
                      (DateTime.parse(secilenTarih.toIso8601String()));

                  debugPrint(
                      formatDate(secilenTarih, [yyyy, "-", mm, "-", dd]));
                  debugPrint(
                      formatDate(secilenTarih, [dd, "/", mm, "/", yyyy]));
                });
              },
              child: Text("Tarih Seç"),
              color: Colors.green,
            ),
            RaisedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: suankiSaat)
                    .then((secilenSaat) {
                  //Yabancı tarz saat gösterimi
                  debugPrint(secilenSaat!.format(context));
                  // Alışkın olduğumuz 24 saat üzerinden gösterim
                  debugPrint(secilenSaat.hour.toString() +
                      ": " +
                      secilenSaat.minute.toString());
                });
              },
              child: Text("Saat Seç"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
