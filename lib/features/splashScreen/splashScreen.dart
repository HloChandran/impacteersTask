import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../config/assetsConfig.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Modular.to.pushReplacementNamed('sample');
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetsConfig.loginImage)),
    );
  }
}
