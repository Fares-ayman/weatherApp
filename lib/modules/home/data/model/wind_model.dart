class WindModel {
  final double? speed;
  final int? deg;

  WindModel({this.speed, this.deg});

  factory WindModel.fromJson(dynamic json) {
    if (json == null) {
      return WindModel();
    }

    return WindModel(
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],
    );
  }
}
