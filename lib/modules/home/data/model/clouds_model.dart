class CloudsModel {
  final int? all;

  CloudsModel({this.all});

  factory CloudsModel.fromJson(dynamic json) {
    if (json == null) {
      return CloudsModel();
    }

    return CloudsModel(
      all: json['all'],
    );
  }
}
