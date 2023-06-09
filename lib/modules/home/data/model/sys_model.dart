class SysModel {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysModel({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory SysModel.fromJson(dynamic json) {
    if (json == null) {
      return SysModel();
    }

    return SysModel(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
