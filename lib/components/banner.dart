import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:joooragan/data/bannerHome.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({super.key});

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 20),
      child: Stack(children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
              items: bannerHome
                  .map(
                    (bh) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        bh.img_path,
                        fit: BoxFit.cover,
                        width: 389,
                        height: 132,
                      ),
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 3,
                  viewportFraction: 1,
                  scrollPhysics: const BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerHome.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? Colors.white
                          : Colors.white.withOpacity(0.4)),
                ),
              );
            }).toList(),
          ),
        )
      ]),
    );
  }
}
