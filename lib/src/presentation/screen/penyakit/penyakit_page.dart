import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/app/route/route_name.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/model/penyakit_model.dart';
import 'package:ronaldi_jala_test/src/presentation/controller/dashboard_controller.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/widgets/card_article.dart';

class PenyakitPage extends GetView<DashboardController> {
  const PenyakitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Daftar Penyakit", style: boldDarkBlue18),
            SizedBox(height: 5),
            buildListPenyakit(),
          ],
        ),
      ),
    );
  }

  Widget buildListPenyakit() => Obx(
        () => (controller.isLoadingRetrieveProduct)
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.blue,
              ))
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.penyakit.length,
                itemBuilder: (context, index) {
                  return cardArtikel(controller.penyakit[index]);
                },
              ),
      );

  Widget cardArtikel(PenyakitModel data) {
    return InkWell(
      onTap: () async {
        controller.setWebViewPenyakitController(data.id!);
        controller.setSelectedIdDisease(data.id!);
        Get.toNamed(RouteName.detailPenyakit);
      },
      child: CardArticle(
          id: data.id!,
          image: data.image,
          title: "${data.fullName!} (${data.shortName})",
          subTitle: data.metaDescription!,
          date: data.createdAt!,
          endpointShare: Endpoint.sharePenyakit),
    );
  }
}
