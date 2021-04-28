import 'package:flutter/material.dart';
import 'package:sipku/header.dart';
import 'package:sipku/page/riwayat/riwayat_card.dart';
import 'package:sipku/transaksi_new.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = .55;
  double _opacity = .9;

  void _tambahTransaksi() {
    setState(() {
      _height = .08;
      _opacity = 1;
    });
  }

  void _done() {
    setState(() {
      _height = .55;
      _opacity = .9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'SIPKU',
          style: TextStyle(
              fontSize: 30, fontFamily: 'Khang', fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.person))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Header(this._tambahTransaksi, this._done),
              TransaksiNew(opacity: _opacity, done: _done),
            ],
          ),
          Riwayat(_height)
        ],
      ),
    );
  }
}
