import 'dart:convert';
import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/utils/logout_helper.dart';

import '../../../data/model/src/product_model.dart';
import '../../../data/model/src/user_model.dart';
import '../../../utils/firebase_helper.dart';
import '../../product/page/add_product.dart';

// ignore: must_be_immutable
class UserProfileScreen extends StatefulWidget {
  UserModel user;
  UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfileScreen> {
  late String uuId;
  late DatabaseReference _database;
  final List<ProductModel> _products = [];

  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase.instance.ref('Products');
    uuId = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => LogoutHelper().loggedOutAlert(context),
              icon: const Icon(
                Icons.logout_outlined,
              ),
            )
          ],
        ),
        floatingActionButton: ElevatedButton.icon(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const AddProduct())),
            icon: const Icon(Icons.add),
            label: const Text('Add Product')),
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(children: [
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    Text(widget.user.userDisplayName ?? '')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.phone_outlined),
                    Text(widget.user.phone ?? '')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_city_outlined),
                    Text(widget.user.address ?? '')
                  ],
                ),
                /*      TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      AddUserScreen(user: widget.user)))
                          .then((value) async {
                        if (value == true) {
                          DataSnapshot dataSnapshot = await FirebaseDatabase
                              .instance
                              .ref('Users/${widget.user.id}')
                              .get();
                          if (dataSnapshot.value != null) {
                            UserModel user = UserModel.fromJson(
                                jsonDecode(jsonEncode(dataSnapshot.value))
                                    as Map<String, dynamic>);
                            setState(() {
                              widget.user = user;
                            });
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'))
            */
              ]),
            ),
          ),
          /*    ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const UserListScreen())),
              child: const Text('View All Users')), */
          Expanded(
            child: StreamBuilder(
                stream: _database.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.snapshot.value == null) {
                      return const Center(child: Text("No product found"));
                    } else {
                      Map<String, dynamic> data =
                          jsonDecode(jsonEncode(snapshot.data!.snapshot.value))
                              as Map<String, dynamic>;
                      _products.clear();
                      for (var element in data.values) {
                        if (element['ownerId'] == uuId) {
                          _products.add(ProductModel.fromJson(element));
                        }
                      }
                      return ListView.builder(
                          itemCount: _products.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              isThreeLine: true,
                              leading: CachedNetworkImage(
                                imageUrl: _products[index].imageUrl ?? rawImage,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: 70,
                                  child: const Center(child: Text('No Image')),
                                  decoration: const BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              title: _products[index].name != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(_products[index].name!),
                                    )
                                  : const Text("Unknown Name"),
                              subtitle: _products[index].price != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      child: Text(
                                          '$currency ${_products[index].price!}'),
                                    )
                                  : const Text('Unknown Amount'),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => AddProduct(
                                                      product: _products[index],
                                                    )));
                                      },
                                      child: const Icon(Icons.edit)),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                  title: const Text('Delete'),
                                                  content: const Text(
                                                      'Are you sure to delete this product'),
                                                  actions: [
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .red),
                                                            onPressed: () {
                                                              if (_products[
                                                                          index]
                                                                      .id !=
                                                                  null) {
                                                                FirebaseHelper()
                                                                    .removeFile(
                                                                        _products[index]
                                                                            .imageUrl);
                                                                FirebaseHelper()
                                                                    .deleteProduct(
                                                                        _products[index]
                                                                            .id!);
                                                              }
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Okay')),
                                                        const Spacer(),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Cancel'))
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            );
                          });
                    }
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
