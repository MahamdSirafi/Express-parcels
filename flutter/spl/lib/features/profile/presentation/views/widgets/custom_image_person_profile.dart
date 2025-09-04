import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_with_action_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_image_cubit/edit_profile_image_cubit.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_image_cubit/edit_profile_image_state.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImagePersonProfile extends StatelessWidget {
  const CustomImagePersonProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<EditProfileImageCubit, EditProfileImageState>(
      listener: (context, state) {
        if (state is SuccessEditProfileImageState) {
          showSnackBarWithActionHelper(
            context: context,
            text: 'Your image is added',
            color: StyleToColors.greenColor,
          );
        } else if (state is FailureEditProfileImageState) {
          showSnackBarWithActionHelper(
            context: context,
            text: state.errorMessageInCubit,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<EditProfileImageCubit>();
        final imageFile =
            state is SuccessEditProfileImageState
                ? state.imageFileInCubit
                : null;
        //should determined the state to get on parameter i want it and this parameter in this state
        return GestureDetector(
          onTap: cubit.pickImage,
          child: Container(
            height: height * 0.155,
            decoration: const BoxDecoration(
              color: StyleToColors.deepBlueColor,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child:
                  imageFile != null
                      ? Image.file(imageFile, fit: BoxFit.cover)
                      : Assets.images.editPersonImage.image(),
              //if there is path file to image the user choose it so appeared it, if no so appeared default image, and worry when the user delete image from his gallery and this image the user chosen it in the app, in this case will appear default image because imageFile is null
            ),
          ),
        );
      },
    );
  }
}
