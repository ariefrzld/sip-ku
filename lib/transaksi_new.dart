import 'package:flutter/material.dart';

class TransaksiNew extends StatefulWidget {
  final double opacity;
  final Function done;

  TransaksiNew({Key key, this.opacity, this.done}) : super(key: key);

  @override
  _TransaksiNewState createState() => _TransaksiNewState();
}

class _TransaksiNewState extends State<TransaksiNew> {
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Expanded(
      child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 40),
          color: Colors.white.withOpacity(widget.opacity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadioTile,
                        onChanged: (val) {
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.blue,
                      ),
                      Text('Pemasukan'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: selectedRadioTile,
                        onChanged: (val) {
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.blue,
                      ),
                      Text('Pengeluaran'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(8),
                          hintText: 'Kategori'),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(8),
                          hintText: 'Nominal'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextField(
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(8),
                    hintText: 'Catatan / Keterangan'),
              ),
              const SizedBox(height: 20),
              RaisedButton.icon(
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: widget.done,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  'Simpan',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
