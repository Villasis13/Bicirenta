class SolicitudesModel {
  String? idSoli;
  String? personName;
  String? typeName;
  String? timeSoli;

  SolicitudesModel(
      {this.idSoli, this.personName, this.typeName, this.timeSoli});

  static List<SolicitudesModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => SolicitudesModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "id_solicitud": idSoli,
        "persona_nombre": personName,
        "nombre_tipo": typeName,
        "tiempo_solicitud": timeSoli,
      };

  factory SolicitudesModel.fromJson(Map<String, dynamic> json) =>
      SolicitudesModel(
        idSoli: json["id_solicitud"],
        personName: json["persona_nombre"],
        typeName: json["nombre_tipo"],
        timeSoli: json["tiempo_solicitud"],
      );
}
