import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:sipku/helper/history_helper.dart';
import 'package:sipku/widgets/history_card.dart';
import 'package:sipku/widgets/custom_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentSaldo = "";
  var total;
  var width;
  var height;
  bool recDesp = false;
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  HistoryHelper hstrHelper = HistoryHelper();
  TextEditingController _valueController = TextEditingController();
  CalendarController calendarController;
  HistoryHelper historyHelper = HistoryHelper();
  List<History> listhistory = List();
  List<History> ultimaTaskRemoved = List();

  var currentDate = new DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  var formatterCalendar = new DateFormat('MM-yyyy');
  String formattedDate;

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  _addValue() {
    String value = _valueController.text;
    setState(() {
      currentSaldo = value;
    });
  }

  _saldoSize(String contents) {
    if (contents.length > 8) {
      return width * 0.08;
    } else {
      return width * 0.1;
    }
  }

  _salval() {
    formattedDate = formatter.format(currentDate);
    History hstr = History();
    hstr.value = 2050;
    hstr.tipe = "r";
    hstr.data = "10-03-2020";
    hstr.description = "CashBack";
    HistoryHelper historyHelper = HistoryHelper();
    historyHelper.saveHistory(hstr);
    hstr.toString();
  }

  _allMov() {
    historyHelper.getAllHistory().then((list) {
      setState(() {
        listhistory = list;
      });
      print("All History: $listhistory");
    });
  }

  _allHstrMe(String data) {
    historyHelper.getAllHistoryForMe(data).then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listhistory = list;
        });
        total = listhistory.map((item) => item.value).reduce((a, b) => a + b);
        currentSaldo = format(total).toString();
      } else {
        setState(() {
          listhistory.clear();
          total = 0;
          currentSaldo = total.toString();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
    if (DateTime.now().month != false) {}
    formattedDate = formatterCalendar.format(currentDate);
    print(formattedDate);
    _allHstrMe(formattedDate);
  }

  _dialogAddRecDesp() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    _allHstrMe(formattedDate);
    return Scaffold(
      key: _scafoldKey,
      body: SingleChildScrollView(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 0.334,
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.infinity,
                      height: height * 0.28,
                      decoration: BoxDecoration(
                        color: Color(0xFF1869de),
                      )),
                ),
                Positioned(
                  top: width * 0.18,
                  left: width * 0.07,
                  child: Text(
                    "SIPKU",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.100,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Khang'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: width * 0.07,
                  right: width * 0.07,
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 5,
                              offset: Offset(0, 2))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.05,
                            top: width * 0.04,
                            bottom: width * 0.02,
                          ),
                          child: Text(
                            "Saldo",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: width * 0.05),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: Container(
                                width: width * 0.6,
                                child: Text(
                                  "Rp ${currentSaldo}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF1869de),
                                    fontWeight: FontWeight.bold,
                                    fontSize: _saldoSize(currentSaldo),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.04),
                              child: GestureDetector(
                                onTap: () {
                                  _dialogAddRecDesp();
                                },
                                child: Container(
                                  width: width * 0.12,
                                  height: width * 0.12,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF1869de),
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 7,
                                          offset: Offset(2, 2),
                                        )
                                      ]),
                                  child: Icon(
                                    Icons.add,
                                    size: width * 0.07,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.008,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            TableCalendar(
              calendarController: calendarController,
              locale: "en_US",
              headerStyle: HeaderStyle(
                formatButtonShowsNext: false,
                formatButtonVisible: false,
                centerHeaderTitle: true,
              ),
              calendarStyle: CalendarStyle(outsideDaysVisible: false),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.transparent),
                weekendStyle: TextStyle(color: Colors.transparent),
              ),
              rowHeight: 0,
              initialCalendarFormat: CalendarFormat.month,
              onVisibleDaysChanged: (dateFirst, dateLast, CalendarFormat cf) {
                print(dateFirst);

                formattedDate = formatterCalendar.format(dateFirst);
                _allHstrMe(formattedDate);

                print("FORMATTED DATE CALENDAR $formattedDate");
              },
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Riwayat",
                      style: TextStyle(
                          color: Colors.grey[600], fontSize: width * 0.04),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: Icon(
                        Icons.sort,
                        size: width * 0.07,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04, right: width * 0.04, top: 0),
              child: SizedBox(
                width: width,
                height: height * 0.47,
                child: ListView.builder(
                  itemCount: listhistory.length,
                  itemBuilder: (context, index) {
                    History hstr = listhistory[index];
                    History ultHstr = listhistory[index];
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          listhistory.removeAt(index);
                        });
                        hstrHelper.deleteHistory(hstr);
                        final snackBar = SnackBar(
                          content: Container(
                            padding: EdgeInsets.only(bottom: width * 0.025),
                            alignment: Alignment.bottomLeft,
                            height: height * 0.05,
                            child: Text(
                              "Batalkan hapus?",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.05),
                            ),
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.orange[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          action: SnackBarAction(
                            label: "Batalkan",
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                listhistory.insert(index, ultHstr);
                              });

                              hstrHelper.saveHistory(ultHstr);
                            },
                          ),
                        );
                        _scafoldKey.currentState.showSnackBar(snackBar);
                      },
                      key: ValueKey(hstr.id),
                      background: Container(
                        padding: EdgeInsets.only(right: 10, top: width * 0.04),
                        alignment: Alignment.topRight,
                        color: Colors.red,
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: width * 0.07,
                        ),
                      ),
                      child: HistoryCard(
                        hstr: hstr,
                        lastItem: listhistory[index] == listhistory.last
                            ? true
                            : false,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            )
          ],
        ),
      ),
    );
  }
}
