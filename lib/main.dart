import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:movie/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:movie/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:movie/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movie/features/auth/repositories/auth_repository.dart';

import 'core/recources/routes_manager/routes_manager.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(
        authRepository: AuthRepositoryImpl(
          authLocalDataSource: AuthSharedPrefsLocalDataSource(),
          authApiRemoteDataSource: AuthApiRemoteDataSource(),
        ),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: Size(430, 932),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.mainLayout,
        locale: Locale("en"),
      ),
    );
  }
}
