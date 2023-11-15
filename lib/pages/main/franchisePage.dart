import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:joooragan/api/jooragan.dart';
import 'package:joooragan/components/category.dart';
import 'package:joooragan/theme.dart';
import 'package:shimmer/shimmer.dart';

class FranchisePage extends StatefulWidget {
  const FranchisePage({super.key});

  @override
  State<FranchisePage> createState() => _FranchisePageState();
}

class _FranchisePageState extends State<FranchisePage> {
  GlobalKey _formKey = GlobalKey<FormState>();
  final JooraganService _jooraganService = JooraganService();
  TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredProducts = [];
  String selectedCategoryId = '';

  String formatToRupiah(String amount) {
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return currencyFormat.format(double.parse(amount));
  }

  // Task 1
  void filterProducts(String query) async {
    String value = _searchController.text;
    if (value.isEmpty || selectedCategoryId == null || query == '') {
      await _jooraganService.fetchProduct().then((value) {
        List<dynamic> data = value['data'];
        setState(() {
          filteredProducts = data;
        });
      });

      return;
    }

    if (selectedCategoryId != '') {
      await _jooraganService
          .productByCategory(selectedCategoryId)
          .then((value) {
        List<dynamic> data = value['data'];
        setState(() {
          filteredProducts = data.where((product) {
            // Filter by category ID
            return product['category']['id'] == selectedCategoryId;
          }).toList();
        });
      });

      return;
    }

    await _jooraganService.fetchProduct().then((products) {
      List<dynamic> productList = products['data'];

      setState(() {
        filteredProducts = productList
            .where((product) =>
                product['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    filterProducts('');
  }
  // End Task 1

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(selectedCategoryId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 20, right: 20),
              width: width,
              height: height / 4,
              decoration: BoxDecoration(color: hitam),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Franchise",
                          style:
                              bold.copyWith(color: Colors.white, fontSize: 23)),
                      Container(
                        width: 88,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gold,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/menu/order.png"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Order",
                              style: semibold.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _searchController,
                        autofocus: true,
                        onChanged: (value) {
                          filterProducts(value);
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 25,
                            ),
                            suffixIcon: const Icon(
                              Icons.keyboard_voice,
                              size: 25,
                            ),
                            suffixIconColor: Colors.grey,
                            prefixIconColor: Colors.grey,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            hintText: 'Search ...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            isDense: true,
                            isCollapsed: true,
                            filled: true,
                            fillColor: Colors.grey[300],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none)),
                        style: regular.copyWith(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 17),
              width: width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.maxFinite,
                  height: 80,
                  child: FutureBuilder(
                    future: _jooraganService.fetchCategory(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ShimmerCategoryList();
                      } else if (snapshot.hasError) {
                        // Handle error case
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final categories =
                            snapshot.data; // Mengambil data dari snapshot
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories!
                              .length, // Menggunakan jumlah kategori dari data yang diambil
                          itemBuilder: (BuildContext context, index) {
                            final ct = categories[index];
                            print(ct.icon);
                            print(
                                "URL gambar: https://api.jooragan.id/api/category-edu/icons/${ct.icon}"); // Menggunakan objek CategoryModel
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCategoryId = ct.id.toString();
                                    });
                                  },
                                  child: Container(
                                    height: 47,
                                    width: 47,
                                    margin: const EdgeInsets.only(
                                        right: 10, left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2),
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Image.network(
                                        "https://api.jooragan.id/api/category/icons/${ct.icon}",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5.4, top: 3),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 45,
                                    child: Text(ct.nama_category,
                                        style: semibold.copyWith(fontSize: 10),
                                        softWrap: true,
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Jika snapshot tidak memiliki data, tampilkan pesan atau widget lain
                        return Text('No data available');
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 0, left: 8, right: 8),
                width: width,
                height: height,
                child: FutureBuilder(
                  // Task 2
                  future: _jooraganService.fetchProduct(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ShimmerEffect();
                    } else if (snapshot.hasError) {
                      // Handle error case
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final products = snapshot.data!['data'];

                      if (filteredProducts.isEmpty) {
                        // Tampilkan pesan jika filteredProducts kosong
                        return Text(
                          'No data available',
                          textAlign: TextAlign.center,
                        );
                      }

                      return GridView.builder(
                        itemCount: filteredProducts.length,
                        padding: EdgeInsets.only(top: 0, bottom: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 3 / 4,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          final product = filteredProducts[index];
                          final title = product['title'];
                          final price = product['price'];
                          final rating = product['rating'];
                          print(product);
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width,
                                  height: 150,
                                  child: Image.network(
                                    "https://api.jooragan.id/api/products/images/${product['image']}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: semibold.copyWith(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatToRupiah(price),
                                            style: bold.copyWith(
                                              color: Colors.amber[800],
                                              fontSize: 13,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/rating1.png'),
                                              Text(
                                                "$rating / 5",
                                                style: semibold.copyWith(
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Text('No data available');
                    }
                  },
                ))
            // End Task 2

            // or: Colors.grey,
            //                   prefixIconColor: Colors.grey,
            //                   contentPadding: const EdgeInsets.symmetric(
            //                       vertical: 12, horizontal: 8),
            //                   hintText: 'Search ...',
            //                   hintStyle: const TextStyle(color: Colors.grey),
            //                   isDense: true,
            //                   isCollapsed:SizedBox(
            //   height: height * 0.10,
            //   child: Center(
            //     child: Container(
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            //       child: Row(
            //         children: [
            //           GestureDetector(
            //             onTap: () {
            //               Navigator.of(context).pop();
            //             },
            //             child: Container(
            //               padding: const EdgeInsets.all(4),
            //               decoration: BoxDecoration(
            //                   color: Colors.black.withOpacity(0.3),
            //                   borderRadius: BorderRadius.circular(50)),
            //               child: const Icon(
            //                 Icons.chevron_left_outlined,
            //                 color: Color.fromRGBO(255, 255, 255, 1),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 12,
            //           ),
            //           Expanded(
            //             child: TextFormField(
            //               autofocus: true,
            //               decoration: InputDecoration(
            //                   prefixIcon: const Icon(
            //                     Icons.search,
            //                     size: 25,
            //                   ),
            //                   suffixIcon: const Icon(
            //                     Icons.keyboard_voice,
            //                     size: 25,
            //                   ),
            //                   suffixIconCol true,
            //                   filled: true,
            //                   fillColor: Colors.grey[300],
            //                   border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(50),
            //                       borderSide: BorderSide.none)),
            //               style: regular.copyWith(color: Colors.black),
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: width,
            //   height: height * .90,
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
            //   decoration: const BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(25),
            //           topRight: Radius.circular(25))),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(
            //         height: 150,
            //         child: ListView.builder(itemBuilder: (context, index) {
            //           return ListTile(
            //             contentPadding: const EdgeInsets.all(0),
            //             leading: Icon(
            //               Icons.info_outline,
            //               color: Colors.grey[400],
            //             ),
            //             trailing: IconButton(
            //                 onPressed: () {
            //                   setState(() {});
            //                 },
            //                 icon: Icon(
            //                   Icons.close,
            //                   color: Colors.grey[400],
            //                 )),
            //           );
            //         }),
            //       ),
            //       SizedBox(
            //         width: width,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               'More Options',
            //               style: regular.copyWith(color: Colors.grey[400]),
            //             ),
            //             const SizedBox(
            //               width: 3,
            //             ),
            //             Icon(
            //               Icons.arrow_drop_down,
            //               color: Colors.grey[400],
            //             )
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         'You may like',
            //         style: bold.copyWith(fontSize: 20),
            //       ),
            //       SizedBox(
            //         height: 150,
            //         child: ListView.builder(itemBuilder: (context, index) {
            //           return ListTile(
            //             contentPadding: const EdgeInsets.all(0),
            //             leading: const Icon(
            //               Icons.show_chart_sharp,
            //               color: Colors.black,
            //             ),
            //             title: Text(""),
            //           );
            //         }),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
    ;
  }
}

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 222, 222, 222),
      highlightColor: Color.fromARGB(255, 222, 220, 220),
      period: Duration(milliseconds: 5000),
      child: GridView.builder(
        itemCount: 10, // Jumlah item placeholder yang ingin ditampilkan
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width,
                  height: 150,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 80,
                            height: 20,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ShimmerCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 243, 240, 240),
      highlightColor: Color.fromARGB(255, 222, 220, 220),
      period: Duration(milliseconds: 1500), // Atur periode sesuai kebutuhan
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            5, // Ganti dengan jumlah kategori yang ingin Anda tampilkan sebagai placeholder
        itemBuilder: (BuildContext context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.4, top: 3),
                child: Container(
                  alignment: Alignment.center,
                  width: 45,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
