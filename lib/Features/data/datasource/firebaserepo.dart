import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';

abstract class Firebaserepo {
  Future<List<ProfileDataEntity>> readProfileData();
  Future<void> updateProfileData(
      String key, ProfileDataEntity profileDataEntity);
}
