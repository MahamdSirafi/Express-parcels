import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/components/text_form_field_prefix_and_suffix_icons_and_hint_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_cubit.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_sliver_list_service_center_card_with_some_details.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomServiceCenterViewBody extends StatelessWidget {
  const CustomServiceCenterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SizedBoxHeight.height33(context: context)),
        const SliverToBoxAdapter(
          child: BackArrowWithTextComponent(text: 'Services Centers'),
        ),
        SliverToBoxAdapter(child: SizedBoxHeight.height20(context: context)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.073),
            child: TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
              hintText: 'search',
              onChanged: (value) {
                context.read<ServiceCentersCubit>().filterCitiesServiceCenters(
                  cityName: value,
                );
                context
                    .read<ServiceCentersCubit>()
                    .getMethodServiceCentersCubit();
                //i trigger this method to do rebuild to appear new service center cards because look the BlocBuilder not here
              },
              suffixIcon: Assets.images.searchImage.path,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBoxHeight.height10(context: context)),
        const CustomSliverListServiceCenterCardWithSomeDetails(),
      ],
    );
  }
}
