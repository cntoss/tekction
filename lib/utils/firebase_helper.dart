import 'dart:convert';

import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../data/model/src/product_model.dart';
import '../data/model/src/user_model.dart';

class FirebaseHelper {
  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<UserModel> checkUser(
      {String? phone,
      String? displayName,
      String? address,
      String? profileImage}) async {
    try {
      String uuId = FirebaseAuth.instance.currentUser!.uid;
      DataSnapshot data = await database.ref('Users/$uuId').get();
      if (data.value != null) {
        return UserModel.fromJson(jsonDecode(jsonEncode(data.value)));
      } else {
        UserModel _user = UserModel(
            id: uuId,
            phone: phone,
            userDisplayName: displayName,
            address: address,
            profileUrl: profileImage);
        await database.ref('$UserModel/${_user.id}').set(_user.toJson());
        return _user;
      }
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      rethrow;
    }
  }

  Future updateUser(UserModel user) async {
    try {
      await database.ref('$userModel/${user.id}').set(user.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getUser(String id) async {
    try {
      DataSnapshot data = await database.ref('Users/$id').get();
      if (data.value != null) {
        return UserModel.fromJson(jsonDecode(jsonEncode(data.value)));
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addProduct(ProductModel productModel) async {
    try {
      //  DataSnapshot userData = await FirebaseDatabase.instance.ref('Products').get();
      DatabaseReference _reference =
          FirebaseDatabase.instance.ref().child('Products').push();
      productModel.id = _reference.key;
      await _reference
          .update(productModel.toJson())
          .onError((error, stackTrace) {
        debugPrint(error.toString());
      });
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      throw Exception(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateProduct(ProductModel productModel) async {
    try {
      DatabaseReference _reference =
          FirebaseDatabase.instance.ref().child('Products/${productModel.id}');
      await _reference.set(productModel.toJson()).onError((error, stackTrace) {
        debugPrint(error.toString());
      });
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      throw Exception(e);
    } catch (e) {
      rethrow;
    }
  }

  Future deleteProduct(String ref) async {
    try {
      DatabaseReference _reference =
          FirebaseDatabase.instance.ref().child('Products/$ref');
      await _reference.remove();
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      throw Exception(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFile(String? url) async {
    if (url != null) {
      try {
        await FirebaseStorage.instance.refFromURL(url).delete();
      } on FirebaseException catch (e) {
        debugPrint(e.toString());
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
