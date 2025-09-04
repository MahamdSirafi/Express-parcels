import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/managers/cubits/logout_cubit/logout_cubit.dart';
import 'package:spl/core/utils/service_locator/get_it_service_locator.dart';
import 'package:spl/features/home/data/repository/home_repository_implementation.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_contain_show_dialog_log_out.dart';

Future<void> showDialogLogOutHelper({required BuildContext context}) async {
  showDialog(
    context: context,
    builder: (context) {
      double height = MediaQuery.sizeOf(context).height;
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * 0.033),
        ),
        child: BlocProvider(
          create:
              (context) => LogoutCubit(
                homeRepositoryImplementation:
                    getIt.get<HomeRepositoryImplementation>(),
              )..logoutMethodInCubit(),
          child: const CustomContainShowDialogLogOut(),
        ),
      );
    },
  );
}
