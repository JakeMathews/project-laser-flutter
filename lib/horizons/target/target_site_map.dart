import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/horizons/target/target_selection.dart';

class TargetSiteMap {
  final Map<int, HorizonsSite> sites = {};

  TargetSiteMap getSubset(final TargetSelection targetSelection) {
    final TargetSiteMap targetSiteMap = new TargetSiteMap();
    targetSelection.targetCodeWhiteList.forEach((final int targetCode) {
      targetSiteMap.sites[targetCode] = sites[targetCode];
    });

    targetSelection.targetCodeBlackList.forEach((final int targetCode) {
      targetSiteMap.sites.remove(targetCode);
    });

    return targetSiteMap;
  }
}
