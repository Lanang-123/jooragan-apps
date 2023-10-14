// import 'package:flutter/material.dart';
// import 'package:joooragan/components/detailproduct/body_detail.dart';
// import 'package:joooragan/components/detailproduct/header_detail.dart';
// import 'package:joooragan/theme.dart';

// class DetailProductPage extends StatefulWidget {
//   const DetailProductPage({super.key});

//   @override
//   State<DetailProductPage> createState() => _DetailProductPageState();
// }

// class _DetailProductPageState extends State<DetailProductPage> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: const CustomScrollView(
//         slivers: [
//           HeaderDetailProduct(),
//           SliverToBoxAdapter(child: BodyDetailProduct()),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: hitam,
//         padding:
//             const EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 46),
//         width: width,
//         height: 103,
//         child: Row(
//           children: [
//             FilledButton.icon(
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStatePropertyAll(Colors.black.withOpacity(0.4)),
//                     shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)))),
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.chat_outlined,
//                   color: Colors.white,
//                 ),
//                 label: Text(
//                   'Chat',
//                   style: regular.copyWith(color: Colors.white),
//                 )),
//             const SizedBox(
//               width: 5,
//             ),
//             FilledButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.shopping_bag_outlined,
//                   color: Colors.white,
//                 ),
//                 label: Text(
//                   'Add Chart',
//                   style: regular.copyWith(color: Colors.white),
//                 )),
//             const SizedBox(
//               width: 20,
//             ),
//             FilledButton(
//                 onPressed: () {},
//                 child: Text(
//                   'BUY NOW',
//                   style: semibold.copyWith(color: Colors.black),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
