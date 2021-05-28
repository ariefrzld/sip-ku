import 'package:flutter/material.dart';
import 'package:sipku/helper/history_helper.dart';
import 'package:sipku/widgets/timeline_item.dart';

class Pengeluaran extends StatefulWidget {
  @override
  _PengeluaranState createState() => _PengeluaranState();
}

class _PengeluaranState extends State<Pengeluaran> {
  HistoryHelper historyHelper = HistoryHelper();
  List<History> listhistory = List();

  _allHstrForTipe() {
    historyHelper.getAllHistoryForTipe("d").then((list) {
      setState(() {
        listhistory = list;
      });
      print("All History: $listhistory");
    });
  }

  @override
  void initState() {
    super.initState();
    _allHstrForTipe();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0.8),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, top: width * 0.2),
              child: Text(
                "Pengeluaran",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.08),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, top: width * 0.08),
              child: SizedBox(
                width: width,
                height: height * 0.74,
                child: ListView.builder(
                  itemCount: listhistory.length,
                  itemBuilder: (context, index) {
                    List hstrReverse = listhistory.reversed.toList();
                    History hstr = hstrReverse[index];

                    if (hstrReverse[index] == hstrReverse.last) {
                      return TimeLineItem(
                        hstr: hstr,
                        colorItem: Colors.red[900],
                        isLast: true,
                      );
                    } else {
                      return TimeLineItem(
                        hstr: hstr,
                        colorItem: Colors.red[900],
                        isLast: false,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
