import 'package:flutter/material.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomProfileViewBody());
  }
}
