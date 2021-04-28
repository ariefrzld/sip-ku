import 'package:flutter/material.dart';
import 'package:sipku/page/riwayat/riwayat_model.dart';

class RiwayatItem extends StatelessWidget {
  final Riwayat riwayat;
  const RiwayatItem(this.riwayat);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: riwayat.color.withOpacity(.8),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Icon(
            riwayat.iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(
          riwayat.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          riwayat.kategori,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Text(
          '\$${riwayat.value}',
          style: const TextStyle(
              fontSize: 12,
              color: Colors.red,
              fontFamily: 'Khang',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
