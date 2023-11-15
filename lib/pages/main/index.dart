import 'package:flutter/material.dart';
import 'package:joooragan/pages/main/accountPage.dart';
import 'package:joooragan/pages/main/educationPage.dart';
import 'package:joooragan/pages/main/franchisePage.dart';
import 'package:joooragan/pages/main/home.dart';
import 'package:joooragan/pages/main/transactionPage.dart';
import 'package:joooragan/pages/main/yctPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  List<Widget> _pageOptions = [
    HomePage(),
    FranchisePage(),
    EducationPage(),
    YukCatatPage(),
    // TransactionPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_pageOptions.elementAt(_selectedPage)],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedPage,
        onTap: (i) => setState(() => _selectedPage = i),
        items: [
          SalomonBottomBarItem(
              icon: Image.asset(
                'assets/images/menu/home.png',
                width: 20,
                height: 20,
              ),
              title: const Text(
                "Home",
              ),
              selectedColor: Colors.black),
          SalomonBottomBarItem(
              icon: Image.asset(
                'assets/images/menu/franchise.png',
                width: 20,
                height: 20,
              ),
              title: const Text("Franchise"),
              selectedColor: Colors.black),
          SalomonBottomBarItem(
            icon: Image.asset(
              'assets/images/menu/education.png',
              width: 20,
              height: 20,
            ),
            title: const Text("Education"),
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              'assets/images/menu/yukcatat.png',
              width: 20,
              height: 20,
            ),
            title: const Text("YukCatat"),
            selectedColor: Colors.black,
          ),
          // SalomonBottomBarItem(
          //   icon: Image.asset(
          //     'assets/images/menu/order.png',
          //     width: 20,
          //     height: 20,
          //   ),
          //   title: const Text("Order"),
          //   selectedColor: Colors.black,
          // ),
          SalomonBottomBarItem(
            icon: Image.asset(
              'assets/images/menu/akun.png',
              width: 20,
              height: 20,
            ),
            title: const Text("Account"),
            selectedColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
