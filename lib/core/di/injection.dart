import 'package:dio/dio.dart';
import 'package:fake_currency/core/networking/api_consumer.dart';
import 'package:fake_currency/features/auth/data/repo/auth_repo.dart';
import 'package:fake_currency/features/auth/data/source/auth_local_datasource.dart';
import 'package:fake_currency/features/auth/data/source/auth_remote_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/main/data/datasource/main_remote_datasource.dart';
import '../../features/main/data/repo/main_repo.dart';
import '../../features/main/data/repo/main_repo_impl.dart';
import '../../features/main/presentation/controller/cubit/main_cubit.dart';
import '../networking/dio_helper.dart';

final injector = GetIt.instance;

void setupServiceLocator() {
  _setupExternal();
  _setupAuthFeature();
  _setupMainFeature();
}

void _setupMainFeature() {
  injector.registerFactory<MainCubit>(() => MainCubit(injector<MainRepo>()));
  injector.registerFactory<MainRepo>(
    () => MainRepoImpl(datasource: injector<MainRemoteDatasource>()),
  );
  injector.registerFactory<MainRemoteDatasource>(
    () => MainRemoteDatasourceImpl(injector<ApiService>()),
  );
}

void _setupExternal() async {
  injector.registerLazySingleton<ApiService>(
    () => DioHelper(dio: injector<Dio>()),
  );
  injector.registerLazySingleton<Dio>(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

void _setupAuthFeature() {
  injector.registerFactory<SignupCubit>(
    () => SignupCubit(injector<AuthRepo>()),
  );
  injector.registerFactory<LoginCubit>(() => LoginCubit(injector<AuthRepo>()));
  injector.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(injector<AuthRepo>()),
  );
  injector.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDatasource: injector<AuthRemoteDatasource>(),
      authLocalDataSource: injector<AuthLocalDataSource>(),
    ),
  );
  injector.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(apiService: injector<ApiService>()),
  );
  injector.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(injector<SharedPreferences>()),
  );
}
