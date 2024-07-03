import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/app/route/route_name.dart';
import 'package:ronaldi_jala_test/src/constants/colors.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/model/kabar_udang_model.dart';
import 'package:ronaldi_jala_test/src/presentation/controller/dashboard_controller.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/widgets/card_article.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/widgets/snackbar.dart';
import 'package:ronaldi_jala_test/src/utils/date_ext.dart';

class KabarUdangPage extends GetView<DashboardController> {
  const KabarUdangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kabar Terbaru", style: boldDarkBlue18),
            SizedBox(height: 5),
            buildListKabarTerbaru(),
          ],
        ),
      ),
    );
  }

  Widget buildListKabarTerbaru() => Obx(
        () => (controller.isLoadingRetrieveProduct)
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.blue,
              ))
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.kabarUdang.length,
                itemBuilder: (context, index) {
                  return cardArtikel(controller.kabarUdang[index]);
                },
              ),
      );

  Widget cardArtikel(KabarUdangModel data) {
    return InkWell(
      onTap: () async {
        controller.setWebViewKabarController(data.id!);
        controller.setSelectedIdPost(data.id!);
        Get.toNamed(RouteName.detailKabarUdang);
      },
      child: CardArticle(
          id: data.id!,
          image: data.image!,
          title: data.title!,
          subTitle: data.excerpt!,
          date: data.createdAt!,
          endpointShare: Endpoint.shareKabar),
    );
  }
}
