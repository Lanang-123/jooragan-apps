import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joooragan/theme.dart';
import 'package:joooragan/data/dataCtgEdu.dart';

class CategoryEdu extends StatefulWidget {
  const CategoryEdu({super.key});

  @override
  State<CategoryEdu> createState() => _CategoryEduState();

  static map(Column Function(dynamic ct) param0) {}
}

class _CategoryEduState extends State<CategoryEdu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.maxFinite,
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorys.length,
            itemBuilder: (BuildContext context, index) {
              final ct = categorys[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      print(ct.idCtg);
                    },
                    child: Container(
                      height: 47,
                      width: 47,
                      margin: const EdgeInsets.only(right: 10, left: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 2))
                          ]),
                      child: Center(
                          child: Image.asset(
                        ct.image,
                        width: 20,
                        height: 20,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, left: 8),
                    child: Text(
                      ct.title,
                      style: semibold.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
