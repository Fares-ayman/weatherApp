class WeatherModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.fromJson(dynamic json) {
    if (json == null) {
      return WeatherModel();
    }

    return WeatherModel(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}
