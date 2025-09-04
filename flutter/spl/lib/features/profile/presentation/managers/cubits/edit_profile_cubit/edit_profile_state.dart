abstract class EditProfileState {}

class InitialEditProfileState extends EditProfileState {}

class LoadingEditProfileState extends EditProfileState {}

class SuccessEditProfileState extends EditProfileState {}

class FailureEditProfileState extends EditProfileState {
  final String errorMessageInFailureState;
  FailureEditProfileState({required this.errorMessageInFailureState});
}
