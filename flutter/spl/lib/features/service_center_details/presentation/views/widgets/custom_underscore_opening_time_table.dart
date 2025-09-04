import 'package:flutter/material.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/cusotm_line_like_underscore.dart';

class CustomUnderscoreOpeningTimeTable extends StatelessWidget {
  const CustomUnderscoreOpeningTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.045),
      child: const Center(child: CusotmLineLikeUnderscore()),
    );
  }
}
