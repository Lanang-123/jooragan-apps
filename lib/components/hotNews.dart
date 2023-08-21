import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joooragan/data/dataHotNews.dart';
import 'package:joooragan/theme.dart';

class HotNews extends StatefulWidget {
  const HotNews({super.key});

  @override
  State<HotNews> createState() => _HotNewsState();
}

class _HotNewsState extends State<HotNews> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 250,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: ListView.builder(
          padding: EdgeInsets.zero, // Tambahkan padding zero di sini
          scrollDirection: Axis.vertical,
          itemCount: hotNews.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(
                left: 13,
                top: 12,
                right: 12,
                bottom: 13,
              ),
              width: width,
              height: 112,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      hotNews[index].image,
                      width: 90,
                      height: 87,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 7),
                    width: 200,
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            hotNews[index].title,
                            style: semibold.copyWith(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.account_circle_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              hotNews[index].author,
                              style: regular.copyWith(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.timer_sharp,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '2hr',
                              style: regular.copyWith(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
