import 'package:flutter/material.dart';
import 'package:joooragan/pages/login.dart';
import 'package:joooragan/theme.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFD9D9D9),
            child: Column(
              children: [
                Container(
                  height: height * .5,
                  decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide.none,
                        left: BorderSide.none,
                        right: BorderSide.none,
                        bottom: BorderSide.none,
                      ),
                      color: hitam,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.elliptical(83, 50),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: hitam,
                  ),
                  child: Container(
                    height: height * .5,
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide.none,
                          left: BorderSide.none,
                          right: BorderSide.none,
                          bottom: BorderSide.none,
                        ),
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(83, 50))),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: height * 0.8,
              width: width * 0.8,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 318,
                width: 315,
              ),
            ),
          ),
          Positioned(
              top: height * 0.25 - (width * 0.2),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide.none,
                  ),
                ),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome To',
                      style:
                          semibold.copyWith(color: Colors.white, fontSize: 34),
                    )
                  ],
                ),
              )),
          Positioned(
              top: height * .5 + (width * 0.4),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide.none,
                  ),
                ),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'JOORAGAN',
                      style: bold.copyWith(color: gold, fontSize: 48),
                    )
                  ],
                ),
              )),
          Positioned(
            top: height * .75 + (width * 0.23),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                  bottom: BorderSide.none,
                ),
              ),
              width: width,
              
            ),
          )
        ],
      ),
    );
  }
}
