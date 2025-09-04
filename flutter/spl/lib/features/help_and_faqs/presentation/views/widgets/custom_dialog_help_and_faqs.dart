import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/service_locator/get_it_service_locator.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/data/repositories/help_and_faqs_repository_implementation.dart';
import 'package:spl/features/help_and_faqs/presentation/managers/cubits/help_and_faqs_cubit/help_and_faqs_cubit.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_contain_dialog_help_and_faqs.dart';

class CustomDialogHelpAndFaqs extends StatelessWidget {
  const CustomDialogHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.height * 0.033),
      ),
      backgroundColor: StyleToColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
        child: BlocProvider(
          create:
              (context) => HelpAndFaqsCubit(
                helpAndFaqsRepositoryImplementation:
                    getIt.get<HelpAndFaqsRepositoryImplementation>(),
              ),
          child: const CustomContainDialogHelpAndFaqs(),
        ),
      ),
    );
  }
}
