import 'package:flutter/material.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomForgetPasswordViewBody());
  }
}
