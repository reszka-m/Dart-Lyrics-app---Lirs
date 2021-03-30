import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/albums_page/albums.dart';
import 'pages/home_page/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  Pizda.routeName: (context) => Pizda(),
};
