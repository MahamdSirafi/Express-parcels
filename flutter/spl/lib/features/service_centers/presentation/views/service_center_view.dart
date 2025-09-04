import 'package:flutter/material.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_service_center_view_body.dart';

class ServiceCenterView extends StatelessWidget {
  const ServiceCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomServiceCenterViewBody());
  }
}
