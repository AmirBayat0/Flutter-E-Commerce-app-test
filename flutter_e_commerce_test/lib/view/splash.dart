import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///
import '../gen/assets.gen.dart';
import '../view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image(
                image: AssetImage(Assets.images.splash.path),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              width: double.infinity,
              child: SpinKitWave(
                color: Colors.blue,
                size: 30.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
