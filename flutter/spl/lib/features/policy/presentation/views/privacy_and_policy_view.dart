import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/policy/presentation/views/widgets/custom_privacy_and_policy_view_body.dart';

class PrivacyAndPolicyView extends StatelessWidget {
  const PrivacyAndPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: StyleToColors.extraLittleSkyBlueColor,
      body: CustomPrivacyAndPolicyViewBody(),
    );
  }
}
