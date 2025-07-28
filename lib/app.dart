import 'package:deep_vid/features/auth/data/firebase_auth_repo.dart';
import 'package:deep_vid/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:deep_vid/features/auth/presentation/cubits/auth_states.dart';
import 'package:deep_vid/features/auth/presentation/ui/auth_page.dart';
import 'package:deep_vid/features/home/presentation/ui/home_page.dart';
import 'package:deep_vid/features/themes/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*

APP Root Level
Repositories: for the database
-firebase

Bloc Providers: for state management
-auth
-profile
-post
-search
-theme

Check Auth State
-unauthenticated -> auth page (login/register)
-authenticated home page

*/
class MyApp extends StatelessWidget {
  //auth repo
  final firebaseAuthRepo = FirebaseAuthRepo();
 

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //auth cubit
          BlocProvider<AuthCubit>(
            create: (context) =>
                AuthCubit(authRepo: firebaseAuthRepo)..checkCurrentUser(),
          ),
          //theme cubit
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          
        ], // theme builder
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, currentTheme) =>
              MaterialApp(
            theme: currentTheme,
            debugShowCheckedModeBanner: false,
            home: ScaffoldMessenger(
              //bloc builder -- check current auth state
              child: BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) {
                  if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is Authenticated) {
                    return HomePage();
                  } else if (state is Unauthenticated) {
                    return AuthPage();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ));
  }
}
