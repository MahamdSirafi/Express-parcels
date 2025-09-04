import 'package:flutter/material.dart';

class CustomParcelTypeImage extends StatelessWidget {
  const CustomParcelTypeImage({super.key, required this.image});
  final dynamic image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.height * 0.033),
      child: SizedBox(
        width: size.width * 0.265,
        height: size.height * 0.155,
        child: Image.asset(image['image']!, fit: BoxFit.fill),
      ),
    );
  }
}
