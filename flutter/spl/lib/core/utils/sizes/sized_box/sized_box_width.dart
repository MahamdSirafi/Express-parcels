import 'package:flutter/material.dart';

abstract class SizedBoxWidth {
  static const Expanded widthExpanded = Expanded(child: SizedBox());
  static const SizedBox widthShrink = SizedBox.shrink();
  static SizedBox width4({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.01, child: child);
  }

  static SizedBox width5({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.012, child: child);
  }

  static SizedBox width6({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.015, child: child);
  }

  static SizedBox width7({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.017, child: child);
  }

  static SizedBox width9({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.023, child: child);
  }

  static SizedBox width10({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.025, child: child);
  }

  static SizedBox width13({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.033, child: child);
  }

  static SizedBox width15({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.037, child: child);
  }

  static SizedBox width19({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.045, child: child);
  }

  static SizedBox width20({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.048, child: child);
  }

  static SizedBox width23({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.061, child: child);
  }

  static SizedBox width60({required BuildContext context, Widget? child}) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(width: width * 0.144, child: child);
  }
}
