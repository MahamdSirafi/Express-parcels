import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_without_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_body_drawer.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAllBodyDrawerSection extends StatefulWidget {
  const CustomAllBodyDrawerSection({super.key});

  @override
  State<CustomAllBodyDrawerSection> createState() =>
      _CustomAllBodyDrawerSectionState();
}

class _CustomAllBodyDrawerSectionState
    extends State<CustomAllBodyDrawerSection> {
  bool? isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBodyDrawer(
          text: isSelected == true ? 'حول تطبيقنا' : 'About Our App',
          onPressed: () {
            showSnackBarWithoutActionHelper(
              context: context,
              color: StyleToColors.greenColor,
              text:
                  isSelected == true
                      ? 'تطبيق SPL هو حل حديث قائم على Flutter لإدارة المنتجات ونقلها بكفاءة. يوفر تجربة مستخدم سلسة مع واجهة مستخدم أنيقة، وتحديثات فورية، ومعالجة آمنة للبيانات. صُمم التطبيق للشركات التي تُعنى بلوجستيات المنتجات، ويُبسط تتبع المنتجات وتصنيفها وتنقلها عبر مراحل مختلفة من عملية النقل.'
                      : 'The SPL app is a modern Flutter-based solution for managing and transitioning products efficiently, It provides a smooth user experience with clean UI, real-time updates, and secure data handling. Designed for businesses handling product logistics, the app simplifies product tracking, categorization, and movement across different stages of transition.',
            );
          },
          image: Assets.images.aboutOurAppImage.path,
        ),
        SizedBoxHeight.height23(context: context),
        CustomBodyDrawer(
          text: isSelected == true ? 'سياسة الخصوصية' : 'Privacy Policy',
          onPressed: () {
            pushGoRouterHelper(
              context: context,
              view: kPrivacyAndPolicyViewRouter,
            );
          },
          image: Assets.images.privacyPolicyImage.path,
        ),
        CustomBodyDrawer(
          text: isSelected == true ? 'طرودي' : 'My Parcels',
          onPressed: () {
            pushGoRouterHelper(context: context, view: kMyShipmentViewRouter);
          },
          image: Assets.images.myParcelImage.path,
        ),
        SizedBoxHeight.height23(context: context),
        LeftPaddingComponent(
          leftPercent: 0.015,
          child: CustomBodyDrawer(
            text: isSelected == true ? 'لغة' : 'Language',
            onPressed: () {},
            image: Assets.images.languagesImage.path,
            isNeedToRightWidget: true,
            rightWidget: FlutterSwitch(
              value: isSelected!,
              onToggle: (value) async {
                isSelected = value;
                await BoolSharedPreferencesClass.saveBoolParameterSharedPreferences(
                  keyBool: kStringKeyFlutterSwitchInSharedPreferences,
                  parameterBool: isSelected!,
                );
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}
