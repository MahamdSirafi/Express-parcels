import 'package:flutter/material.dart';

abstract class SizedBoxHeight {
  static const Expanded heightExpanded = Expanded(child: SizedBox());
  static const SizedBox heightShrink = SizedBox.shrink();
  static SizedBox height3({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.003, child: child);
  }

  static SizedBox height4({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.005, child: child);
  }

  static SizedBox height5({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.008, child: child);
  }

  static SizedBox height8({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.01, child: child);
  }

  static SizedBox height9({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.012, child: child);
  }

  static SizedBox height10({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.014, child: child);
  }

  static SizedBox height13({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.02, child: child);
  }

  static SizedBox height15({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.021, child: child);
  }

  static SizedBox height19({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.026, child: child);
  }

  static SizedBox height20({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.028, child: child);
  }

  static SizedBox height21({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.03, child: child);
  }

  static SizedBox height23({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.034, child: child);
  }

  static SizedBox height29({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.04, child: child);
  }

  static SizedBox height30({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.042, child: child);
  }

  static SizedBox height32({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.045, child: child);
  }

  static SizedBox height33({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.048, child: child);
  }

  static SizedBox height35({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.05, child: child);
  }

  static SizedBox height40({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.056, child: child);
  }

  static SizedBox height49({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.068, child: child);
  }

  static SizedBox height60({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.084, child: child);
  }

  static SizedBox height62({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.088, child: child);
  }

  static SizedBox height72({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.1, child: child);
  }

  static SizedBox height119({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.165, child: child);
  }

  static SizedBox height134({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.144, child: child);
  }

  static SizedBox height160({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.21, child: child);
  }

  static SizedBox height170({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.238, child: child);
  }

  static SizedBox height300({required BuildContext context, Widget? child}) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(height: height * 0.368, child: child);
  }
}
