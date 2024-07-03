import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/src/presentation/controller/dashboard_controller.dart';
import 'package:ronaldi_jala_test/src/repositories/dashboard_repository.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardRepository(
      client: Get.find<Dio>(),
    ));

    Get.put(DashboardController(
      dashboardRepository: Get.find<DashboardRepository>(),
    ));
  }
}
