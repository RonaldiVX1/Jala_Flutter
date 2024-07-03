class RegionModel {
  String? id;
  String? name;
  int? type;
  String? latitude;
  String? longitude;
  String? countryId;
  String? countryName;
  String? countryNameUppercase;
  String? provinceId;
  String? provinceName;
  String? regencyId;
  String? regencyName;
  String? districtId;
  String? districtName;
  String? villageId;
  String? villageName;
  String? fullName;
  String? nameTranslated;
  String? countryNameTranslated;
  String? countryNameTranslatedUppercase;

  RegionModel({
    this.id,
    this.name,
    this.type,
    this.latitude,
    this.longitude,
    this.countryId,
    this.countryName,
    this.countryNameUppercase,
    this.provinceId,
    this.provinceName,
    this.regencyId,
    this.regencyName,
    this.districtId,
    this.districtName,
    this.villageId,
    this.villageName,
    this.fullName,
    this.nameTranslated,
    this.countryNameTranslated,
    this.countryNameTranslatedUppercase,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        countryNameUppercase: json["country_name_uppercase"],
        provinceId: json["province_id"],
        provinceName: json["province_name"],
        regencyId: json["regency_id"],
        regencyName: json["regency_name"],
        districtId: json["district_id"],
        districtName: json["district_name"],
        villageId: json["village_id"],
        villageName: json["village_name"],
        fullName: json["full_name"],
        nameTranslated: json["name_translated"],
        countryNameTranslated: json["country_name_translated"],
        countryNameTranslatedUppercase:
            json["country_name_translated_uppercase"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "country_id": countryId,
        "country_name": countryName,
        "country_name_uppercase": countryNameUppercase,
        "province_id": provinceId,
        "province_name": provinceName,
        "regency_id": regencyId,
        "regency_name": regencyName,
        "district_id": districtId,
        "district_name": districtName,
        "village_id": villageId,
        "village_name": villageName,
        "full_name": fullName,
        "name_translated": nameTranslated,
        "country_name_translated": countryNameTranslated,
        "country_name_translated_uppercase": countryNameTranslatedUppercase,
      };
}
