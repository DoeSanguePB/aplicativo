import 'package:doe_sangue_pb/pages/home_page.dart';
import 'package:doe_sangue_pb/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doe Sangue PB',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
    );
  }
}
