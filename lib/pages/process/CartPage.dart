import 'package:flutter/material.dart';
import 'package:joooragan/theme.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "name": "Boba Ice Viral",
      "image": "assets/images/product/product2.png",
      "package": "A",
      "title": "Milk Boba Brown Sugar",
      "price": 3700000,
      "isChecked": true
    },
    {
      "id": 2,
      "name": "Chicken Jakarta",
      "image": "assets/images/product/product3.png",
      "package": "A",
      "title": "Fried Chicken Jakarta",
      "price": 10000,
      "isChecked": false
    },
  ];

  bool checkAll = false;

  var formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
  int totalHarga = 0;

  int jmlOrder = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    for (int i = 0; i < products.length; i++) {
      if (products[i]['isChecked'] == true) {
        totalHarga += products[i]['price'] as int;
      }
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.white,
              size: 28,
            )),
        backgroundColor: hitam,
        toolbarHeight: 120,
        title: Container(
          margin: const EdgeInsets.only(left: 90, top: 30),
          child: Text("Cart", style: bold.copyWith(color: gold, fontSize: 24)),
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                child: Row(
                  children: [
                    Checkbox(
                        value: checkAll,
                        onChanged: (value) {
                          setState(() {
                            checkAll = value!;
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Select All',
                        style: semibold.copyWith(
                            fontSize: 16, color: Colors.grey)),
                    const Divider(height: 1, color: Colors.grey),
                  ],
                )),
            Container(
              width: width,
              height: height,
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    String harga = formatCurrency.format(product['price']);

                    return Column(
                      children: [
                        CheckboxListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            controlAffinity: ListTileControlAffinity.leading,
                            value:
                                checkAll == true || product['isChecked'] == true
                                    ? true
                                    : false,
                            title: Row(
                              children: [
                                Image.asset(
                                  'assets/images/cart/shop.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  product['name'],
                                  style: semibold.copyWith(fontSize: 12),
                                )
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          product['image'],
                                          width: 86,
                                          height: 86,
                                        )),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product['title'],
                                            style: bold.copyWith(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            'Package ${product['package']}',
                                            style: semibold.copyWith(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            harga,
                                            style: bold.copyWith(
                                                fontSize: 13,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Add Note',
                                          style: regular.copyWith(
                                              color: gold, fontSize: 10),
                                        )),
                                    Stack(children: [
                                      SizedBox(
                                        height: 30,
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                          "Konfirmasi Hapus",
                                                          style:
                                                              semibold.copyWith(
                                                                  fontSize: 16),
                                                        ),
                                                        content: Text(
                                                          "Apakah Anda yakin ingin membatalkan barang ini ?",
                                                          style:
                                                              semibold.copyWith(
                                                                  fontSize: 18),
                                                        ),
                                                        actions: [
                                                          FilledButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStatePropertyAll(
                                                                          hitam)),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                "Tidak",
                                                                style: semibold.copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                          FilledButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStatePropertyAll(
                                                                          gold)),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                setState(() {
                                                                  products
                                                                      .removeAt(
                                                                          index);
                                                                });
                                                              },
                                                              child: Text(
                                                                "Ya",
                                                                style: semibold
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .white),
                                                              ))
                                                        ],
                                                      );
                                                    });
                                                // setState(() {
                                                //   products.removeAt(index);
                                                // });
                                              },
                                              child: Image.asset(
                                                'assets/images/cart/trash.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (jmlOrder == 0) {
                                                          return;
                                                        }
                                                        jmlOrder--;
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.remove,
                                                      size: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    '$jmlOrder',
                                                    style: semibold.copyWith(
                                                        fontSize: 13),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        jmlOrder++;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: gold,
                                                      size: 15,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ])
                                  ],
                                )
                              ],
                            ),
                            onChanged: (value) {
                              setState(() {
                                product['isChecked'] = value;
                                if (product['isChecked'] == true) {
                                  totalHarga += product['price'] as int;
                                } else if (product['isChecked'] == false) {
                                  totalHarga -= product['price'] as int;
                                }
                              });
                            }),
                        Divider(height: 1, color: Colors.grey.withOpacity(0.3)),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Payment',
                  style: bold,
                ),
                Text(
                  formatCurrency.format(totalHarga),
                  style: bold.copyWith(color: gold, fontSize: 22),
                )
              ],
            ),
            FilledButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                    backgroundColor: MaterialStatePropertyAll(gold),
                    shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {},
                child: Text(
                  'Beli ($jmlOrder)',
                  style: semibold.copyWith(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
