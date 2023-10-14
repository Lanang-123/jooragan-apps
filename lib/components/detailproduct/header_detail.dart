// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:joooragan/data/DataProduct.dart';
// import 'package:joooragan/theme.dart';

// class HeaderDetailProduct extends StatefulWidget {
//   const HeaderDetailProduct({super.key});

//   @override
//   State<HeaderDetailProduct> createState() => _HeaderDetailProductState();
// }

// class _HeaderDetailProductState extends State<HeaderDetailProduct> {
//   final CarouselController carouselController = CarouselController();

//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return SliverAppBar(
//       backgroundColor: Colors.white,
//       expandedHeight: 250,
//       flexibleSpace: ClipRRect(
//         borderRadius: const BorderRadius.only(
//             bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
//         child: Stack(children: [
//           SizedBox(
//             width: width,
//             child: CarouselSlider(
//                 items: productImages
//                     .map(
//                       (img) => Image.asset(
//                         img,
//                         fit: BoxFit.fill,
//                         height: 550,
//                         width: width,
//                       ),
//                     )
//                     .toList(),
//                 carouselController: carouselController,
//                 options: CarouselOptions(
//                     autoPlay: true,
//                     aspectRatio: 1,
//                     viewportFraction: 1,
//                     scrollPhysics: const BouncingScrollPhysics(),
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     })),
//           ),
//           Container(
//             height: 250,
//             width: width,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.white.withOpacity(0.1),
//                   Colors.white.withOpacity(0.4),
//                   Colors.white.withOpacity(0.2),
//                   Colors.white.withOpacity(0.2),
//                   Colors.black.withOpacity(0.8),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: productImages.asMap().entries.map((entry) {
//                 return GestureDetector(
//                   onTap: () => carouselController.animateToPage(entry.key),
//                   child: Container(
//                     width: currentIndex == entry.key ? 17 : 7,
//                     height: 7.0,
//                     margin: const EdgeInsets.symmetric(horizontal: 3.0),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: currentIndex == entry.key
//                             ? gold
//                             : Colors.black.withOpacity(0.4)),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ]),
//       ),
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 8, top: 8),
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: CircleAvatar(
//             backgroundColor: Colors.black.withOpacity(0.4),
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(top: 8),
//           child: GestureDetector(
//             child: CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.black.withOpacity(0.4),
//               child: Icon(
//                 Icons.offline_share,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 8),
//           child: GestureDetector(
//             child: CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.black.withOpacity(0.4),
//               child: Icon(
//                 Icons.shopping_bag_outlined,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
