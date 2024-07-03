import 'package:ronaldi_jala_test/src/model/harga_udang_model.dart';

class HargaUdangListResponseModel {
  HargaUdangListResponseModel({required this.data});

  final List<HargaUdangModel> data;

  factory HargaUdangListResponseModel.fromJson(Map<String, dynamic> json) =>
      HargaUdangListResponseModel(
        data: List<HargaUdangModel>.from(
            json['data'].map((x) => HargaUdangModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
