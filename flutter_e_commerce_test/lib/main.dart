import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
import '../view/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.deepPurpleAccent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-Commerce app test',
      home: const SplashScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
          headline2: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          headline3: TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          headline4: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
          headline5: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
          headline6: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
