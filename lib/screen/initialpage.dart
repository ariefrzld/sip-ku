import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipku/screen/home_page.dart';
import 'package:sipku/screen/income.dart';
import 'package:sipku/screen/spending.dart';
import 'package:sipku/widgets/animated_bottom_navbar.dart';

class InitialPage extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Pengeluaran",
      iconData: Icons.remove_circle_outline,
      color: Colors.redAccent,
    ),
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Pemasukan",
      iconData: Icons.add_circle_outline,
      color: Colors.teal,
    ),
  ];

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int selectedBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    List<Widget> screens = [Pengeluaran(), HomePage(), Pemasukan()];
    return Scaffold(
      body: screens[selectedBarIndex],
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 150),
        barStyle: BarStyle(fontSize: width * 0.045, iconSize: width * 0.07),
        onBarTap: (index) {
          setState(() {
            selectedBarIndex = index;
          });
        },
      ),
    );
  }
}
