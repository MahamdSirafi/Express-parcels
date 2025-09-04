import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/core/utils/helpers/show_dialog_help_and_faqs_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_help_and_faqs_view_body.dart';

class HelpAndFaqsView extends StatelessWidget {
  const HelpAndFaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomHelpAndFaqsViewBody(),
      bottomNavigationBar: CardContainOnTextComponent(
        text: 'Delete Account',
        color: StyleToColors.mediumRedColor,
        onTap: () => showDialogHelpAndFaqsHelper(context: context),
      ),
    );
  }
}
