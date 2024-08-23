import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:live_football_score/core/dependency_injection.dart';
import 'package:live_football_score/view/screens/home_screen.dart';

class LiveFootballScore extends StatefulWidget {
  const LiveFootballScore({super.key});

  @override
  State<LiveFootballScore> createState() => _LiveFootballScoreState();
}

class _LiveFootballScoreState extends State<LiveFootballScore> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: DependencyInjection(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}
