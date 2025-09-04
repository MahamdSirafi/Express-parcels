import 'package:flutter/material.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.035),
      child: GestureDetector(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Assets.images.drawerImage.image(height: size.height * 0.06),
        ),
      ),
    );
  }
}
