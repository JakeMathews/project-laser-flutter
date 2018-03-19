import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/horizons/target/target_map.dart';

class TargetMapParser {
  final RegExp genericRegExp = new RegExp(r'(-?\d+)\s*(.*)?');

  TargetMap parse(final String siteList) {
    final TargetMap targetMap = new TargetMap();

    for (final String rawLine in siteList.split('\n')) {
      final String line = rawLine.trim();

      if (line.startsWith('Number of matches')) {
        continue;
      }

      if (genericRegExp.hasMatch(line)) {
        final Match match = genericRegExp.firstMatch(line);
        final int targetCode = int.parse(match.group(1));
        String targetName = targetCode.toString();
        if (match.groupCount == 2) {
          final String name = match.group(2)?.trim();
          if (name != null) {
            targetName = name;
          }
        }
        final HorizonsSite horizonsSite = new HorizonsSite(targetName, targetCode);
        targetMap.sites[targetCode] = horizonsSite;
      }
    }

    return targetMap;
  }
}
