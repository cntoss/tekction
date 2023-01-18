import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:preferences/preferences.dart';

import '../navigation/router.gr.dart';

class LogoutHelper {
  Future loggedOutAlert(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      content: const Text("Are you sure, You want to log out?"),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorManager.purple),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: ColorManager.purple)))),
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            logOuts(context);
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white70)))),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.pink),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ],
    );

    return showDialog(context: context, builder: (_) => alertDialog);
  }

  logOuts(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    //final action = FlutterFireUIAction.ofType<SignedOutAction>(context);
    //action?.callback(context);
    context.router.pop();
    context.router.popAndPush(const SplashRoute());
  }
}
