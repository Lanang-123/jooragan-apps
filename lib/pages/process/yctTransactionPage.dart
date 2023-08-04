import 'package:flutter/material.dart';
import 'package:joooragan/pages/main/home.dart';
import 'package:joooragan/theme.dart';

class YctTransactionPage extends StatefulWidget {
  const YctTransactionPage({super.key});

  @override
  State<YctTransactionPage> createState() => _YctTransactionPageState();
}

class _YctTransactionPageState extends State<YctTransactionPage> {
  bool isExpand = true;
  bool isIncome = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: abu,
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
        toolbarHeight: 80,
        title: Container(
          margin: const EdgeInsets.only(left: 50, top: 0),
          child: Text("New Transactions",
              style: bold.copyWith(color: gold, fontSize: 24)),
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
              width: double.infinity,
              height: height * 0.5 + 130,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: width * 0.9,
                    height: height * 0.1 - 30,
                    decoration: BoxDecoration(
                        color: abu, borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpand = true;
                              isIncome = false;
                            });
                          },
                          child: Container(
                            height: height * 0.1 - 30,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                color: isExpand ? Color(0xFFFF5656) : abu,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Expenditure",
                                  style: regular.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpand = false;
                              isIncome = true;
                            });
                          },
                          child: Container(
                            height: height * 0.1 - 30,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                color: isIncome ? Color(0xFF56FF9A) : abu,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Income",
                                  style: regular.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1 - 45,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: width * 0.9,
                    height: height * 0.1 - 30,
                    decoration: BoxDecoration(
                        color: abu, borderRadius: BorderRadius.circular(11)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.1 - 30,
                            ),
                            Text(
                              "Rp",
                              style: semibold.copyWith(
                                  color: Color(0xFFFF5656), fontSize: 20),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "0",
                              style:
                                  semibold.copyWith(fontSize: 20, color: abu2),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_open_outlined,
                    color: gold,
                  ),
                  const SizedBox(width: 10),
                  Text('Your data is 100% safe ',
                      style: regular.copyWith(color: abu2, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(10, height * 0.6 - 130, 10, 10),
        child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(gold),
            fixedSize:
                MaterialStateProperty.all(Size(width * 0.9, height * 0.1 - 30)),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const YctTransactionPage();
            }));
          },
          child: Text(
            "Save Transaction",
            style: semibold.copyWith(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
