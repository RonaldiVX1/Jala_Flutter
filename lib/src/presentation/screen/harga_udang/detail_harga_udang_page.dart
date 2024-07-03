import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/src/constants/colors.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/presentation/controller/dashboard_controller.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/widgets/snackbar.dart';
import 'package:ronaldi_jala_test/src/utils/date_ext.dart';
import 'package:ronaldi_jala_test/src/utils/number_ext.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailHargaUdangPage extends GetView<DashboardController> {
  const DetailHargaUdangPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.printError(info: controller.allCity.value.length.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: white)),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                        text:
                            "${Endpoint.shareHargaUdang}${controller.selectedHargaUdang.id}"));
                    SnackbarWidget.showSuccessSnackbar(
                        "Coppied ${Endpoint.shareHargaUdang}${controller.selectedHargaUdang.id}");
                  },
                  child: Icon(Icons.share, color: white)))
        ],
        title: Text("Harga Udang", style: boldWhite18),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.selectedHargaUdang.region!.provinceName ??
                        "Nusa Tenggara Barat",
                    style: boldBlack16,
                  ),
                  Text(
                    controller.selectedHargaUdang.region!.regencyName ??
                        "Sumba",
                    style: boldGray16,
                  )
                ],
              ),
            ),
            Divider(thickness: 4, color: gray),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        getFormatDate(controller.selectedHargaUdang.date!),
                        style: regularGray14,
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                        decoration: BoxDecoration(
                            color: lightYellow,
                            borderRadius: BorderRadius.circular(28)),
                        child: Row(
                          children: [
                            Image.asset("assets/ic_verified.png"),
                            SizedBox(width: 3),
                            Text("Terverifikasi", style: regularBlack12)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: darkBlue),
                        child: Image.network(
                          "${Endpoint.avatar}${controller.selectedHargaUdang.creator!.avatar}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              controller
                                      .selectedHargaUdang.creator!.occupation ??
                                  "Supplier",
                              style: regularGray12),
                          Text(
                              controller.selectedHargaUdang.creator!.name ??
                                  "Mina Udang Barokah",
                              style: boldBlack14)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kontak",
                            style: regularLightGray12,
                          ),
                          Text(
                            controller.selectedHargaUdang.creator!.phone ??
                                "+62123123123123",
                            style: boldGray16,
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          final Uri url = Uri(
                              scheme: 'tel',
                              path: controller
                                      .selectedHargaUdang.creator!.phone ??
                                  "123456");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print('Could not launch $url');
                          }
                        },
                        child: Container(
                          width: 89,
                          height: 32,
                          decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text("Hubungi", style: boldWhite14)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  buildListDaftarHarga(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListDaftarHarga() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Daftar Harga", style: boldBlack16),
        SizedBox(height: 10),
        rowHarga(20, controller.selectedHargaUdang.size20),
        rowHarga(30, controller.selectedHargaUdang.size30),
        rowHarga(40, controller.selectedHargaUdang.size40),
        rowHarga(50, controller.selectedHargaUdang.size50),
        rowHarga(60, controller.selectedHargaUdang.size60),
        rowHarga(70, controller.selectedHargaUdang.size70),
        rowHarga(80, controller.selectedHargaUdang.size80),
        rowHarga(90, controller.selectedHargaUdang.size90),
        rowHarga(100, controller.selectedHargaUdang.size100),
        rowHarga(110, controller.selectedHargaUdang.size110),
        rowHarga(120, controller.selectedHargaUdang.size120),
        rowHarga(130, controller.selectedHargaUdang.size130),
        rowHarga(140, controller.selectedHargaUdang.size140),
        rowHarga(150, controller.selectedHargaUdang.size150),
        rowHarga(160, controller.selectedHargaUdang.size160),
        rowHarga(170, controller.selectedHargaUdang.size170),
        rowHarga(180, controller.selectedHargaUdang.size180),
        rowHarga(190, controller.selectedHargaUdang.size190),
        rowHarga(200, controller.selectedHargaUdang.size200),
        SizedBox(height: 16),
        Text("Catatan", style: boldBlack16),
        SizedBox(height: 8),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam",
            style: regularGray14)
      ],
    );
  }

  Widget rowHarga(
    int size,
    int? harga,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 8, right: 150),
      child: Row(
        children: [
          Text("Size $size", style: regularBlack16),
          Spacer(),
          harga != null
              ? Text("${harga.inRupiah()}", style: regularBlack16)
              : Text("-", style: regularBlack16)
        ],
      ),
    );
  }
}
