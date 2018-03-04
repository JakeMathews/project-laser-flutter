import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_lazer/data_capture/horizons_model/batch_file.dart';
import 'package:project_lazer/data_capture/horizons_model/horizons_data.dart';
import 'package:project_lazer/main.dart';
import 'package:project_lazer/widgets/planet_card.dart';
import 'package:project_lazer/config.dart' as Config;

// TODO: A lot of horizons functionality is in this widget. Should probably be abstracted to its own package
class TargetPage extends StatelessWidget {
  final Future<BatchFile> batchFileFuture;
  final Map<String, HorizonsData> horizonsDataCache = {};

  TargetPage(this.batchFileFuture);

  @override
  Widget build(final BuildContext context) {
    final List<Widget> targets = <Widget>[];
    Config.targetBodies.forEach((name, targetCode) {
      PlanetCard planetCard = new PlanetCard(name, targetCode, onTapCallback: _onTargetSelected);
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
    getHorizonsData(planetCard.name, planetCard.targetCode).then((HorizonsData horizonsResponse) {
      // TODO: send data over bluetooth
    });
  }

  Future<HorizonsData> getHorizonsData(final String targetName, final int targetCode) async {
    // TODO: Invalidate on location change as well
    // Do not make a request if cache is valid
    if (horizonsDataCache.containsKey(targetName)) {
      final HorizonsData horizonsData = horizonsDataCache[targetName];
      final DateTime expirationDateTime = horizonsData.requestedTime.add(Config.forecast);
      if (expirationDateTime.isAfter(new DateTime.now())) {
        return horizonsData;
      }
    }

    // TODO: Don't use the same batchFile every time. Perhaps a named constructor to create a copy from defaults
    final BatchFile batchFile = await batchFileFuture;
    batchFile.setTarget(targetCode);
    batchFile.setStartTime(new DateTime.now());
    batchFile.setStopTime(new DateTime.now().add(Config.forecast));

    final String horizonsDataString = await makeRequestToHorizons(batchFile);
    print(horizonsDataString);
    final HorizonsData horizonsData = null;

    return horizonsData;
  }

  Future<String> makeRequestToHorizons(final BatchFile batchFile) async {
    final HttpClient httpClient = new HttpClient();
    final HttpClientRequest request = await httpClient.getUrl(batchFile.toHorizonsUri());
    print(request.uri);
    final HttpClientResponse response = await request.close();
    final String responseBody = await response.transform(UTF8.decoder).join();

    return responseBody;
  }
}
