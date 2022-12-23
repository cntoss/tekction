import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widget/auction_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                          context.router.pushNamed(AppRoutes.liveChatPath);
                        },
                        child: const Text('Go to live'),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        AuctionCard(
                          imageUrl: 'https://picsum.photos/300/300',
                          vendor: 'jackyoung',
                          name: 'Product to start\nyour yoga journey',
                          onRsvpPressed: () {
                            context.router.pushNamed(AppRoutes.livePath);
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        AuctionCard(
                          imageUrl: 'https://picsum.photos/300/300',
                          vendor: 'jackyoung',
                          name: 'Summer outfits under\n 100\$',
                          isLive: true,
                          onLivePressed: () {
                            context.router.pushNamed(AppRoutes.liveChatPath);
                          },
                        ),
                      ]),
                    ),
            ),
    );
  }
}
