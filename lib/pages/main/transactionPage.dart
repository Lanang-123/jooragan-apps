import 'package:flutter/material.dart';
import 'package:joooragan/pages/process/CartPage.dart';
import 'package:joooragan/pages/process/ChatPage.dart';
import 'package:joooragan/pages/process/NotifPage.dart';
import 'package:joooragan/theme.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  String? selectedValue;
  bool isSelected = false;
  bool isOnProcess = true;
  bool isDone = false;
  bool isCancel = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 0),
              child: Text("Transaction",
                  style: bold.copyWith(color: gold, fontSize: 24)),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ChatPage();
                      }));
                    },
                    icon: const Icon(
                      Icons.chat_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const CartPage();
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const NotifPage();
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: hitam,
        toolbarHeight: 80,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14.5, right: 14.5),
        child: Center(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          isOnProcess = true;
                          isDone = false;
                          isCancel = false;
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.1 - 30,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                              color: isOnProcess ? gold : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "On Process",
                                style: semibold.copyWith(
                                    color: isOnProcess ? hitam : abu2,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          isOnProcess = false;
                          isDone = true;
                          isCancel = false;
                        },
                      );
                    },
                    child: Container(
                      height: height * 0.1 - 30,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                          color: isDone ? gold : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Done",
                            style: semibold.copyWith(
                                color: isDone ? hitam : abu2, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          isOnProcess = false;
                          isDone = false;
                          isCancel = true;
                        },
                      );
                    },
                    child: Container(
                      height: height * 0.1 - 30,
                      width: width * 0.32,
                      decoration: BoxDecoration(
                          color: isCancel ? gold : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Canceled",
                            style: semibold.copyWith(
                                color: isCancel ? hitam : abu2, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
           
            GestureDetector(
              onTap: () {
                setState(() {
                  isOnProcess = true;
                  isDone = false;
                  isCancel = false;
                });
              },
              child: Column(
                children: [
                  if (isOnProcess)
                    Container(
                      padding: EdgeInsets.all(5),
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/product/product2.png"),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Milk Boba Brown Sugar",
                                style: bold.copyWith(fontSize: 15),
                              ),
                              Text(
                                "Food & Beverage",
                                style: semibold.copyWith(
                                    fontSize: 10, color: abu2),
                              ),
                              Text(
                                "Rp. 3,700,000",
                                style: semibold.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 15,
                          ),
                        ],
                      ),
                    )
                  else if (isCancel)
                    Text(
                      "Notihing has been cancelled",
                      style: semibold.copyWith(color: abu2, fontSize: 18),
                    ) // Display this text when isCancel is true
                  else
                    Container(), // Display an empty container when none of the conditions are met
                ],
              ),
)

          ],
        )),
      ),
    );
  }
}
