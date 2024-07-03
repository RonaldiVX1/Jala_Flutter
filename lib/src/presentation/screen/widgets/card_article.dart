import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ronaldi_jala_test/src/constants/colors.dart';
import 'package:ronaldi_jala_test/src/constants/endpoint.dart';
import 'package:ronaldi_jala_test/src/constants/font.dart';
import 'package:ronaldi_jala_test/src/presentation/screen/widgets/snackbar.dart';
import 'package:ronaldi_jala_test/src/utils/date_ext.dart';

class CardArticle extends StatelessWidget {
  int id;
  String? image;
  String title;
  String subTitle;
  DateTime date;
  String endpointShare;

  CardArticle(
      {super.key,
      required this.id,
      this.image,
      required this.title,
      required this.subTitle,
      required this.date,
      required this.endpointShare});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      surfaceTintColor: white,
      child: Container(
        height: 310,
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.network(
                "${Endpoint.avatar}$image",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrace) {
                  return Image.asset(
                    "assets/img_jala.png",
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: boldBlack18),
                    SizedBox(height: 5),
                    Text(
                      subTitle,
                      style: regularBlack14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(getFormatDateFromDate(date) ?? "30 April 2020",
                            style: regularBlack14),
                        Spacer(),
                        GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: "${Endpoint.shareKabar}$id"));
                              SnackbarWidget.showSuccessSnackbar(
                                  "Coppied $endpointShare$id");
                            },
                            child: Icon(Icons.share))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
