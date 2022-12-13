import 'package:flutter/material.dart';
import 'package:tekction/core/route_manager.dart';

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
      body: Column(
        children: [
          const Center(child: Text("Welcome")),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/live');
            },
            child: Text('navigate'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.liveWithChat);
            },
            child: Text('Live with chat'),
          )
        ],
      ),
    );
  }
}
