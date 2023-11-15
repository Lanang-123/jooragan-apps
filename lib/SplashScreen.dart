import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joooragan/pages/beranda.dart';
import 'package:joooragan/pages/login.dart';
import 'package:joooragan/pages/main/index.dart';
import 'package:joooragan/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token = '';

  Future<void> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('token');
    if (data != null && data.isNotEmpty) {
      setState(() {
        token = data;
      });
    } else {
      // Token is empty or null, navigate to login page
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Transform.scale(
        scale: 5,
        child: Image.asset(
          "assets/images/logo2.png",
        ),
      ),
      nextScreen: token != null && token!.isNotEmpty
          ? MainPage()
          : Login(), // Gantilah dengan halaman utama Anda
      splashTransition: SplashTransition.fadeTransition, // Animasi fade
      duration: 3000,
      backgroundColor:
          hitam, // Durasi tampilan splash screen (dalam milidetik)Warna latar belakang
    );
  }
}
