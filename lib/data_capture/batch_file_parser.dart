class BatchFileParser {
  Map<String, String> parseFromString(final String batchFileText) {
    final Map<String, String> parameters = {};
    // Splits on equals and removes inner whitespace
    // Group 1 is the parameter name and group 2 is parameter value without quotes
    final RegExp exp = new RegExp(r"(\w*) *= *'(.*)'");
    exp.allMatches(batchFileText).forEach((Match match) {
      final String parameterName = match.group(1).trim();
      final String parameterValue = match.group(2).trim();
      parameters.putIfAbsent(parameterName, () => parameterValue);
    });

    return parameters;
  }
}
