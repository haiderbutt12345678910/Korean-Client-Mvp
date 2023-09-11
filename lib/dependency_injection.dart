import 'package:flutter_application_assignmnet/Features/data/datasource/firebaserepo.dart';
import 'package:flutter_application_assignmnet/Features/data/datasource/firebaserepo_impl.dart';
import 'package:flutter_application_assignmnet/Features/data/repo_impl.dart';
import 'package:flutter_application_assignmnet/Features/domain/repositories/repository.dart';
import 'package:flutter_application_assignmnet/Features/domain/usecases/readprofiles_usecase.dart';
import 'package:flutter_application_assignmnet/Features/domain/usecases/updateprofile_usecase.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Blocs/readprofiles_cubit.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Blocs/updateprofile_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
//bloc

  sl.registerFactory<UpdateProfileCubit>(
      () => UpdateProfileCubit(updateProfileUseCase: sl.call()));

  sl.registerFactory<ReadProfilesCubit>(
      () => ReadProfilesCubit(readProfileUseCase: sl.call()));

//usecase

  sl.registerLazySingleton<UpdateProfileUseCase>(
      () => UpdateProfileUseCase(repository: sl.call()));

  sl.registerLazySingleton<ReadProfilesUseCase>(
      () => ReadProfilesUseCase(repository: sl.call()));

  //repo

  sl.registerLazySingleton<Repository>(() => RepoImpl(
        firebaserepo: sl.call(),
      ));
  sl.registerLazySingleton<Firebaserepo>(() => FirebaserepoImpl());
}
