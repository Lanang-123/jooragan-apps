import 'package:flutter/material.dart';
import 'package:joooragan/data/DataPopularEdu.dart';
import 'package:joooragan/pages/main/DetailProductPage.dart';
import 'package:joooragan/theme.dart';

class MostPopularEdu extends StatelessWidget {
  const MostPopularEdu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 198,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eduPopular.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Stack(children: [
                SizedBox(
                  width: 229,
                  height: 198,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      eduPopular[index].image,
                      width: 210,
                      height: 198,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DetailProductPage();
                    }));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 3),
                    height: 190,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.2),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
              Positioned(
                  bottom: 25,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          eduPopular[index].title,
                          style:
                              bold.copyWith(fontSize: 15, color: Colors.white),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            child: Text(
                              '${eduPopular[index].akun}',
                              style: thin.copyWith(
                                  fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
