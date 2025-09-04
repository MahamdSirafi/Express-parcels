import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/profile/data/repository/edit_profile_repository_implementation.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.editProfileRepositoryImplementation})
    : super(InitialEditProfileState());
  final EditProfileRepositoryImplementation editProfileRepositoryImplementation;
  Future<void> editProfileCubit({
    required String fullName,
    required String email,
    required String phone,
  }) async {
    emit(LoadingEditProfileState());
    final result = await editProfileRepositoryImplementation
        .editProfileRepository(fullName: fullName, email: email, phone: phone);
    result.fold(
      (failure) => emit(
        FailureEditProfileState(
          errorMessageInFailureState: failure.errorMessageInFailuresClass,
        ),
      ),
      (edit) => emit(SuccessEditProfileState()),
      //i send data to api and use patch request to edit the data(replace new data in old data)
    );
  }
}
