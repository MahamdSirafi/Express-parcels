import 'package:flutter/widgets.dart';
import 'package:spl/core/utils/helpers/responsive_text_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

abstract class StyleToTexts {
  static TextStyle textStyleNormal6({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 6, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleNormal8({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 8, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleMedium10({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: responsiveTextHelper(fontSize: 10, context: context),
    );
  }

  static TextStyle textStyleNormal10({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 10, context: context),
      color: StyleToColors.littleBrownColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleBold10({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 10, context: context),
      fontWeight: FontWeight.w700,
      color: StyleToColors.mediumRedColor,
    );
  }

  static TextStyle textStyleNormal11({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.littleGreyLevel1Color,
      fontSize: responsiveTextHelper(fontSize: 11, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleBold12({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.whiteColor,
      fontSize: responsiveTextHelper(fontSize: 12, context: context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleMedium12({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 12, context: context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleNormal12({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.mediumGreyColor,
      fontSize: responsiveTextHelper(fontSize: 12, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleNormal13({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.mediumDeepGreenColor,
      fontSize: responsiveTextHelper(fontSize: 13, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleMedium13({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.littleBrownColor,
      fontSize: responsiveTextHelper(fontSize: 13, context: context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleSemiBold14({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveTextHelper(fontSize: 14, context: context),
    );
  }

  static TextStyle textStyleNormal14({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveTextHelper(fontSize: 14, context: context),
    );
  }

  static TextStyle textStyleMedium14({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 14, context: context),
      fontWeight: FontWeight.w500,
      color: StyleToColors.silverColor,
    );
  }

  static TextStyle textStyleBold14({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.whiteColor,
      fontWeight: FontWeight.w700,
      fontSize: responsiveTextHelper(fontSize: 14, context: context),
    );
  }

  static TextStyle textStyleNormal15({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveTextHelper(fontSize: 15, context: context),
    );
  }

  static TextStyle textStyleNormal16({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 16, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleBold16({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveTextHelper(fontSize: 16, context: context),
    );
  }

  static TextStyle textStyleMedium16({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: responsiveTextHelper(fontSize: 16, context: context),
      color: StyleToColors.mediumSkyBlueColor,
    );
  }

  static TextStyle textStyleBold18({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveTextHelper(fontSize: 18, context: context),
    );
  }

  static TextStyle textStyleMedium18({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 18, context: context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleSemiBold18({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 18, context: context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleNormal18({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 18, context: context),
      fontWeight: FontWeight.w400,
      color: StyleToColors.blackColor,
    );
  }

  static TextStyle textStyleBold20({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveTextHelper(fontSize: 20, context: context),
      color: StyleToColors.greyColor,
    );
  }

  static TextStyle textStyleMedium20({
    required BuildContext context,
    required Color color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: responsiveTextHelper(fontSize: 20, context: context),
      color: color,
    );
  }

  static TextStyle textStyleNormal22({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 22, context: context),
      fontWeight: FontWeight.w400,
      color: StyleToColors.blackColor,
    );
  }

  static TextStyle textStyleMedium22({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: responsiveTextHelper(fontSize: 22, context: context),
    );
  }

  static TextStyle textStyleBold22({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 22, context: context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleBold23({required BuildContext context}) {
    return TextStyle(
      color: StyleToColors.whiteColor,
      fontSize: responsiveTextHelper(fontSize: 23, context: context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleBold24({required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveTextHelper(fontSize: 24, context: context),
    );
  }

  static TextStyle textStyleBold26({required BuildContext context}) {
    return TextStyle(
      fontSize: responsiveTextHelper(fontSize: 26, context: context),
      fontWeight: FontWeight.w700,
    );
  }
}
