import 'package:flutter/material.dart';

import '../../home/home.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/': return HomePage.route();
    //
    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
      });
  }
}
