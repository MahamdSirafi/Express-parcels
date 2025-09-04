import 'package:flutter/material.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomResetPasswordViewBody(token: token));
  }
}
