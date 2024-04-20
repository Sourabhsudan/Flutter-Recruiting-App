
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talent_bridge/Jobs/jobs_screen.dart';
import 'package:talent_bridge/LoginPage/login_screen.dart';

class UserState extends StatelessWidget {
  get ctx => null;



  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
     stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot){
        if(userSnapshot.data == null){
          print('User is not logged in yet');
          return Login();
        }
        else if(userSnapshot.hasData){
          print('User is already logged in');
          return JobScreen();
        }

        else if(userSnapshot.hasError)
        {
          return const Scaffold(
            body: Center(
              child: Text('An Error has been occurred. Try again later'),
            ),
          );
        }
        else if(userSnapshot.connectionState == ConnectionState.waiting)
        {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('Something went wrong'),
          ),
        );
      },
    );
  }
}
