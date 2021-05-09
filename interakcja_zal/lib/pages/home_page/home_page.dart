import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/home_page/body1.dart';
import 'package:interakcja_zal/pages/results_page/tracksresults.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body1(),
    );
  }
}
