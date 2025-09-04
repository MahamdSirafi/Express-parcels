import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spl/core/utils/classes/local_database/strings_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_image_cubit/edit_profile_image_state.dart';

class EditProfileImageCubit extends Cubit<EditProfileImageState> {
  EditProfileImageCubit() : super(InitialEditProfileImageState()) {
    loadSavedImage();
    //this operation like initState, so when the state is Initial so trigger this method to load the image you saved it
  }
  ImagePicker imagePicker = ImagePicker(); //this object to pickImage
  Future<void> loadSavedImage() async {
    //first thing in this view i trigger this method to load the image(should i saved it)
    final imagePath =
        await StringsSharedPreferencesClass.getTokenMethodSharedPreferences(
          stringKey: kEditProfileImage,
        );
    //i get on image i saved it in SharedPreferences
    if (imagePath != null) {
      //if imagePath contain on value
      final file = File(imagePath);
      //so give me this file
      if (file.existsSync()) {
        //check this file is exist(in gallery) or no(not exist in gallery)
        emit(SuccessEditProfileImageState(imageFileInCubit: file));
        //is exist so emit SuccessState to give this file
      } else {
        await StringsSharedPreferencesClass.clearTokenMethodSharedPreferences(
          stringKey: kEditProfileImage,
        );
        //if no so clear(delete) this file doesn't save it in SharedPreferences
        emit(
          FailureEditProfileImageState(
            errorMessageInCubit: 'Error: the image deleted from your gallery',
          ),
        );
      }
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    //pick the image from gallery, and give me the image from 85% from quality
    if (pickedFile != null) {
      //if the user choose image from gallery
      final path = File(pickedFile.path);
      //so give me path this file from gallery the user
      await StringsSharedPreferencesClass.saveTokenMethodSharedPreferences(
        stringParameter: path.path,
        stringKey: kEditProfileImage,
      );
      //i save the image in SharedPreferences, and you write this(stringParameter:imageFile.path!) instead of this(stringParameter: path.path)
      //but i write this(stringParameter: path.path) because stringParameter and path(same type(String) not(String?))
      emit(SuccessEditProfileImageState(imageFileInCubit: path));
    }
  }
}
