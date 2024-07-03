import 'package:dio/dio.dart';
import 'package:ronaldi_jala_test/src/constants/bearer.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/model/penyakit_model.dart';
import 'package:ronaldi_jala_test/src/model/request/harga_udang_request_model.dart';
import 'package:ronaldi_jala_test/src/model/request/kabar_udang_request_model.dart';
import 'package:ronaldi_jala_test/src/model/request/penyakit_request_model.dart';
import 'package:ronaldi_jala_test/src/model/request/region_request_model.dart';
import 'package:ronaldi_jala_test/src/model/response/harga_udang_list_response_model.dart';
import 'package:ronaldi_jala_test/src/model/response/kabar_udang_list_response_model.dart';
import 'package:ronaldi_jala_test/src/model/response/penyakit_list_response_model.dart';
import 'package:ronaldi_jala_test/src/model/response/regon_list_response.dart';
import 'package:ronaldi_jala_test/src/utils/network_utils.dart';

class DashboardRepository {
  final Dio _client;

  DashboardRepository({
    required Dio client,
  }) : _client = client;

  Future<HargaUdangListResponseModel> getHargaUdang(
      HargaUdangRequestModel request) async {
    try {
      String endpoint = Endpoint.getHargaUdang;
      final responseJson = await _client.get(
        endpoint,
        queryParameters: request.toJson(),
      );
      return HargaUdangListResponseModel.fromJson(responseJson.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<KabarUdangListResponseModel> getKabarUdang(
      KabarUdangRequestModel request) async {
    try {
      String endpoint = Endpoint.getKabarUdang;
      final responseJson = await _client.get(
        endpoint,
        queryParameters: request.toJson(),
      );
      return KabarUdangListResponseModel.fromJson(responseJson.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<PenyakitListResponseModel> getPenyakitList(
      PenyakitRequestModel request) async {
    try {
      String endpoint = Endpoint.getPenyakit;
      final responseJson = await _client.get(endpoint,
          queryParameters: request.toJson(),
          options: NetworkingUtil.setupNetworkOptions(tokenBearer));
      return PenyakitListResponseModel.fromJson(responseJson.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<RegionListResponseModel> getRegion(RegionRequestModel request) async {
    try {
      String endpoint = Endpoint.getRegion;
      final responseJson = await _client.get(
        endpoint,
        queryParameters: request.toJson(),
      );
      return RegionListResponseModel.fromJson(responseJson.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
