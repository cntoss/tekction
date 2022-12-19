import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekction/common/app_constant.dart';
import 'package:tekction/core/route_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isBroadCaster;

  @override
  void initState() {
    checkBroadcaster();
    super.initState();
  }

  checkBroadcaster() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    setState(() {
      isBroadCaster = _sharedPref.getBool(broadcasterKey) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auction")),
      backgroundColor: Colors.indigo,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (isBroadCaster) ...[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.liveWithChat);
                },
                child: const Text('Go to live'),
              )
            ] else ...[
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
                child: const Text('Join live'),
              )
            ]
          ],
        ),
      ),
    );
  }
}
