import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/horizons/target/target_selection.dart';

class TargetMap {
  final Map<int, HorizonsSite> sites = {};

  Map<int, HorizonsSite> getSubset(final TargetSelection targetSelection) {
    final Map<int, HorizonsSite> siteMap = {};
    targetSelection.targetCodeWhiteList.forEach((final int targetCode) {
      siteMap[targetCode] = sites[targetCode];
    });

    targetSelection.targetCodeBlackList.forEach((final int targetCode) {
      siteMap.remove(targetCode);
    });

    return siteMap;
  }
}
