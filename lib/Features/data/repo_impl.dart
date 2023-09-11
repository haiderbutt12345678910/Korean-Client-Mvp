import 'package:flutter_application_assignmnet/Features/data/datasource/firebaserepo.dart';
import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';
import 'package:flutter_application_assignmnet/Features/domain/repositories/repository.dart';

class RepoImpl extends Repository {
  final Firebaserepo firebaserepo;

  RepoImpl({required this.firebaserepo});
  @override
  Future<List<ProfileDataEntity>> readProfileData() async {
    return await firebaserepo.readProfileData();
  }

  @override
  Future<void> updateProfileData(
      String key, ProfileDataEntity profileDataEntity) async {
    return await firebaserepo.updateProfileData(key, profileDataEntity);
  }
}
