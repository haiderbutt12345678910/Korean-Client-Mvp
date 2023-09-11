import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Blocs/readprofiles_cubit.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Blocs/updateprofile_cubit.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Screens/main_screen.dart.dart';
import 'package:flutter_application_assignmnet/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // updateLikeCount();
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateProfileCubit>(
            create: (_) => di.sl<UpdateProfileCubit>()),
        BlocProvider<ReadProfilesCubit>(
            create: (_) => di.sl<ReadProfilesCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: TextStyle(
                fontSize: size.width * .07,
                fontFamily: 'Pretendard',
                color: Colors.white,
                fontWeight: FontWeight.bold),
            displayMedium: TextStyle(
                fontSize: size.width * .036,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            displaySmall: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: size.width * .03,
                color: Colors.white),
          ),

          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
