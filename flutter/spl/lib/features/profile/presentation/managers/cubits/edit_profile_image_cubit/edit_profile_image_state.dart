import 'dart:io';

abstract class EditProfileImageState {}

class InitialEditProfileImageState extends EditProfileImageState {}

class SuccessEditProfileImageState extends EditProfileImageState {
  final File? imageFileInCubit;
  SuccessEditProfileImageState({required this.imageFileInCubit});
}

class FailureEditProfileImageState extends EditProfileImageState {
  final String errorMessageInCubit;
  FailureEditProfileImageState({required this.errorMessageInCubit});
}
//i don't need to LoadingState because there is no thing from internet just from gallery