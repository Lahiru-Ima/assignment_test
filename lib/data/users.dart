class User {
  User({
    required this.statusCode,
    required this.timestamp,
    required this.message,
    required this.data,
    this.error,
    required this.version,
  });

  int statusCode;
  DateTime timestamp;
  String message;
  Data data;
  dynamic error;
  String version;
  factory User.fromJson(Map<String, dynamic> json) => User(
        statusCode: json["status_code"],
        timestamp: DateTime.parse(json["timestamp"]),
        message: json["message"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
        version: json["version"],
      );
}

class Data {
  Data({
    required this.datatable,
  });
  List<Datatable> datatable;
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        datatable: List<Datatable>.from(
            json["datatable"].map((x) => Datatable.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "datatable": List<dynamic>.from(datatable.map((x) => x.toJson())),
      };
}

class Datatable {
  Datatable({
    required this.actualName,
    required this.shortName,
    required this.allowDecimal,
    required this.id,
    this.baseUnitId,
    this.baseUnitMultiplier,
    this.baseUnit,
  });

  String actualName;
  String shortName;
  int allowDecimal;
  int id;
  dynamic baseUnitId;
  dynamic baseUnitMultiplier;
  dynamic baseUnit;

  factory Datatable.fromJson(Map<String, dynamic> json) => Datatable(
        actualName: json["actual_name"],
        shortName: json["short_name"],
        allowDecimal: json["allow_decimal"],
        id: json["id"],
        baseUnitId: json["base_unit_id"],
        baseUnitMultiplier: json["base_unit_multiplier"],
        baseUnit: json["base_unit"],
      );

  Map<String, dynamic> toJson() => {
        "actual_name": actualName,
        "short_name": shortName,
        "allow_decimal": allowDecimal,
        "id": id,
        "base_unit_id": baseUnitId,
        "base_unit_multiplier": baseUnitMultiplier,
        "base_unit": baseUnit,
      };
}
