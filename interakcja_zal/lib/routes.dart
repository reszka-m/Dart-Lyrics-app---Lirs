
import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/home_page/pizda.dart';

import 'pages/home_page/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  Pizda.routeName: (context) => Pizda(),
};
