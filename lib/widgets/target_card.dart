import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_lazer/config.dart' as Config;
import 'package:project_lazer/horizons/batch_file/batch_file.dart';
import 'package:project_lazer/horizons/horizons_data_parser.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_entry.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/horizons/model/horizons_data.dart';

import 'package:project_lazer/util/time_util.dart' as TimeUtil;

class TargetCard extends StatelessWidget {
  static final Map<int, HorizonsData> horizonsDataCache = {};
  final HorizonsSite targetSite;

  TargetCard(this.targetSite);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text(targetSite.targetName, textScaleFactor: 1.5),
            onTap: () {
              _onTargetSelected(context);
            },
          )
        ],
      ),
    );
  }

  void _onTargetSelected(final BuildContext context) {
    getHorizonsData(targetSite).then((final HorizonsData horizonsData) {
      final TableEntry tableEntry = horizonsData.tableBlock.getRoundedEntry(new DateTime.now().toUtc());

      Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('Azimuth: ${tableEntry.azimuth} | Elevation: ${tableEntry.elevation}'),
            duration: new Duration(seconds: 30),
            action: new SnackBarAction(
              label: "OKAY",
              onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
            ),
          ));

      // TODO: Send data over bluetooth
    });
  }

  Future<HorizonsData> getHorizonsData(final HorizonsSite targetSite) async {
    // TODO: (Long term) Invalidate on location change as well
    // Do not make a request if cache is valid
    if (horizonsDataCache.containsKey(targetSite.targetCode)) {
      final HorizonsData horizonsData = horizonsDataCache[targetSite.targetCode];
      final DateTime currentTime = new DateTime.now().toUtc();
      final DateTime expirationTime = horizonsData.requesterInfoBlock.requestedTime.add(Config.forecast);
      if (currentTime.isBefore(expirationTime)) {
        return horizonsData;
      }
    }

    final BatchFile batchFile = await BatchFile.fromDefault();
    batchFile.setTarget(targetSite.targetCode);
    final DateTime currentTime = TimeUtil.roundTime(new DateTime.now().toUtc(), Config.stepSize);
    batchFile.setStepSize(Config.stepSize);
    batchFile.setStartTime(currentTime);
    batchFile.setStopTime(currentTime.add(Config.forecast));

    final String horizonsDataString = await makeRequestToHorizons(batchFile);
    final HorizonsDataParser horizonsDataParser = new HorizonsDataParser.withDefaultParsers();
    final HorizonsData horizonsData = horizonsDataParser.parse(horizonsDataString);
    horizonsDataCache[targetSite.targetCode] = horizonsData;

    return horizonsData;
  }

  Future<String> makeRequestToHorizons(final BatchFile batchFile) async {
    final HttpClient httpClient = new HttpClient();
    final HttpClientRequest request = await httpClient.getUrl(batchFile.toHorizonsUri());
    print('Horizons URL: ${request.uri}');
    final HttpClientResponse response = await request.close();
    final String responseBody = await response.transform(UTF8.decoder).join();

    return responseBody;
  }
}
