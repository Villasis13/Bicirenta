class TypeBicyModel {
  String? idTypeBicy;
  String? nameTypeBicy;

  TypeBicyModel({this.idTypeBicy, this.nameTypeBicy});

  static List<TypeBicyModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => TypeBicyModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "id_tipobicicleta": idTypeBicy,
        "nombre_tipo": nameTypeBicy,
      };

  factory TypeBicyModel.fromJson(Map<String, dynamic> json) => TypeBicyModel(
        idTypeBicy: json["id_tipobicicleta"],
        nameTypeBicy: json["nombre_tipo"],
      );
}
