import 'package:flutter/material.dart';
import 'package:movie_com/models/akun_page.dart';
import 'package:movie_com/pages/splash.dart';
import 'package:movie_com/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
     initialRoute: '/splash',
     routes: {
      '/': (context) => const MovieView(),
      '/splash':(context) => const SplashScreen(),
      '/akun':(context) => const OwnerProfilePage(),
     },
    );
  }
}