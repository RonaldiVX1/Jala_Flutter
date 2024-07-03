import 'package:ronaldi_jala_test/src/model/penyakit_model.dart';

class PenyakitListResponseModel {
  PenyakitListResponseModel({required this.data});

  final List<PenyakitModel> data;

  factory PenyakitListResponseModel.fromJson(Map<String, dynamic> json) =>
      PenyakitListResponseModel(
        data: List<PenyakitModel>.from(
            json['data'].map((x) => PenyakitModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
