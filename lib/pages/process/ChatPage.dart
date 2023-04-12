import 'package:flutter/material.dart';
import 'package:joooragan/theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
      "title":
          "Fried Chicken Jakarta ashdjahsdhahdwhadjhawhdadhahwdhdhjwahdhajhdhajdhajhdjwhadhaw",
      "price": 10000,
      "isChecked": false
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
    {
      "id": 2,
      "name": "Chicken Jakarta",
      "image": "assets/images/product/product3.png",
      "package": "A",
      "title": "Fried Chicken Jakarta",
      "price": 10000,
      "isChecked": false
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
    {
      "id": 2,
      "name": "Chicken Jakarta",
      "image": "assets/images/product/product3.png",
      "package": "A",
      "title": "Fried Chicken Jakarta",
      "price": 10000,
      "isChecked": false
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
    {
      "id": 2,
      "name": "Chicken Jakarta",
      "image": "assets/images/product/product3.png",
      "package": "A",
      "title": "Fried Chicken Jakarta",
      "price": 10000,
      "isChecked": false
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
    {
      "id": 2,
      "name": "Chicken Jakarta",
      "image": "assets/images/product/product3.png",
      "package": "A",
      "title": "Fried Chicken Jakarta",
      "price": 10000,
      "isChecked": false
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
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
            child:
                Text("Chat", style: bold.copyWith(color: gold, fontSize: 24)),
          ),
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 135),
              height: height,
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(product['image']),
                            ),
                            dense: true,
                            title: Text(
                              product['name'],
                              style: bold.copyWith(fontSize: 17),
                            ),
                            subtitle: Container(
                              width: 100,
                              child: Text(
                                product['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: regular.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            trailing: Container(
                              width: 20,
                              height: 20,
                              color: gold,
                              child: Center(
                                  child: Text(
                                '2',
                                style: semibold,
                              )),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: height,
              color: Colors.amber,
              child: Text(
                'Obey Ganteng',
                style: semibold.copyWith(fontSize: 20),
              ),
            )
          ],
        ))));
  }
}
