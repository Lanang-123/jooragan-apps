import 'package:flutter/material.dart';
import 'package:joooragan/pages/main/home.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:joooragan/theme.dart';

class YctTransactionPage extends StatefulWidget {
  const YctTransactionPage({super.key});

  @override
  State<YctTransactionPage> createState() => _YctTransactionPageState();
}

class _YctTransactionPageState extends State<YctTransactionPage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  bool isSelected = false;
  bool isExpand = true;
  bool isIncome = false;
  TextEditingController expanditurecontroller = TextEditingController();

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
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      "Expenditure",
                      style: semibold.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      width: width * 0.9,
                      height: height * 0.1 - 25,
                      decoration: BoxDecoration(
                          color: abu, borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: expanditurecontroller,
                            decoration: InputDecoration(
                                icon: Text(
                                  "Rp",
                                  style: semibold.copyWith(
                                      color: merah, fontSize: 20),
                                ),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            style: semibold.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: width * 0.9,
                      height: height * 0.1 - 25,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Image.asset(
                                  "assets/images/icon/YukCatat/task.png"),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Text(
                                  'Select a category',
                                  style: regular.copyWith(
                                      fontSize: 14, color: abu3),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Row(
                                      children: [
                                        Image.asset(isSelected
                                            ? "assets/images/icon/YukCatat/bulat2.png"
                                            : "assets/images/icon/YukCatat/bulat.png"),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          item,
                                          style: regular.copyWith(
                                              fontSize: 14, color: abu3),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                              isSelected = true;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: 160,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: abu,
                              ),
                            ),
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down_rounded,
                            ),
                            iconSize: 25,
                            iconEnabledColor: abu3,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(0, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      width: width * 0.9,
                      height: height * 0.1 - 25,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: abu,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: expanditurecontroller,
                            decoration: InputDecoration(
                                hintText: "Note / Description",
                                hintStyle:
                                    regular.copyWith(fontSize: 14, color: abu3),
                                icon: Image.asset(
                                    "assets/images/icon/YukCatat/stickynote.png"),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            style: regular.copyWith(fontSize: 14, color: abu3),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          width: width * 0.4,
                          height: height * 0.1 - 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: abu,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(11)),
                          child: Row(
                            children: [
                              Image.asset(
                                  "assets/images/icon/YukCatat/stickynote.png"),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Transaction Date",
                                style:
                                    regular.copyWith(fontSize: 10, color: abu3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
