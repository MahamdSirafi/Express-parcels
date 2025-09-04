import 'package:flutter/material.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({
    super.key,
    required this.color,
    required this.percentEndent,
    required this.percentEndIndent,
    this.thickness,
  });
  final Color color;
  final double? thickness;
  final double percentEndent, percentEndIndent;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Divider(
      color: color,
      thickness: thickness ?? 1,
      endIndent: width * percentEndIndent,
      indent: width * percentEndent,
    );
  }
}
