import 'package:flutter/material.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_success_reset_password_view_body.dart';

class SuccessResetPasswordView extends StatelessWidget {
  const SuccessResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomSuccessResetPasswordViewBody());
  }
}
