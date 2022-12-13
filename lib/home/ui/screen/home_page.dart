import 'package:flutter/material.dart';

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
              Navigator.pushNamedAndRemoveUntil(
                  context, '/live', (Route<dynamic> route) => false);
            },
            child: Text('navigate'),
          )
        ],
      ),
    );
  }
}
