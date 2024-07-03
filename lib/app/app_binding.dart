import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(
      Dio(
        BaseOptions(
          baseUrl: Endpoint.baseUrl,
          connectTimeout: const Duration(minutes: 1),
          followRedirects: false,
        ),
      )..interceptors.addAll([
          TalkerDioLogger(
            settings: TalkerDioLoggerSettings(
              printRequestHeaders: true,
              printResponseHeaders: true,
              printResponseMessage: true,
              // Blue http requests logs in console
              requestPen: AnsiPen()..blue(),
              // Green http responses logs in console
              responsePen: AnsiPen()..green(),
              // Error http logs in console
              errorPen: AnsiPen()..red(),
            ),
          ),
        ]),
      permanent: true,
    );
  }
}
