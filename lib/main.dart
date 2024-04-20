// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talent_bridge/Jobs/jobs_screen.dart';
import 'package:talent_bridge/Search/search_companies.dart';
import 'package:talent_bridge/user_state.dart';

import 'LoginPage/login_screen.dart';
import 'SignupPage/signup_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot)
      {
        // if(snapshot.connectionState == ConnectionState.waiting)
        // {
        //   return const MaterialApp(
        //     home: Scaffold(
        //       body: Center(
        //         child: Text('Talent Bridge is being initialized',
        //         style: TextStyle(
        //           color:Colors.cyan,
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         ),
        //         ),
        //       ),
        //     ),
        //   );
        // }
        // else if(snapshot.hasError){
        //   return const MaterialApp(
        //     home: Scaffold(
        //       body: Center(
        //         child: Text('An Error has been occurred',
        //           style: TextStyle(
        //             color:Colors.cyan,
        //             fontSize: 30,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //     ),
        //   );
        // }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Talent Bridge',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            primarySwatch:Colors.blue,
          ),
          home: JobScreen(),
        );
      }
    );
  }
}
