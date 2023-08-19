import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtaf_assignment/features/data/repository/repository_impl.dart';
import 'package:gtaf_assignment/features/domain/repository/repository.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/bloc/commit_bloc.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/bloc/commit_event.dart';
import 'package:gtaf_assignment/features/presentation/user_profile/bloc/user_bloc.dart';
import 'package:gtaf_assignment/features/presentation/user_profile/bloc/user_event.dart';

import '../../features/presentation/landing/bloc/landing_bloc.dart';
import '../../features/presentation/landing/screen/landing_screen.dart';
import '../../route/app_router.dart';
import '../../route/navigation_service.dart';

class AppRepoProvider extends StatelessWidget {
  const AppRepoProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Repository>(
          create: (context) => RepositoryImpl(),
        ),
      ],
      child: const AppBlocProvider(),
    );
  }
}

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CommitBloc(repository: context.read<Repository>())..add(GetCommitsEvent())),
          BlocProvider(create: (context) => UserBloc(repository: context.read<Repository>())),
          BlocProvider(create: (context) => LandingBloc()),
        ],
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          title: 'Greentech App Foundation',
          theme: ThemeData(primarySwatch: Colors.blue,),
          home: const LandingScreen(),
          onGenerateRoute: AppRouter.generateRoute,
        )
    );
  }
}

