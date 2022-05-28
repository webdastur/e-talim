import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_talim/gen/colors.gen.dart';
import 'package:e_talim/ui/styles/text_styles.dart';
import 'package:e_talim/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget networkImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
    fit: BoxFit.cover,
  );
}

Widget verticalDivider(double value) => SizedBox(height: value);

Widget horizontalDivider(double value) => SizedBox(width: value);

void showToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

AppButton socialLoginBtn({
  required String text,
  required Widget image,
  required VoidCallback onPressed,
}) {
  return AppButton(
    child: Row(
      children: [
        image,
        SizedBox(width: 24),
        Text(
          text,
          style: regularSemiBoldTextStyle(
            color: ColorName.bodyColor,
          ),
        ),
      ],
    ),
    onPressed: onPressed,
    color: ColorName.greyColor,
    hasBorder: false,
  );
}
