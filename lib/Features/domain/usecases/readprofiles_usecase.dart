import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';
import 'package:flutter_application_assignmnet/Features/domain/repositories/repository.dart';

class ReadProfilesUseCase {
  final Repository repository;
  ReadProfilesUseCase({required this.repository});

  Future<List<ProfileDataEntity>> readProfileData() async {
    return await repository.readProfileData();
  }
}
