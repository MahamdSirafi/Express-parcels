import 'package:flutter/material.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_contain_details_profile.dart';

class CustomDetailsProfile extends StatelessWidget {
  const CustomDetailsProfile({
    super.key,
    this.percentLeftPadding,
    this.percentHeightImage,
    required this.image,
    required this.text,
    required this.onPressed,
  });
  final double? percentLeftPadding, percentHeightImage;
  final String image, text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.035,
        left: width * (percentLeftPadding ?? 0.05),
      ),
      child: CustomContainDetailsProfile(
        image: image,
        text: text,
        percentHeightImage: percentHeightImage,
        onPressed: onPressed,
      ),
    );
  }
}
