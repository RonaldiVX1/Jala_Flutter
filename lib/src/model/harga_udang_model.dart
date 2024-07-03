import 'package:ronaldi_jala_test/src/model/creator_model.dart';
import 'package:ronaldi_jala_test/src/model/region_model.dart';

class HargaUdangModel {
  int? id;
  int? speciesId;
  String? date;
  int? size20;
  int? size30;
  int? size40;
  int? size50;
  int? size60;
  int? size70;
  int? size80;
  int? size90;
  int? size100;
  int? size110;
  int? size120;
  int? size130;
  int? size140;
  int? size150;
  int? size160;
  int? size170;
  int? size180;
  int? size190;
  int? size200;
  String? remark;
  int? week;
  RegionModel? region;
  CreatorModel? creator;

  HargaUdangModel({
    this.id,
    this.speciesId,
    this.date,
    this.size20,
    this.size30,
    this.size40,
    this.size50,
    this.size60,
    this.size70,
    this.size80,
    this.size90,
    this.size100,
    this.size110,
    this.size120,
    this.size130,
    this.size140,
    this.size150,
    this.size160,
    this.size170,
    this.size180,
    this.size190,
    this.size200,
    this.remark,
    this.week,
    this.region,
    this.creator,
  });

  factory HargaUdangModel.fromJson(Map<String, dynamic> json) =>
      HargaUdangModel(
        id: json["id"],
        speciesId: json["species_id"],
        date: json["date"],
        size20: json["size_20"],
        size30: json["size_30"],
        size40: json["size_40"],
        size50: json["size_50"],
        size60: json["size_60"],
        size70: json["size_70"],
        size80: json["size_80"],
        size90: json["size_90"],
        size100: json["size_100"],
        size110: json["size_110"],
        size120: json["size_120"],
        size130: json["size_130"],
        size140: json["size_140"],
        size150: json["size_150"],
        size160: json["size_160"],
        size170: json["size_170"],
        size180: json["size_180"],
        size190: json["size_190"],
        size200: json["size_200"],
        remark: json["remark"],
        week: json["week"],
        region: json["region"] == null
            ? null
            : RegionModel.fromJson(json["region"]),
        creator: json["creator"] == null
            ? null
            : CreatorModel.fromJson(json["creator"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "species_id": speciesId,
        "date": date,
        "size_20": size20,
        "size_30": size30,
        "size_40": size40,
        "size_50": size50,
        "size_60": size60,
        "size_70": size70,
        "size_80": size80,
        "size_90": size90,
        "size_100": size100,
        "size_110": size110,
        "size_120": size120,
        "size_130": size130,
        "size_140": size140,
        "size_150": size150,
        "size_160": size160,
        "size_170": size170,
        "size_180": size180,
        "size_190": size190,
        "size_200": size200,
        "remark": remark,
        "week": week,
        "region": region?.toJson(),
        "creator": creator?.toJson(),
      };
}
