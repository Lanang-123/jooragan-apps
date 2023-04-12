import 'package:flutter/material.dart';
import 'package:joooragan/components/banner.dart';
import 'package:joooragan/components/category.dart';
import 'package:joooragan/components/course.dart';
import 'package:joooragan/components/recomendded.dart';
import 'package:joooragan/pages/process/CartPage.dart';
import 'package:joooragan/pages/process/ChatPage.dart';
import 'package:joooragan/pages/process/NotifPage.dart';
import 'package:joooragan/pages/process/SearchPage.dart';
import 'package:joooragan/theme.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String _search = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 21, right: 20),
              height: height * 0.25,
              decoration: BoxDecoration(
                  color: hitam,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "WednestDay,30 Nov",
                              style: thin.copyWith(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/user.jpg'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Good Morning",
                                          style: thin.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 12)),
                                      Text(
                                        "Hi, Lanang",
                                        style: semibold.copyWith(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const ChatPage();
                                          }));
                                        },
                                        icon: const Icon(
                                          Icons.chat_outlined,
                                          color: Colors.white,
                                        ))),
                                Container(
                                    margin: const EdgeInsets.only(right: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const CartPage();
                                          }));
                                        },
                                        icon: const Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Colors.white,
                                        ))),
                                Container(
                                    margin: const EdgeInsets.only(right: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const NotifPage();
                                          }));
                                        },
                                        icon: const Icon(
                                          Icons.notifications_none,
                                          color: Colors.white,
                                        ))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    FilledButton(
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey[300])),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SearchPage();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Search...',
                              style: semibold.copyWith(color: Colors.grey),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BannerHome(),
                  const SizedBox(
                    height: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21, right: 20),
                    child: Text("What Jooragan do you want?",
                        style: bold.copyWith(fontSize: 16)),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Category(),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recomendation',
                          style: bold.copyWith(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "View All",
                              style: thin.copyWith(fontSize: 12, color: gold),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const RecomendedProduct(),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Course',
                          style: bold.copyWith(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "View All",
                              style: thin.copyWith(fontSize: 12, color: gold),
                            ))
                      ],
                    ),
                  ),
                  const HomeCourse(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
