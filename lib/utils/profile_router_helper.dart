/* import 'dart:convert';

import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/navigation/router.gr.dart';

import '../data/model/mode.dart' hide User;

checkToProfile(context) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    Navigator.pushNamed(context, '/sign-in');
  } else {
    DataSnapshot dataSnapshot =
        await FirebaseDatabase.instance.ref('$userModel/${user.uid}').get();
    if (dataSnapshot.value != null) {
      UserModel user = UserModel.fromJson(
          jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>);

      AutoRouter.of(context).push(UserProfileScreenRoute(user: user));
    } else {
      AutoRouter.of(context).push(EditProfileScreenRoute());

      //context.router.pushNamed(AppRoutes.profileEditPath);

      /*  Navigator.push(
          context, MaterialPageRoute(builder: (_) => const AddUserScreen())); */
    }
  }
}
 */