class Coordinates {
  final double latitude;
  final double longitude;
  final double elevation;

  Coordinates(this.latitude, this.longitude, {this.elevation = 0.0});

  List<double> getAsList() {
    return [latitude, longitude, elevation];
  }

  @override
  String toString() {
    List<String> coordinatesAsString = new List.from(getAsList().map((coordinate) {
      if (coordinate > 0) {
        return '+${coordinate.toString()}';
      } else {
        return coordinate.toString();
      }
    }));

    return coordinatesAsString.join(',');
  }
}
