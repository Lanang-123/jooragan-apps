import 'package:flutter/material.dart';
import 'package:joooragan/components/category_edu.dart';
import 'package:joooragan/components/hotNews.dart';
import 'package:joooragan/components/mostPopularEdu.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 70),
              height: height * 0.32,
              decoration: BoxDecoration(
                  color: hitam,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Education",
                        style: bold.copyWith(color: gold2, fontSize: 24),
                      ),
                      Container(
                        width: width * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                                "assets/images/icon/mainIcon/message.png"),
                            Image.asset("assets/images/icon/mainIcon/bag.png"),
                            Image.asset(
                                "assets/images/icon/mainIcon/notif.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "what do you want to Know today?",
                    style: semibold.copyWith(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey[300])),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SearchPage();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Search...',
                                style: semibold.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                          const Icon(Icons.mic, color: Colors.grey)
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommendation",
                    style: bold.copyWith(fontSize: (20)),
                  ),
                  const CategoryEdu(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Most Popular",
                          style: bold.copyWith(fontSize: (20))),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "View All",
                            style: thin.copyWith(fontSize: 12, color: gold),
                          ))
                    ],
                  ),
                  MostPopularEdu(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hot News", style: bold.copyWith(fontSize: (20))),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "View All",
                            style: thin.copyWith(fontSize: 12, color: gold),
                          ))
                    ],
                  ),
                  HotNews()
                ],
              ),
            ),
          ],
          
        ),
        
      ),
    );
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
