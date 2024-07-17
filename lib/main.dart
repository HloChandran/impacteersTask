import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/sample_api_call/data/datasources/sample_data_source.dart';
import 'features/sample_api_call/data/repositories/sample_repository_imple.dart';
import 'features/sample_api_call/domain/usecases/sample_case.dart';
import 'features/sample_api_call/presentation/cubit/sample_api_call_cubit.dart';
import 'features/sample_api_call/presentation/pages/sample_api_list.dart';
import 'features/splashScreen/splashScreen.dart';

void main() {
  runApp(ModularApp(module: ModuleApp(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MultiBlocProvider(
        providers: [
           BlocProvider<SampleApiCallCubit>(
              create: (context) => SampleApiCallCubit(
                  SampleCase(SampleRepositoryImplements(dataSource: SampleDataImplements())))),
         
        ],
        child: MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate));
  }
}

class ModuleApp extends Module {
  @override
  List<Bind> get bind => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => SplashScreen(),
        ),
        ChildRoute(
          "/sample",
          child: (context, args) => SampleList(),
        ),
        RedirectRoute('/redirect', to: '/'),
      ];
}


