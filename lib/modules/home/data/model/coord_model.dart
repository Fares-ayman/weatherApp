class CoordModel {
  final double? lon;
  final double? lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.fromJson(dynamic json) {
    if (json == null) {
      return CoordModel();
    }

    return CoordModel(lon: json['lon'], lat: json['lat']);
  }
}
