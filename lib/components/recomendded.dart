import 'package:flutter/material.dart';
import 'package:joooragan/api/jooragan.dart';
import 'package:joooragan/pages/main/DetailProductPage.dart';
import 'package:joooragan/theme.dart';

class RecomendedProduct extends StatefulWidget {
  const RecomendedProduct({super.key});

  @override
  State<RecomendedProduct> createState() => _RecomendedProductState();
}

class _RecomendedProductState extends State<RecomendedProduct> {
  final JooraganService _jooraganService = JooraganService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21),
      child: SizedBox(
          height: 198,
          child: FutureBuilder(
              future: _jooraganService.fetchProduct(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle error case
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final products = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      print(product);
                      return Stack(
                        children: [
                          Stack(children: [
                            SizedBox(
                              width: 229,
                              height: 198,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                    "https://api.jooragan.id/api/products/images/${product.image}",
                                    width: 229,
                                    height: 198,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return const DetailProductPage();
                                // }));
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
                                      Colors.white.withOpacity(0.2),
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
                                  Text(
                                    product.title,
                                    style: bold.copyWith(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/rating1.png'),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 3),
                                        child: Text(
                                          '${product.rating}/5',
                                          style: thin.copyWith(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      );
                    },
                  );
                } else {
                  // Jika snapshot tidak memiliki data, tampilkan pesan atau widget lain
                  return Text('No data available');
                }
              })),
    );
  }
}
