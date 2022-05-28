import 'package:e_talim/gen/colors.gen.dart';
import 'package:flutter/material.dart';

TextStyle regularTextStyle({
  Color? color,
}) {
  color ??= ColorName.black;
  return TextStyle(
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

TextStyle smallTextStyle({
  Color? color,
}) {
  color ??= ColorName.black;
  return TextStyle(
    color: color,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}

TextStyle headingTextStyle({
  Color? color,
}) {
  color ??= ColorName.black;
  return TextStyle(
    color: color,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
}

TextStyle smallHeadingStyle({
  Color? color,
}) {
  color ??= ColorName.black;
  return TextStyle(
    color: color,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
}

TextStyle regularSemiBoldTextStyle({
  Color? color,
}) {
  color ??= ColorName.black;
  return TextStyle(
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

TextStyle smallMediumTextStyle({
  Color? color,
}) {
  color ??= ColorName.black;
  return TextStyle(
    color: color,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
}

TextStyle smallLinkTextStyle({
  Color? color,
}) {
  color ??= ColorName.black;
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );
}
