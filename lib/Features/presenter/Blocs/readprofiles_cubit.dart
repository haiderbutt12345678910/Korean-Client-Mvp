import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';
import 'package:flutter_application_assignmnet/Features/domain/usecases/readprofiles_usecase.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Blocs/bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadProfilesCubit extends Cubit<BlocStates> {
  ReadProfilesUseCase readProfileUseCase;
  List<ProfileDataEntity> profileDataList = [];

  ReadProfilesCubit({required this.readProfileUseCase}) : super(Initial());
  Future<void> readProfiles() async {
    emit(Loading());

    try {
      await readProfileUseCase.readProfileData().then((value) {
        profileDataList = value.toList();
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }

  List<ProfileDataEntity> readGrowMasterCollectionLocal() {
    return profileDataList;
  }
}
