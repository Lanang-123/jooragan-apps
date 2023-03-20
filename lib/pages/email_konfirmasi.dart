import 'package:flutter/material.dart';
import 'package:joooragan/pages/login.dart';
import 'package:joooragan/pages/reset_password.dart';
import 'package:joooragan/theme.dart';

class EmailConfirm extends StatelessWidget {
  const EmailConfirm({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 117, right: 100),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(
              Icons.mail_outlined,
              color: gold,
              size: 140,
            ),
            const SizedBox(
              height: 56,
            ),
            Text(
              'Check Your Email',
              style: semibold.copyWith(color: Colors.black, fontSize: 19),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              textAlign: TextAlign.center,
              'Please check your email and center confirmation',
              style: thin.copyWith(
                  color: Color.fromARGB(255, 196, 195, 195), fontSize: 11.5),
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              height: 50,
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(hitam2)),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'OPEN MAIL',
                      style: semibold.copyWith(color: Colors.white),
                    ),
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStatePropertyAll(
                          BorderSide(color: hitam, width: 2)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Center(
                    child: Text(
                      'CONFIRM LATER',
                      style: semibold.copyWith(color: Colors.black),
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPassword()));
                },
                child: Text(
                  'From Email',
                  style: semibold.copyWith(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ))
          ]),
        ),
      ),
    );
  }
}
