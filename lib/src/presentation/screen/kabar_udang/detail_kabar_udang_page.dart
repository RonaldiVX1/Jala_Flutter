import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/src/constants/colors.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/presentation/controller/dashboard_controller.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/widgets/snackbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailKabarUdangPage extends GetView<DashboardController> {
  const DetailKabarUdangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 24,
              color: white,
            ),
          ),
          title: Text(
            'Kabar Udang',
            style: boldWhite18,
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 16),
                child: GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                          text:
                              "${Endpoint.shareKabar}${controller.selectedIdPost}"));
                      SnackbarWidget.showSuccessSnackbar(
                          "Coppied ${Endpoint.shareKabar}${controller.selectedIdPost}");
                    },
                    child: Icon(Icons.share, color: white)))
          ],
        ),
        body: WebViewWidget(
          controller: controller.webViewDetailKabarController,
        ));
  }
}
