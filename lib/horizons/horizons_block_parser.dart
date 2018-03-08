import 'package:project_lazer/horizons/model/horizons_block.dart';

abstract class HorizonsBlockParser<T extends HorizonsBlock> {
  bool parserApplies(String firstLine);

  T parse(String blockText);
}