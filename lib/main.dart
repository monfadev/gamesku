import 'package:flutter/material.dart';
import 'package:gamesku/core/resources/color.dart';
import 'package:gamesku/core/resources/style.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gamesku",
      theme: ThemeData(
        scaffoldBackgroundColor: secondaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/logo.png", fit: BoxFit.cover),
          const SizedBox(height: 70),
          Text("Games Marketplace", style: tsWhite.copyWith(fontSize: 20, fontWeight: fwSemiBold, letterSpacing: 2)),
          const SizedBox(height: 20),
          Text("We guarantee the authenticity of all Games that you buy or your money back.",
              textAlign: TextAlign.center, style: tsGrey.copyWith(fontSize: 18, fontWeight: fwMedium, letterSpacing: 2)),
          const SizedBox(height: 160),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 60,
                width: 250,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                  },
                  child: Text("OK, BRING ME IN", style: tsWhite.copyWith(fontSize: 20, fontWeight: fwSemiBold, letterSpacing: 2)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
