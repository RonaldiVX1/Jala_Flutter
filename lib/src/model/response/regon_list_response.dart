import 'package:ronaldi_jala_test/src/model/region_model.dart';

class RegionListResponseModel {
  RegionListResponseModel({required this.data});

  final List<RegionModel> data;

  factory RegionListResponseModel.fromJson(Map<String, dynamic> json) =>
      RegionListResponseModel(
        data: List<RegionModel>.from(
            json['data'].map((x) => RegionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
