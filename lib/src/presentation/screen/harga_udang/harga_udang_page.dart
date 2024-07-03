import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/app/route/route_name.dart';
import 'package:ronaldi_jala_test/src/constants/colors.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/model/harga_udang_model.dart';
import 'package:ronaldi_jala_test/src/presentation/controller/dashboard_controller.dart';
import 'package:ronaldi_jala_test/src/utils/date_ext.dart';
import 'package:ronaldi_jala_test/src/utils/number_ext.dart';

class HargaUdangPage extends GetView<DashboardController> {
  const HargaUdangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [fiturLainnya(), hargaTerbaru()],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 55,
                  padding: EdgeInsets.only(left: 20),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _showBottomSheetSize(context);
                    },
                    backgroundColor: blue,
                    icon: Image.asset("assets/ic_biomass.png"),
                    label: Column(
                      children: [
                        Text(
                          'Size',
                          style: regularWhite14,
                        ),
                        Obx(
                          () => Text(
                            controller.selectedSize.toString(),
                            style: boldWhite14,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 55,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _showBottomSheetRegion(context);
                    },
                    backgroundColor: blueButton,
                    icon: Icon(
                      Icons.location_on,
                      size: 24,
                      color: white,
                    ),
                    label: Obx(
                      () => Text(
                        controller.selectedRegion.length > 9
                            ? '${controller.selectedRegion.substring(0, 10)}...'
                            : controller.selectedRegion,
                        style: controller.selectedRegion.length > 9
                            ? boldWhite14
                            : boldWhite18,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget fiturLainnya() {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Coba Fitur Lainnya",
            style: boldBlack16,
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                    onTap: () => showAlertDialog(),
                    child: Image.asset("assets/quiz.png",
                        width: 270, height: 100)),
                const SizedBox(width: 16),
                InkWell(
                    onTap: () => showAlertDialog(),
                    child: Image.asset("assets/ask_jali.png",
                        width: 270, height: 100)),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hargaTerbaru() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Harga terbaru",
            style: boldDarkBlue18,
          ),
          buildHargaTerbaruList()
        ],
      ),
    );
  }

  Widget buildHargaTerbaruList() => Obx(
        () => (controller.isLoadingRetrieveProduct == true)
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.blue,
              ))
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.hargaUdang.length,
                itemBuilder: (context, index) {
                  return buildContainerHarga(controller.hargaUdang[index]);
                },
              ),
      );

  Widget buildContainerHarga(HargaUdangModel data) {
    return Card(
      surfaceTintColor: white,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Nama
            Row(
              children: [
                Container(
                    height: 32,
                    width: 32,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: darkBlue),
                    child: data.creator != null
                        ? Image.network(
                            "${Endpoint.avatar}${data.creator!.avatar}",
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/img_jala.png")),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.creator?.occupation ?? "Supplier",
                        style: regularLightBlue12),
                    Text(data.creator?.name ?? "Mina Udang Barokah",
                        style: regularBlack14)
                  ],
                ),
                Spacer(),
                data.creator?.buyer == true
                    ? Container(
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
                    : Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                        decoration: BoxDecoration(
                            color: gray,
                            borderRadius: BorderRadius.circular(28)),
                        child: Row(
                          children: [
                            Text("belum terverifikasi", style: regularBlack12)
                          ],
                        ),
                      )
              ],
            ),

            // Section Tanggal dan Tempat
            SizedBox(height: 8),
            Text(getFormatDate(data.date!), style: regularLightBlue12),
            Text(data.region!.provinceName ?? "Nusa Tenggara Barat",
                style: regularBlack12),
            Text(data.region!.regencyName ?? "SUMBA", style: boldBlack18),

            //Section Harga dan Size
            Row(
              children: [
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("size ${controller.selectedSize}",
                          style: regularLightBlue12),
                      Text("IDR ${controller.showPriceBasedOnSize(data)}",
                          style: boldBlack22),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    controller.selectHargaUdang(data);
                    Get.toNamed(RouteName.detailHargaUdang);
                  },
                  child: Container(
                    width: 128,
                    height: 38,
                    decoration: BoxDecoration(
                        color: blue, borderRadius: BorderRadius.circular(5)),
                    child:
                        Center(child: Text("LIHAT DETAIL", style: boldWhite14)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showAlertDialog() {
    return showDialog<String>(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Clicked', style: boldBlack18),
        content: Text(
          'Terima kasih telah bersemangat mencoba fitur kami! Nantikan fitur-fitur menarik lainnya segera!',
          style: regularBlack16,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'OK',
              style: boldBlue16,
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheetRegion(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.4,
              maxChildSize: 0.8,
              builder: (_, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Kota/Kabupaten",
                            style: boldBlack16,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Text(
                              "Tutup",
                              style: boldBlue16,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: TextField(
                                controller: controller.regionTextController,
                                onChanged: (onChanged) {
                                  controller.getRegion();
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.search),
                                    hintText: 'Cari',
                                    hintStyle: boldGray16),
                              ),
                            ),
                            Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      controller.clearText();
                                    },
                                    child: Icon(Icons.dangerous_outlined))),
                          ],
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: Obx(() {
                          if (controller.region.length > 0) {
                            return ListView.builder(
                              shrinkWrap: true,
                              controller: scrollController,
                              itemCount: controller.region.length > 0
                                  ? controller.region.length
                                  : 0,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.setSelectedRegion(
                                        controller.region[index].fullName ??
                                            "Indonesia");
                                    controller.getHargaUdang(
                                        id: controller.region[index].id);
                                    Get.back();
                                  },
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Obx(
                                        () => Text(
                                          controller.region[index].fullName ??
                                              "",
                                          style: regularBlack14,
                                        ),
                                      )),
                                );
                              },
                            );
                          } else {
                            return Center(
                                child: Text(
                              "Maaf Kota Tidak Ditemukan",
                              style: boldBlack18,
                            ));
                          }
                        }),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheetSize(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                builder: (_, ScrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  "Size",
                                  style: boldBlack16,
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Text(
                                    "Tutup",
                                    style: boldBlue16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Expanded(
                            child: ListView.builder(
                              controller: ScrollController,
                              itemCount: controller.listSize.length,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.setSelectedSize(
                                        controller.listSize[index]);
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Text(
                                      controller.listSize[index].toString(),
                                      style: regularBlack14,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
