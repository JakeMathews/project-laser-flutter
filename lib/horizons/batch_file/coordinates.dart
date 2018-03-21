class Coordinates {
  final double latitude;
  final double longitude;
  final double elevation;

  Coordinates(this.longitude, this.latitude, {this.elevation = 0.0});

  Coordinates.fromString(final String coordinates)
      : this.latitude = double.parse(coordinates.split(',')[0]),
        this.longitude = double.parse(coordinates.split(',')[1]),
        this.elevation = double.parse(coordinates.split(',')[2]);

  Coordinates.fromMap(final Map<String, double> coordinates)
      : this.latitude = coordinates['latitude'] != null ? coordinates['latitude'] : 0.0,
        this.longitude = coordinates['longitude'] != null ? coordinates['longitude'] : 0.0,
        this.elevation = coordinates['elevation'] != null ? coordinates['elevation'] : 0.0;

  List<double> _getAsList() {
    return [longitude, latitude, elevation];
  }

  @override
  String toString() {
    List<String> coordinatesAsString = new List.from(_getAsList().map((coordinate) {
      if (coordinate > 0) {
        return '+${coordinate.toString()}';
      } else {
        return coordinate.toString();
      }
    }));

    return coordinatesAsString.join(',');
  }
}
