import 'package:flutter/material.dart';
import 'package:joooragan/data/DataNotif.dart';
import 'package:joooragan/theme.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  final String _shop = 'assets/images/notif/payment.png';
  final String _promo = 'assets/images/notif/promo.png';
  final String _info = 'assets/images/notif/information.png';

  late bool isRead;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
            margin: const EdgeInsets.only(left: 50, top: 30),
            child: Text("Notification",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                child: Text('Latest',
                    style: bold.copyWith(fontSize: 16, color: Colors.black)),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 50),
                width: width,
                height: height,
                child: ListView.builder(
                  itemCount: notifs.length,
                  itemBuilder: (context, index) {
                    String iconStatus = notifs[index].iconStatus;
                    isRead = notifs[index].isRead;
                    String title = notifs[index].title;
                    String titleStatus = notifs[index].titleStatus;
                    String desc = notifs[index].desc;
                    int hour = notifs[index].hour;

                    return Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                              bottom: 30, top: 10, left: 20, right: 20),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                titleStatus,
                                style: semibold.copyWith(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                title,
                                style: bold.copyWith(
                                    fontSize: 14, color: Colors.black),
                              )
                            ],
                          ),
                          subtitle: Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              desc,
                              style: regular.copyWith(
                                  fontSize: 11, color: Colors.black),
                            ),
                          ),
                          tileColor: isRead
                              ? Colors.amber.withOpacity(0.2)
                              : Colors.white,
                          onTap: () {
                            setState(() {
                              isRead = false;
                            });
                          },
                          trailing: Text(
                            '${hour}h',
                            style: semibold.copyWith(color: Colors.grey),
                          ),
                          leading: Image(
                              image: AssetImage(iconStatus == "Shop"
                                  ? _shop
                                  : iconStatus == "Info"
                                      ? _info
                                      : _promo)),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.3),
                          height: 1,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
