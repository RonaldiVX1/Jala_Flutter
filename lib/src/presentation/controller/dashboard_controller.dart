import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/model/harga_udang_model.dart';
import 'package:ronaldi_jala_test/src/model/kabar_udang_model.dart';
import 'package:ronaldi_jala_test/src/model/penyakit_model.dart';
import 'package:ronaldi_jala_test/src/model/region_model.dart';
import 'package:ronaldi_jala_test/src/model/request/harga_udang_request_model.dart';
import 'package:ronaldi_jala_test/src/model/request/kabar_udang_request_model.dart';
import 'package:ronaldi_jala_test/src/model/request/penyakit_request_model.dart';
import 'package:ronaldi_jala_test/src/model/request/region_request_model.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/widgets/snackbar.dart';
import 'package:ronaldi_jala_test/src/repositories/dashboard_repository.dart';
import 'package:ronaldi_jala_test/src/utils/number_ext.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final DashboardRepository _dashboardRepository;

  DashboardController({required DashboardRepository dashboardRepository})
      : _dashboardRepository = dashboardRepository;

  late TabController controller;

  final regionTextController = TextEditingController();

  late WebViewController webViewDetailKabarController;
  late WebViewController webViewPenyakitController;

  final _hargaUdang = Rx<List<HargaUdangModel>>([]);

  List<HargaUdangModel> get hargaUdang => _hargaUdang.value;

  final _kabarUdang = Rx<List<KabarUdangModel>>([]);

  List<KabarUdangModel> get kabarUdang => _kabarUdang.value;

  final _penyakit = Rx<List<PenyakitModel>>([]);

  List<PenyakitModel> get penyakit => _penyakit.value;

  final _isLoadingRetrieveData = false.obs;

  bool get isLoadingRetrieveProduct => _isLoadingRetrieveData.value;

  final allCity = Rx<List>([]);

  final _region = Rx<List<RegionModel>>([]);

  List<RegionModel> get region => _region.value;

  final _selectedRegion = "Indonesia".obs;

  String get selectedRegion => _selectedRegion.value;

  final _selectedSize = 200.obs;

  int get selectedSize => _selectedSize.value;

  final emptyPrice = "-".obs;

  final _selectedIdPost = 0.obs;

  int get selectedIdPost => _selectedIdPost.value;

  final _selectedIdDisease = 0.obs;

  int get selectedIdDisease => _selectedIdDisease.value;

  late HargaUdangModel selectedHargaUdang;

  final List<Tab> myTabs = <Tab>[
    Tab(text: "Harga Udang"),
    Tab(text: "Kabar Udang"),
    Tab(text: "Penyakit"),
  ];

  var listSize = [
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    100,
    110,
    120,
    130,
    140,
    150,
    160,
    170,
    180,
    190,
    200,
  ].obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 3, vsync: this);
    getHargaUdang();
    getKabarUdang();
    getPenyakit();
    getRegion();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void getHargaUdang({String? id = ""}) async {
    _isLoadingRetrieveData.value = true;
    try {
      final hargaUdangList = await _dashboardRepository
          .getHargaUdang(HargaUdangRequestModel(regionId: id));

      _hargaUdang.value = hargaUdangList.data;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void selectHargaUdang(HargaUdangModel data) {
    selectedHargaUdang = data;
  }

  void getKabarUdang() async {
    _isLoadingRetrieveData.value = true;
    try {
      final kabarUdangList =
          await _dashboardRepository.getKabarUdang(KabarUdangRequestModel());

      _kabarUdang.value = kabarUdangList.data;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void setWebViewKabarController(int id) {
    webViewDetailKabarController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse("${Endpoint.webViewKabar}$id"),
      );
  }

  void setWebViewPenyakitController(int id) {
    webViewPenyakitController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse("${Endpoint.webViewPenyakit}$id"),
      );
  }

  void getPenyakit() async {
    _isLoadingRetrieveData.value = true;
    try {
      final penyakitList =
          await _dashboardRepository.getPenyakitList(PenyakitRequestModel());

      _penyakit.value = penyakitList.data;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void getRegion() async {
    _isLoadingRetrieveData.value = true;
    try {
      final regionList = await _dashboardRepository
          .getRegion(RegionRequestModel(search: regionTextController.text));

      _region.value = regionList.data;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void clearText() {
    regionTextController.clear();
    getRegion();
  }

  void setSelectedSize(int size) {
    _selectedSize.value = size;
  }

  void setSelectedIdPost(int id) {
    _selectedIdPost.value = id;
  }

  void setSelectedIdDisease(int id) {
    _selectedIdDisease.value = id;
  }

  void setSelectedRegion(String region) {
    _selectedRegion.value = region;
  }

  String showPriceBasedOnSize(HargaUdangModel? data) {
    switch (selectedSize) {
      case 20:
        if (data?.size20 != null) {
          return data!.size20.inRupiah();
        }
        return emptyPrice.value;

      case 30:
        if (data?.size30 != null) {
          return data!.size30.inRupiah();
        }
        return emptyPrice.value;
      case 40:
        if (data?.size40 != null) {
          return data!.size40.inRupiah();
        }
        return emptyPrice.value;
      case 50:
        if (data?.size50 != null) {
          return data!.size50.inRupiah();
        }
        return emptyPrice.value;
      case 60:
        if (data?.size60 != null) {
          return data!.size60.inRupiah();
        }
        return emptyPrice.value;
      case 70:
        if (data?.size70 != null) {
          return data!.size70.inRupiah();
        }
        return emptyPrice.value;
      case 80:
        if (data?.size80 != null) {
          return data!.size80.inRupiah();
        }
        return emptyPrice.value;
      case 90:
        if (data?.size90 != null) {
          return data!.size90.inRupiah();
        }
        return emptyPrice.value;
      case 100:
        if (data?.size100 != null) {
          return data!.size100.inRupiah();
        }
        return emptyPrice.value;
      case 110:
        if (data?.size110 != null) {
          return data!.size110.inRupiah();
        }
        return emptyPrice.value;
      case 120:
        if (data?.size120 != null) {
          return data!.size120.inRupiah();
        }
        return emptyPrice.value;
      case 130:
        if (data?.size130 != null) {
          return data!.size130.inRupiah();
        }
        return emptyPrice.value;
      case 140:
        if (data?.size140 != null) {
          return data!.size140.inRupiah();
        }
        return emptyPrice.value;
      case 150:
        if (data?.size150 != null) {
          return data!.size150.inRupiah();
        }
        return emptyPrice.value;
      case 160:
        if (data?.size160 != null) {
          return data!.size160.inRupiah();
        }
        return emptyPrice.value;
      case 170:
        if (data?.size170 != null) {
          return data!.size170.inRupiah();
        }
        return emptyPrice.value;
      case 180:
        if (data?.size180 != null) {
          return data!.size180.inRupiah();
        }
        return emptyPrice.value;
      case 190:
        if (data?.size190 != null) {
          return data!.size190.inRupiah();
        }
        return emptyPrice.value;
      case 200:
        if (data?.size200 != null) {
          return data!.size200.inRupiah();
        }
        return emptyPrice.value;
      default:
        if (data?.size200 != null) {
          return data!.size200.inRupiah();
        }
        return emptyPrice.value;
    }
  }
}
