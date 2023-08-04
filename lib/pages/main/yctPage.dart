import 'package:flutter/material.dart';
import 'package:joooragan/pages/main/home.dart';
import 'package:joooragan/pages/process/CartPage.dart';
import 'package:joooragan/pages/process/ChatPage.dart';
import 'package:joooragan/pages/process/NotifPage.dart';
import 'package:joooragan/pages/process/yctTransactionPage.dart';
import 'package:joooragan/theme.dart';

class YukCatatPage extends StatefulWidget {
  const YukCatatPage({super.key});

  @override
  State<YukCatatPage> createState() => _YukCatatPageState();
}

class _YukCatatPageState extends State<YukCatatPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 0),
              child: Text("YukCatat!",
                  style: bold.copyWith(color: gold, fontSize: 24)),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ChatPage();
                      }));
                    },
                    icon: const Icon(
                      Icons.chat_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const CartPage();
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const NotifPage();
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: hitam,
        toolbarHeight: 80,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.75,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tap',
                        style: regular.copyWith(color: abu2, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '+',
                        style: bold.copyWith(color: gold, fontSize: 21),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'to add transaction',
                        style: regular.copyWith(color: abu2, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 175,
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(gold),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const YctTransactionPage();
                        }));
                      },
                      child: Row(
                        children: [
                          Text(
                            '+',
                            style: thin.copyWith(
                                color: Colors.black, fontSize: 25),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'add transaction',
                            style: regular.copyWith(
                                color: Colors.black, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
