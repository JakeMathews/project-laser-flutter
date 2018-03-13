import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_lazer/config.dart' as Config;
import 'package:project_lazer/horizons/batch_file/batch_file.dart';
import 'package:project_lazer/horizons/model/horizons_data.dart';
import 'package:project_lazer/horizons/model/horizons_site.dart';
import 'package:project_lazer/widgets/planet_card.dart';

class TargetPage extends StatelessWidget {
  final Map<String, HorizonsData> horizonsDataCache = {};

  TargetPage();

  @override
  Widget build(final BuildContext context) {
    final List<Widget> targets = <Widget>[];
    Config.targetSites.forEach((HorizonsSite targetSite) {
      PlanetCard planetCard =
          new PlanetCard(targetSite.targetName, targetSite.targetCode, onTapCallback: _onTargetSelected);
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
    getHorizonsData(planetCard.name, planetCard.targetCode).then((HorizonsData horizonsData) {
      // TODO: Send data over bluetooth
    });
  }

  Future<HorizonsData> getHorizonsData(final String targetName, final int targetCode) async {
    // TODO: (Longterm) Invalidate on location change as well
    // Do not make a request if cache is valid
    if (horizonsDataCache.containsKey(targetName)) {
      final HorizonsData horizonsData = horizonsDataCache[targetName];
      final DateTime expirationDateTime = horizonsData.requestedTime.add(Config.forecast);
      if (expirationDateTime.isAfter(new DateTime.now())) {
        return horizonsData;
      }
    }

    final BatchFile batchFile = await BatchFile.fromDefault();
    batchFile.setTarget(targetCode);
    batchFile.setStartTime(new DateTime.now());
    batchFile.setStopTime(new DateTime.now().add(Config.forecast));

    // Don't make requests until HorizonsData objects can be successfully built.
    // Otherwise we are hitting HORIZONS for no reason
    // final String horizonsDataString = await makeRequestToHorizons(batchFile);
    // final HorizonsDataParser horizonsDataParser = new HorizonsDataParser.withDefaultParsers();
    // final List<Object> horizonsDataObjects = horizonsDataParser.parse(horizonsDataString);

    return null; // TODO: Convert horizonsDataObjects to a HorizonsData object
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
