import 'package:flutter/material.dart';
import 'package:joooragan/data/DataCourse.dart';
import 'package:joooragan/theme.dart';

class HomeCourse extends StatelessWidget {
  const HomeCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 300,
      child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(
                  left: 13, top: 12, right: 12, bottom: 13),
              width: 389,
              height: 112,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 2))
                  ]),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      courses[index].image,
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
                            courses[index].title,
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
                              courses[index].author,
                              style: regular.copyWith(
                                  color: Colors.grey, fontSize: 12),
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
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
