import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekction/common/app_constant.dart';
import 'package:tekction/core/route_manager.dart';
import 'package:tekction/helper/logout_helper.dart';

import '../widget/auction_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isBroadCaster;

  @override
  void initState() {
    checkBroadcaster();
    super.initState();
  }

  checkBroadcaster() async {
    await [Permission.microphone, Permission.camera].request();
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    setState(() {
      isBroadCaster = sharedPref.getBool(broadcasterKey) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auction"),
        actions: [
          IconButton(
              onPressed: () => LogoutHelper().logOuts(context),
              icon: const Icon(Icons.output_outlined))
        ],
      ),
      // backgroundColor: Colors.indigo,
      body: isBroadCaster == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: isBroadCaster!
                  ? Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.liveWithChat,
                              arguments: true);
                        },
                        child: const Text('Go to live'),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        AcutionCard(
                          imageUrl: 'https://picsum.photos/300/300',
                          vendor: 'jackyoung',
                          name: 'Product to start\nyour yoga journey',
                          onRsvpPressed: () {
                            Navigator.pushNamed(context, '/live');
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        AcutionCard(
                          imageUrl: 'https://picsum.photos/300/300',
                          vendor: 'jackyoung',
                          name: 'Summer outfits under\n 100\$',
                          isLive: true,
                          onLivePressed: () {
                            Navigator.pushNamed(context, Routes.liveWithChat,
                                arguments: false);
                          },
                        ),
                      ]),
                    ),
            ),
    );
  }
}
