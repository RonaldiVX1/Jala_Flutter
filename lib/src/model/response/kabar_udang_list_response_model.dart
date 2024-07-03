import 'package:ronaldi_jala_test/src/model/kabar_udang_model.dart';

class KabarUdangListResponseModel {
  KabarUdangListResponseModel({required this.data});

  final List<KabarUdangModel> data;

  factory KabarUdangListResponseModel.fromJson(Map<String, dynamic> json) =>
      KabarUdangListResponseModel(
        data: List<KabarUdangModel>.from(
            json['data'].map((x) => KabarUdangModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
