import 'package:flutter/material.dart';
import 'package:joooragan/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> historys = ['Marketing Plan', 'Es Boba', 'Baju Pantai'];

  List<String> favorites = [
    'Baju Pantai',
    'Go to market strategy',
    'Success tips'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: hitam,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.10,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.chevron_left_outlined,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
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
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: width,
            height: height * .90,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: historys.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Icon(
                            Icons.info_outline,
                            color: Colors.grey[400],
                          ),
                          title: Text(
                            historys[index],
                            style: regular,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  historys.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey[400],
                              )),
                        );
                      }),
                ),
                SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'More Options',
                        style: regular.copyWith(color: Colors.grey[400]),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey[400],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'You may like',
                  style: bold.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.show_chart_sharp,
                            color: Colors.black,
                          ),
                          title: Text(
                            favorites[index],
                            style: regular,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
