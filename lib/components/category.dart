import 'package:flutter/material.dart';
import 'package:joooragan/data/dataCtg.dart';
import 'package:joooragan/theme.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 20),
      child: Container(
        width: double.maxFinite,
        height: 80,
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
            }
        ),
      ),
    );
  }
}
