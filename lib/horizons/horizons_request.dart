import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:location/location.dart';
import 'package:project_lazer/horizons/batch_file/batch_file.dart';
import 'package:project_lazer/horizons/batch_file/coordinates.dart';
import 'package:project_lazer/horizons/horizons_data_parser.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/horizons/model/horizons_data.dart';
import 'package:project_lazer/horizons/model/blocks/table/table_entry.dart';

import 'package:project_lazer/config.dart' as Config;
import 'package:project_lazer/util/time_util.dart' as TimeUtil;

class HorizonsRequest {
  static final Map<int, HorizonsData> horizonsDataCache = {};

  Future<TableEntry> getCurrentHorizonsData(final HorizonsSite targetSite) async {
    final HorizonsData horizonsData = await getHorizonsData(targetSite);
    final TableEntry tableEntry = horizonsData.tableBlock?.getRoundedEntry(new DateTime.now().toUtc());

    return tableEntry;
  }

  Future<HorizonsData> getHorizonsData(final HorizonsSite targetSite) async {
    HorizonsData horizonsData = _getHorizonsDataFromCache(targetSite);

    if (horizonsData != null) {
      return horizonsData;
    }

    final BatchFile batchFile = await _generateBatchFile(targetSite);
    final String horizonsDataString = await _makeRequestToHorizons(batchFile);

    final HorizonsDataParser horizonsDataParser = new HorizonsDataParser.withDefaultParsers();
    horizonsData = horizonsDataParser.parse(horizonsDataString);

    if (horizonsData != null) {
      horizonsDataCache[targetSite.targetCode] = horizonsData;
    }

    return horizonsData;
  }

  // TODO: (Long term) Invalidate on location change as well
  // Do not make a request if cached has not expired
  HorizonsData _getHorizonsDataFromCache(final HorizonsSite targetSite) {
    if (horizonsDataCache.containsKey(targetSite.targetCode)) {
      final HorizonsData horizonsData = horizonsDataCache[targetSite.targetCode];
      final DateTime currentTime = new DateTime.now().toUtc();
      final DateTime expirationTime = horizonsData.requesterInfoBlock.requestedTime.add(Config.forecast);
      if (currentTime.isBefore(expirationTime)) {
        return horizonsData;
      }
    }

    return null;
  }

  Future<BatchFile> _generateBatchFile(final HorizonsSite targetSite) async {
    final BatchFile batchFile = await BatchFile.fromDefault();

    try {
      final Location location = new Location();
      final Map<String, double> currentLocation = await location.getLocation;
      final Coordinates coordinates = new Coordinates.fromMap(currentLocation);
      batchFile.setLocalSiteCoordinates(coordinates);
    } on Exception {
      // TODO: Provide the ability to manually supply location data
      // TODO: Notify the user of this error
      print('User location could not be determined. Using default location ${batchFile.getLocalSiteCoordinates()}');
    }

    batchFile.setTarget(targetSite.targetCode);
    final DateTime currentTime = TimeUtil.roundTime(new DateTime.now().toUtc(), Config.stepSize);
    batchFile.setStepSize(Config.stepSize);
    batchFile.setStartTime(currentTime);
    batchFile.setStopTime(currentTime.add(Config.forecast));

    return batchFile;
  }

  // TODO: Check if response is an error
  Future<String> _makeRequestToHorizons(final BatchFile batchFile) async {
    final HttpClient httpClient = new HttpClient();
    final HttpClientRequest request = await httpClient.getUrl(batchFile.toHorizonsUri());
    print('Horizons URL: ${request.uri}');
    final HttpClientResponse response = await request.close();
    final String responseBody = await response.transform(UTF8.decoder).join();

    return responseBody;
  }
}
