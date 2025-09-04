import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/profile/data/repository/edit_profile_repository.dart';
import 'package:spl/features/profile/data/services/edit_profile_services.dart';

class EditProfileRepositoryImplementation implements EditProfileRepository {
  final EditProfileServices editProfileServices;
  EditProfileRepositoryImplementation({required this.editProfileServices});
  @override
  Future<Either<Failures, Map<String, dynamic>>> editProfileRepository({
    required String fullName,
    required String email,
    required String phone,
  }) async {
    final result = await editProfileServices.patchMethodAuthServices(
      path: '/users/updateMe',
      data: {'fullName': fullName, 'email': email, 'phone': phone},
    );
    return result.fold((failure) => Left(failure), (edit) => Right(edit.data));
  }
}
