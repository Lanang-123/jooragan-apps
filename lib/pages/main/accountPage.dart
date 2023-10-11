import 'package:flutter/material.dart';
import 'package:joooragan/theme.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  WebViewController? _controller;
  final String webUrl = 'https://jooragan.id/';
  bool isWebViewVisible = true;
  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(webUrl));
  }
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    late WebViewController _webViewController;

    return Scaffold(
      body: Stack(children: [
        Visibility(
          visible: isWebViewVisible,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: width,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 70),
                  decoration: BoxDecoration(
                      color: hitam, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isWebViewVisible = !isWebViewVisible;
                                  });
                                },
                                icon: Icon(Icons.store_mall_directory,
                                    color: Colors.white, size: 30)),
                            Icon(
                              Icons.manage_accounts_outlined,
                              color: Colors.white,
                              size: 30,
                            )
                          ]),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              "assets/images/avatar.png",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Sasra Wiardhana",
                              style: semibold.copyWith(
                                  color: gold2, fontSize: 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "083114701982",
                                style: semibold.copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Security",
                    style: bold.copyWith(fontSize: 18),
                  ),
                ),
                Container(
                  height: 50,
                  width: width,
                  // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  //   BoxShadow(
                  //       color: abu,
                  //       blurRadius: 2,
                  //       offset: Offset(0, 2),
                  //       spreadRadius: .1)
                  // ]),
                  child: ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      color: hitam,
                    ),
                    title: Text(
                      "Change Security Code",
                      style: semibold,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: hitam,
                    ),
                  ),
                ),
                Divider(
                  color: abu,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Help",
                    style: bold.copyWith(fontSize: 18),
                  ),
                ),
                Container(
                  height: 50,
                  width: width,
                  child: ListTile(
                    leading: Icon(
                      Icons.help_outline,
                      color: hitam,
                    ),
                    title: Text(
                      "Help Center",
                      style: semibold,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: hitam,
                    ),
                  ),
                ),
                Divider(
                  color: abu,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "About",
                    style: bold.copyWith(fontSize: 18),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: width,
                      child: ListTile(
                        leading: Icon(
                          Icons.phone_android,
                          color: hitam,
                        ),
                        title: Text(
                          "Platform Advantage",
                          style: semibold,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: hitam,
                          size: 17,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: width,
                      child: ListTile(
                        leading: Icon(
                          Icons.lightbulb_outline_rounded,
                          color: hitam,
                        ),
                        title: Text(
                          "Guide",
                          style: semibold,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: hitam,
                          size: 17,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: width,
                      child: ListTile(
                        leading: Icon(
                          Icons.document_scanner_outlined,
                          color: hitam,
                        ),
                        title: Text(
                          "Terms & Condition",
                          style: semibold,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: hitam,
                          size: 17,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: width,
                      child: ListTile(
                        leading: Icon(
                          Icons.privacy_tip_outlined,
                          color: hitam,
                        ),
                        title: Text(
                          "Provacy Policy",
                          style: semibold,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: hitam,
                          size: 17,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: width,
                      child: ListTile(
                        leading: Icon(
                          Icons.star_border_outlined,
                          color: hitam,
                        ),
                        title: Text(
                          "Give Rating",
                          style: semibold,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: hitam,
                          size: 17,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "version 1.1",
                      style: regular.copyWith(color: abu3),
                    ),
                    Container(
                      height: 45,
                      width: width / 1.5,
                      child: FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(gold)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout_outlined),
                              Text(
                                "Sign Out",
                                style: bold.copyWith(fontSize: 16),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: !isWebViewVisible,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: WebViewWidget(
              controller: _controller!,
            ),
          ),
        ),
      ]),
    );
  }
}
