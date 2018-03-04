import 'package:flutter/material.dart';
import 'package:project_lazer/data_capture/batch_file.dart';
import 'pages/target_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:project_lazer/data_capture/batch_file_parser.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    rootBundle.loadString('assets/batch_files/target_batch_1.txt').then((String batchFileText) {
      final BatchFileParser batchFileParser = new BatchFileParser();
      final BatchFile batchFile = batchFileParser.parseFromString(batchFileText);
    });

    return new MaterialApp(
      home: new TargetPage(),
    );
  }
}