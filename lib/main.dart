import 'package:flutter/material.dart';
import 'pages/target_page.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TargetPage(),
    );
  }
}

