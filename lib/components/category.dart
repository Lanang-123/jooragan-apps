import 'package:flutter/material.dart';
import 'package:joooragan/api/jooragan.dart';
import 'package:joooragan/data/dataCtg.dart';
import 'package:joooragan/theme.dart';
import 'package:shimmer/shimmer.dart';

class Category extends StatefulWidget {
  final Function(String)? onCategorySelected;
  const Category({super.key, this.onCategorySelected});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final JooraganService _jooraganService = JooraganService();

  


  @override
  Widget build(BuildContext context) {
    

    return Padding(
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
              final categories = snapshot.data; // Mengambil data dari snapshot
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
                          if (widget.onCategorySelected != null) {
                            widget.onCategorySelected!(ct.id.toString());
                          }
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
                        padding: const EdgeInsets.only(left: 5.4, top: 3),
                        child: Container(
                          alignment: Alignment.center,
                          width: 45,
                          child: Text(
                            ct.nama_category,
                              style: semibold.copyWith(fontSize: 10),
                              softWrap: true,
                              textAlign: TextAlign.center
                           
                          ),
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
