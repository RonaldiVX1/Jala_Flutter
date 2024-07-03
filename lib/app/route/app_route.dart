import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ronaldi_jala_test/app/route/route_name.dart';
import 'package:ronaldi_jala_test/src/presentation/binding/dashboard_binding.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/dashboard_page.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/harga_udang/detail_harga_udang_page.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/kabar_udang/detail_kabar_udang_page.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/penyakit/detail_penyakit_page.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RouteName.detailHargaUdang,
      page: () => const DetailHargaUdangPage(),
    ),
    GetPage(
      name: RouteName.detailKabarUdang,
      page: () => const DetailKabarUdangPage(),
    ),
    GetPage(
      name: RouteName.detailPenyakit,
      page: () => const DetailPenyakitPage(),
    ),
  ];
}
