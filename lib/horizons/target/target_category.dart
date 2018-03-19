import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';

class TargetCategory {
  final String name;
  final Map<int, HorizonsSite> targetSiteMap;

  TargetCategory(this.name, this.targetSiteMap);
}
