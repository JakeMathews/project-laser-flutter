import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_lazer/data_capture/horizons_model/batch_file.dart';
import 'pages/target_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:project_lazer/data_capture/batch_file_parser.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TargetPage(loadDefaultBatchFile()),
    );
  }

  Future<BatchFile> loadDefaultBatchFile() async {
    final String batchFileText = await rootBundle.loadString('assets/batch_files/target_batch_1.txt');

    return new Future<BatchFile>(() {
      final BatchFileParser batchFileParser = new BatchFileParser();
      return batchFileParser.parseFromString(batchFileText);
    });
  }
}

