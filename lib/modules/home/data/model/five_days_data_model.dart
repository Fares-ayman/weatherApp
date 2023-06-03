class FiveDayDataModel {
  final String? dateTime;
  final int? temp;

  FiveDayDataModel({this.dateTime, this.temp});

  factory FiveDayDataModel.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayDataModel();
    }

    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    return FiveDayDataModel(
      dateTime: fandl,
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
