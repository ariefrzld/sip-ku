import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sipku/riwayat.dart';
import 'package:sipku/riwayat_item.dart';

class Riwayat extends StatefulWidget {
  final double height;
  const Riwayat(this.height);

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  int _tgl = 16;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final providerRiwayats = Provider.of<Riwayats>(context);

    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * .03,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: mediaQuery.size.width * .94,
        height: mediaQuery.size.height * widget.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: const Text(
                      'Semua',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () => setState(() => _tgl--),
                          child: Icon(Icons.arrow_left),
                        ),
                        Text(
                          '$_tgl ${DateFormat('MMMM yyyy').format(DateTime.now())}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Khang',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () => setState(() => _tgl++),
                          child: Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: providerRiwayats.riwayats.length,
                  itemBuilder: (context, i) {
                    return RiwayatItem(providerRiwayats.riwayats[i]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
