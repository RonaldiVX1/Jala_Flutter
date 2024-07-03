import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/src/constants/colors.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/presentation/controller/dashboard_controller.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/harga_udang/harga_udang_page.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/kabar_udang/kabar_udang_page.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/penyakit/penyakit_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: white,
          size: 24,
        ),
        backgroundColor: blue,
        title: Text(
          'Jala Media',
          style: boldWhite18,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: white,
            child: TabBar(
              controller: controller.controller,
              tabs: controller.myTabs,
              indicatorColor: Colors.blueAccent,
              labelStyle: boldBlue12,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle: boldGray14,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: controller.controller,
            children: [
              HargaUdangPage(),
              KabarUdangPage(),
              PenyakitPage(),
            ],
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 20),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: Row(
          //       children: [
          //         Container(
          //           width: MediaQuery.of(context).size.width / 2.5,
          //           height: 55,
          //           padding: EdgeInsets.only(left: 20),
          //           child: FloatingActionButton.extended(
          //             onPressed: () {
          //               _showBottomSheetSize(context);
          //             },
          //             backgroundColor: blue,
          //             icon: Image.asset("assets/ic_biomass.png"),
          //             label: Column(
          //               children: [
          //                 Text(
          //                   'Size',
          //                   style: regularWhite14,
          //                 ),
          //                 Obx(
          //                   () => Text(
          //                     controller.selectedSize.toString(),
          //                     style: boldWhite14,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(30),
          //                     bottomLeft: Radius.circular(30))),
          //           ),
          //         ),
          //         Container(
          //           width: MediaQuery.of(context).size.width / 1.8,
          //           height: 55,
          //           child: FloatingActionButton.extended(
          //             onPressed: () {
          //               _showBottomSheetRegion(context);
          //             },
          //             backgroundColor: blueButton,
          //             icon: Icon(
          //               Icons.location_on,
          //               size: 24,
          //               color: white,
          //             ),
          //             label: Obx(
          //               () => Text(
          //                 controller.selectedRegion.length > 9
          //                     ? '${controller.selectedRegion.substring(0, 10)}...'
          //                     : controller.selectedRegion,
          //                 style: controller.selectedRegion.length > 9
          //                     ? boldWhite14
          //                     : boldWhite18,
          //               ),
          //             ),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.only(
          //                     topRight: Radius.circular(30),
          //                     bottomRight: Radius.circular(30))),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
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
