import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/service_locator/get_it_service_locator.dart';
import 'package:spl/features/my_shipment/data/repository/send_ratings_repository_implementation.dart';
import 'package:spl/features/my_shipment/presentation/managers/cubits/send_ratings_cubit/send_ratings_cubit.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_rate_shipment_dialog.dart';

void showDialogRateShipmentHelper({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
        create:
            (context) => SendRatingsCubit(
              sendRatingsRepositoryImplementation:
                  getIt.get<SendRatingsRepositoryImplementation>(),
            ),
        child: const CustomRateShipmentDialog(),
      );
    },
  );
}
