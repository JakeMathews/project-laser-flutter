import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_lazer/config.dart' as Config;
import 'package:project_lazer/horizons//horizons_data_parser.dart';
import 'package:project_lazer/horizons/batch_file/batch_file.dart';
import 'package:project_lazer/horizons/model/horizons_data.dart';
import 'package:project_lazer/widgets/planet_card.dart';

// TODO: A lot of horizons functionality is in this widget. Should probably be abstracted to its own package
class TargetPage extends StatelessWidget {
  final Map<String, HorizonsData> horizonsDataCache = {};

  TargetPage();

  @override
  Widget build(final BuildContext context) {
    final List<Widget> targets = <Widget>[];
    Config.targetBodies.forEach((name, targetCode) {
      PlanetCard planetCard = new PlanetCard(
          name, targetCode, onTapCallback: _onTargetSelected);
      targets.add(planetCard);
    });

    return new Material(
      color: Colors.blueGrey,
      child: new ListView(
        children: targets,
      ),
    );
  }

  void _onTargetSelected(final PlanetCard planetCard) {
    getHorizonsData(planetCard.name, planetCard.targetCode).then((
        HorizonsData horizonsResponse) {
      // TODO: send data over bluetooth
    });
  }

  Future<HorizonsData> getHorizonsData(final String targetName,
      final int targetCode) async {
    // TODO: Invalidate on location change as well
    // Do not make a request if cache is valid
    if (horizonsDataCache.containsKey(targetName)) {
      final HorizonsData horizonsData = horizonsDataCache[targetName];
      final DateTime expirationDateTime = horizonsData.requestedTime.add(
          Config.forecast);
      if (expirationDateTime.isAfter(new DateTime.now())) {
        return horizonsData;
      }
    }

    final BatchFile batchFile = await BatchFile.fromDefault();
    batchFile.setTarget(targetCode);
    batchFile.setStartTime(new DateTime.now());
    batchFile.setStopTime(new DateTime.now().add(Config.forecast));

    //final String horizonsDataString = await makeRequestToHorizons(batchFile);
    final HorizonsDataParser horizonsDataParser = new HorizonsDataParser
        .withDefaultParsers();
    final HorizonsData horizonsData = null;

    return horizonsData;
  }

  Future<String> makeRequestToHorizons(final BatchFile batchFile) async {
    final HttpClient httpClient = new HttpClient();
    final HttpClientRequest request = await httpClient.getUrl(
        batchFile.toHorizonsUri());
    print('Horizons URL: ${request.uri}');
    final HttpClientResponse response = await request.close();
    final String responseBody = await response.transform(UTF8.decoder).join();

    return responseBody;
  }
}
