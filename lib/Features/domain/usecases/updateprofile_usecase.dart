import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';
import 'package:flutter_application_assignmnet/Features/domain/repositories/repository.dart';

class UpdateProfileUseCase {
  final Repository repository;
  UpdateProfileUseCase({required this.repository});

  Future<void> updateProfileData(
      String key, ProfileDataEntity profileDataEntity) async {
    return await repository.updateProfileData(key, profileDataEntity);
  }
}
