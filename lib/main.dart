import 'package:flutter/material.dart';
import 'package:joooragan/SplashScreen.dart';
import 'package:joooragan/pages/beranda.dart';
import 'package:joooragan/pages/main/franchisePage.dart';
import 'package:joooragan/pages/main/index.dart';
import 'package:joooragan/pages/main/profilePage.dart';
import 'package:joooragan/pages/main/transactionPage.dart';

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
        title: 'Jooragan',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.

            ),
        home: const FranchisePage());
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
//       decoration: BoxDecoration(
//         color: hitam,
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             Text('Welcome to'),
//           ],
//         ),
//       ),
//     ));
//   }
// }
