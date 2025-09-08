import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/assign_data_to_int_parameter_in_future_helper.dart';
import 'package:spl/core/utils/helpers/pop_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_without_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/my_shipment/presentation/managers/cubits/send_ratings_cubit/send_ratings_cubit.dart';
import 'package:spl/features/my_shipment/presentation/managers/cubits/send_ratings_cubit/send_ratings_state.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_header_rate_shipment_dialog.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_star_rating_shipment_dialog.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_submit_shipment_button_rate_dialog.dart';
import 'package:spl/core/utils/components/text_bold_14_component.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_text_field_rate_shipment_dialog.dart';

class CustomContainRateShipmentDialog extends StatefulWidget {
  const CustomContainRateShipmentDialog({super.key});

  @override
  State<CustomContainRateShipmentDialog> createState() =>
      _CustomContainRateShipmentDialogState();
}

class _CustomContainRateShipmentDialogState
    extends State<CustomContainRateShipmentDialog> {
  TextEditingController textEditingController = TextEditingController();
  int? ratings = 0;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
    return BlocConsumer<SendRatingsCubit, SendRatingsState>(
      listener: (context, state) {
        if (state is SendRatingsSuccessState) {
          showSnackBarWithoutActionHelper(
            context: context,
            text:
                isSelected == true
                    ? 'تم إرسال تقييمك بنجاح'
                    : 'your rating are submitting successful',
            color: StyleToColors.greenColor,
          );
          popGoRouterHelper(context: context);
        } else if (state is SendRatingsFailureState) {
          showSnackBarWithoutActionHelper(
            context: context,
            text: state.errorMessageInCubit,
          );
        }
      },
      builder: (context, state) {
        if (state is SendRatingsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxHeight.height10(context: context),
            const CustomHeaderRateShipmentDialog(),
            const CustomStarRatingShipmentDialog(),
            TextBold14Component(
              text: isSelected == true ? 'تعليقات' : 'Comments',
              percent: 0.065,
            ),
            SizedBoxHeight.height10(context: context),
            CustomTextFieldRateShipmentDialog(
              textEditingController: textEditingController,
            ),
            SizedBoxHeight.height10(context: context),
            CustomSubmitShipmentButtonRateDialog(
              onPressed: () {
                assignDataToIntParameterInFutureHelper(ratings: ratings);
                if (ratings == 0 && textEditingController.text.isEmpty) {
                  showSnackBarWithoutActionHelper(
                    context: context,
                    text:
                        isSelected == true
                            ? 'الرجاء اختيار التقييم وكتابة التعليق'
                            : 'Please select a rating and write comment',
                  );
                  return;
                }
                context.read<SendRatingsCubit>().submitRatingsToAPI(
                  comment: textEditingController.text,
                  parcelId: kParcelId,
                  rate: ratings!,
                );
              },
            ),
            SizedBoxHeight.height20(context: context),
          ],
        );
      },
    );
  }
}
