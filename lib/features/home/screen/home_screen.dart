import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/navigation/router.gr.dart';

import '../../../utils/widgets/basic_scaffold_view.dart';
import '../widget/auction_card.dart';

class HomeScreen extends StatefulWidget {
  final bool isBroadCaster;
  const HomeScreen({super.key, this.isBroadCaster = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffoldView(
      bodyWidget: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !widget.isBroadCaster
            ? Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.router
                        .push(LiveStreamingRoute(isBroadCaster: true));
                  },
                  child: const Text('Go to live'),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  AuctionCard(
                    imageUrl: 'https://picsum.photos/300/300',
                    vendor: 'Mister Asmit',
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
                    vendor: 'Mister Santosh',
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
