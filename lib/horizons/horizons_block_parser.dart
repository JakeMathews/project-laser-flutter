abstract class HorizonsBlockParser<T extends Object> {
  bool parserApplies(String firstLine);

  T parse(String blockText);
}