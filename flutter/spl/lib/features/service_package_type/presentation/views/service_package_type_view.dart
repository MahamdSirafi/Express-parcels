import 'package:flutter/material.dart';
import 'package:spl/features/service_package_type/presentation/views/widgets/custom_service_package_type_view_body.dart';

class ServicePackageTypeView extends StatelessWidget {
  const ServicePackageTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomServicePackageTypeViewBody());
  }
}
