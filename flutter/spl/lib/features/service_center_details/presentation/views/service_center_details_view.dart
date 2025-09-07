import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spl/features/service_center_details/presentation/managers/cubits/service_center_details_cubit/service_center_details_cubit.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_service_center_details_view_body.dart';

class ServiceCenterDetailsView extends StatelessWidget {
  const ServiceCenterDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ServiceCenterDetailsCubit>().getMethodServiceCentersCubit(
      index: GoRouterState.of(context).extra as int,
    );
    return const Scaffold(
      body: CustomServiceCenterDetailsViewBody(),
      // bottomNavigationBar: CustomBottomNavigationBarServiceCenterDetails(),
    );
  }
}
