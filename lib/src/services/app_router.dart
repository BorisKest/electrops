import 'package:electrops/src/UI/account_screen.dart';
import 'package:electrops/src/UI/auth_signIn_screen.dart';
import 'package:electrops/src/UI/auth_signUp_screen.dart';
import 'package:electrops/src/UI/bucket_screen.dart';
import 'package:electrops/src/UI/favorit_screen.dart';
import 'package:electrops/src/UI/home_screen/home_screen.dart';
import 'package:electrops/src/UI/search_screen.dart';
import 'package:electrops/src/UI/upload/upload_screen.dart';
import 'package:electrops/src/bloc/authentication%20_bloc/authentication_bloc.dart';
import 'package:electrops/src/bloc/data_bloc/data_bloc.dart';
import 'package:electrops/src/bloc/settings_bloc/settings_bloc.dart';
import 'package:electrops/src/services/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppRouter {
  final SettingsBloc _correntBloc = SettingsBloc();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/': // "/"
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => Authrnticator(),
            child: BlocProvider(
              create: (context) => AuthenticationBloc(
                authrnticator: RepositoryProvider.of<Authrnticator>(context),
              ),
              child: const AuthSignInScreen(),
            ),
          ),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => Authrnticator(),
            child: BlocProvider(
              create: (context) => AuthenticationBloc(
                authrnticator: RepositoryProvider.of<Authrnticator>(context),
              ),
              child: const AuthSignUpScreen(),
            ),
          ),
        );
      case '/home': //
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const HomeScreen(),
          ),
        );
      case '/favorit':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const FavoritScreen(),
          ),
        );
      case '/account':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const AccountScreen(),
          ),
        );
      case '/search':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const SearchScreen(),
          ),
        );
      case '/upload':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: DataBloc(),
            child: const UploadScreen(),
          ),
        );
      case '/bucket':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: DataBloc(),
            child: const BucketScreen(),
          ),
        );
      default: //logging screen
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const AuthSignInScreen(),
          ),
        );
    }
  }

  void dispose() {
    _correntBloc.close();
  }
}
