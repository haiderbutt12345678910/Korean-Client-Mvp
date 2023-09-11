import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';
import 'package:flutter_application_assignmnet/Features/domain/usecases/updateprofile_usecase.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Blocs/bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileCubit extends Cubit<BlocStates> {
  UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileCubit({required this.updateProfileUseCase}) : super(Initial());
  Future<void> updateProfiles(
      String key, ProfileDataEntity profileDataEntity) async {
    emit(Loading());

    try {
      await updateProfileUseCase
          .updateProfileData(key, profileDataEntity)
          .then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
