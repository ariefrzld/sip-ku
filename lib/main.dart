import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sipku/screen/initialpage.dart';

main() {
  initializeDateFormatting().then((_) {
    runApp(MaterialApp(
      home: InitialPage(),
      debugShowCheckedModeBanner: false,
    ));
  });
}
