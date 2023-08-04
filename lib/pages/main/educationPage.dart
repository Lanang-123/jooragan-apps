import 'package:flutter/material.dart';
import 'package:joooragan/data/data_categorys_edu.dart';
import 'package:joooragan/pages/process/CartPage.dart';
import 'package:joooragan/pages/process/ChatPage.dart';
import 'package:joooragan/pages/process/NotifPage.dart';
import 'package:joooragan/pages/process/SearchPage.dart';
import 'package:joooragan/theme.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(left: 21, right: 20),
          height: height * 0.32,
          decoration: BoxDecoration(
              color: hitam,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 70,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Education",
                    style: bold.copyWith(color: gold2, fontSize: 24),
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
                                    MaterialPageRoute(builder: (context) {
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
                                    MaterialPageRoute(builder: (context) {
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
                                    MaterialPageRoute(builder: (context) {
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
              SizedBox(
                height: 20,
              ),
              Text(
                "What do you want to know today?",
                style: semibold.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              FilledButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
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
                        'Search news of course',
                        style: semibold.copyWith(color: Colors.grey),
                      )
                    ],
                  )),
            ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recomendation",
                style: semibold.copyWith(fontSize: 18),
              ),
              Column(
                  children: categorys.map((data) {
                return Row(
                  children: [
                    Container(
                      height: 47,
                      width: 47,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Image.asset(data["image_path"]),
                    ),
                  ],
                );
              }).toList())
            ],
          ),
        )
      ]),
    ));
  }
}

// Row(
//                     children: [
//                       Container(
//                         height: 47,
//                         width: 47,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 0,
//                                   blurRadius: 5,
//                                   offset: const Offset(0, 5))
//                             ]),
//                         child: Image.asset(),
//                       ),
//                     ],
//                   ),