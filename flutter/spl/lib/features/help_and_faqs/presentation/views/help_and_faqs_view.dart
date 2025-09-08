import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/show_dialog_help_and_faqs_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_help_and_faqs_view_body.dart';

class HelpAndFaqsView extends StatefulWidget {
  const HelpAndFaqsView({super.key});

  @override
  State<HelpAndFaqsView> createState() => _HelpAndFaqsViewState();
}

class _HelpAndFaqsViewState extends State<HelpAndFaqsView> {
  bool? isSelected = false;
  Future<void> getOnBoolValueFromSharedPreferences() async {
    isSelected =
        await BoolSharedPreferencesClass.getBoolParameterSharedPreferences(
          keyBool: kStringKeyFlutterSwitchInSharedPreferences,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getOnBoolValueFromSharedPreferences();
    return Scaffold(
      body: const CustomHelpAndFaqsViewBody(),
      bottomNavigationBar: CardContainOnTextComponent(
        text: isSelected == true ? 'حذف الحساب' : 'Delete Account',
        color: StyleToColors.mediumRedColor,
        onTap: () => showDialogHelpAndFaqsHelper(context: context),
      ),
    );
  }
}
