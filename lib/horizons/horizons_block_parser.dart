abstract class HorizonsBlockParser {
  bool parserApplies(String firstLine);

  Object parse(String blockText);
}