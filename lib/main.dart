import 'package:catalyst/SecondScreen.dart';
import 'package:catalyst/auth_bloc.dart';
import 'package:catalyst/auth_screen.dart';
//import 'package:catalyst/login_event.dart';
//import 'package:catalyst/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'login_bloc.dart'; // Import your LoginBloc

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_page.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Column,
        Expanded,
        Key,
        MainAxisAlignment,
        MaterialApp,
        Row,
        Scaffold,
        Size,
        SizedBox,
        StatelessWidget,
        Text,
        TextButton,
        Widget,
        runApp;
import 'auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      // Optionally, navigate to the login page or show a sign-in prompt
    } else {
      print('User is signed in!');
      // Navigate to the home or dashboard screen
    }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalyst',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (BuildContext context) {
          return AuthBloc(_firebaseAuth);
        },
        child: StreamBuilder(
            stream: _firebaseAuth.authStateChanges(),
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data == null) {
                  return LoginScreen();
                } else {
                  return SecondScreen();
                }
              }
              return LoginScreen(); //return loadingpage
            }),
      ),
    );
  }
}
