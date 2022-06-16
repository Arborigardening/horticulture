import 'package:arbori/langingpage.dart';
import 'package:arbori/main.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigatetoscreen();
  }

  navigatetoscreen() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Landing()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(117, 155, 201, 1),
      child: Center(
        child: Text(
          'ARBORI',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        //child: SvgPicture.asset('assets/logo.svg'),
      ),
    ));
  }
}
