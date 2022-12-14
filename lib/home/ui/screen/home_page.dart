import 'package:flutter/material.dart';
import 'package:tekction/core/route_manager.dart';

import '../widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tekkon Auction")),
      backgroundColor: Colors.indigo,
      body: Column(
        children: [
          const Center(child: Text("Welcome")),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Product(),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/live');
            },
            child: const Text('RSVP page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.liveWithChat);
            },
            child: const Text('Live with chat'),
          )
        ],
      ),
    );
  }
}
