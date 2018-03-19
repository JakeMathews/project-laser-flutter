import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';

final List<HorizonsSite> targetSites = [
  new HorizonsSite('The Sun', 10),
  new HorizonsSite('Mercury', 199),
  new HorizonsSite('Venus', 299),
  new HorizonsSite('The Moon', 301),
  new HorizonsSite('Mars', 499),
  new HorizonsSite('Jupiter', 599),
  new HorizonsSite('Saturn', 699),
  new HorizonsSite('Uranus', 799),
  new HorizonsSite('Neptune', 899),
  new HorizonsSite('Pluto', 999),
];

final Duration forecast = new Duration(hours: 3);
final Duration stepSize = new Duration(minutes: 5);
