import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_svg_image_package_type_view.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_text_medium10_package_type_view.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_text_normal8_package_type_view.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImageWithTwoTextsLeftSide extends StatelessWidget {
  const CustomImageWithTwoTextsLeftSide({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.svgOrPngImage,
  });
  final String firstText, secondText, svgOrPngImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        svgOrPngImage == 'svg'
            ? const CustomSvgImagePackageTypeView()
            : Assets.images.sizeImage.image(),
        SizedBoxWidth.width5(context: context),
        CustomTextMedium10PackageTypeView(text: firstText),
        SizedBoxWidth.width5(context: context),
        CustomTextNormal8PackageTypeView(text: secondText),
      ],
    );
  }
}
