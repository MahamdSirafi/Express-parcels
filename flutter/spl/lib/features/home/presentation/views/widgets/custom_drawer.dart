import 'package:flutter/material.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_contain_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(child: CustomContainDrawer());
  }
}
