import 'package:flutter/material.dart';

class Riwayat {
  final int id;
  final String title;
  final double value;
  final String kategori;
  final IconData iconData;
  final Color color;

  const Riwayat(
      {@required this.id,
      @required this.title,
      @required this.value,
      @required this.kategori,
      @required this.iconData,
      @required this.color});
}

class Riwayats with ChangeNotifier {
  List<Riwayat> _riwayats = [
    Riwayat(
      id: 1,
      title: 'Transfer',
      value: 200.0,
      kategori: 'Transfer',
      iconData: Icons.attach_money,
      color: Color(0xffe850b),
    ),
    Riwayat(
      id: 2,
      title: 'Tarik Tunai',
      value: 300.0,
      kategori: 'Tarik Tunai',
      iconData: Icons.money_sharp,
      color: Color(0xffe850b),
    ),
  ];
  List<Riwayat> get riwayats {
    return _riwayats;
  }
}
