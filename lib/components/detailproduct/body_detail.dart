import 'package:flutter/material.dart';
import 'package:joooragan/theme.dart';
import 'package:intl/intl.dart';

class BodyDetailProduct extends StatefulWidget {
  const BodyDetailProduct({super.key});

  @override
  State<BodyDetailProduct> createState() => _BodyDetailProductState();
}

class _BodyDetailProductState extends State<BodyDetailProduct> {
  int price = 1000000;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var formatCurrency =
        new NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    String formattedPrice = formatCurrency.format(price);

    return SingleChildScrollView(
      child: Container(
        height: height * 1.5,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Milk Boba Brown Sugar',
              style: bold.copyWith(fontSize: 24),
            ),
            Text(
              formattedPrice,
              style: bold.copyWith(fontSize: 20, color: gold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 12),
                    height: 50,
                    width: 200,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Image.asset(
                                'assets/images/rating1.png',
                                width: 12,
                                height: 12,
                              ),
                              Image.asset(
                                'assets/images/rating1.png',
                                width: 12,
                                height: 12,
                              ),
                              Image.asset(
                                'assets/images/rating1.png',
                                width: 12,
                                height: 12,
                              ),
                              Image.asset(
                                'assets/images/rating1.png',
                                width: 12,
                                height: 12,
                              ),
                              Image.asset(
                                'assets/images/rating1.png',
                                width: 12,
                                height: 12,
                              ),
                              Image.asset(
                                'assets/images/rating1.png',
                                width: 12,
                                height: 12,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '4.9 | 4 sold',
                                style: semibold.copyWith(color: Colors.black),
                              )
                            ],
                          );
                        })),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'View Review',
                      style: semibold.copyWith(color: gold),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/cart/shop.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text('Boba Ice Viral', style: semibold)
              ],
            )
          ],
        ),
      ),
    );
  }
}
