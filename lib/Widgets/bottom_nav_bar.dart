

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talent_bridge/Jobs/jobs_screen.dart';
import 'package:talent_bridge/user_state.dart';
import '../Jobs/upload_job.dart';
import '../Search/profile_companies.dart';
import '../Search/search_companies.dart';

class BottomNavigationBarForApp extends StatefulWidget {
  var indexNum;


  BottomNavigationBarForApp({super.key, required this.indexNum});
  @override
  State<BottomNavigationBarForApp> createState() => _BottomNavigationBarForAppState();
}

class _BottomNavigationBarForAppState extends State<BottomNavigationBarForApp> {
  
  int indexNum = 0;

  void _logout(context)
  {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sign Out',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              ],
            ),
            content: const Text(
              'Do You Want to Log Out?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  //Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('No', style: TextStyle(color: Colors.green, fontSize: 18),),
              ),
              TextButton(
                onPressed: (){
                  // _auth.signOut();
                  // Navigator.canPop(context) ? Navigator.pop(context) : null;
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserState()));
                },
                child: const Text('Yes', style: TextStyle(color: Colors.green, fontSize: 18),),
              )
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {

    return CurvedNavigationBar(
      color: Colors.deepOrange.shade400,
      backgroundColor: Colors.blueAccent,
      buttonBackgroundColor: Colors.deepOrange.shade300,
      height: 50,
      index: indexNum,
      items: const [
        Icon(Icons.list, size: 19, color: Colors.black,),
        Icon(Icons.search, size: 19, color: Colors.black,),
        Icon(Icons.add, size: 19, color: Colors.black,),
        Icon(Icons.person_pin, size: 19, color: Colors.black,),
        Icon(Icons.exit_to_app, size: 19, color: Colors.black,),
      ],
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      animationCurve: Curves.bounceInOut,
      onTap: (index)
      {
        if(index == 0)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => JobScreen()));
        }
        else if(index == 1){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AllWorkersScreen()));
        }
        else if(index == 2){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UploadJobNow()));
        }
        else if(index == 3){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
        }
        else if(index == 4){
          _logout(context);

        }
      },
    );
  }
}
