import 'package:flutter/material.dart';

import 'pages/target_page.dart';
import 'package:project_lazer/config.dart' as Config;

void main() => runApp(new App());

// TODO: Replace print in application with logs
class App extends StatelessWidget {
  App() {
    Config.init();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TargetPage(),
      theme: new ThemeData.dark(),
    );
  }
}
