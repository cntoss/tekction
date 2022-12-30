import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/utils/firebase_helper.dart';

import '../../../model/mode.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel? user;
  const EditProfileScreen({Key? key, this.user}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _name;
  late TextEditingController _phone;
  late TextEditingController _address;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _name = TextEditingController(
        text: widget.user != null ? widget.user!.userDisplayName : null);
    _phone = TextEditingController(
        text: widget.user != null ? widget.user!.phone : null);
    _address = TextEditingController(
        text: widget.user != null ? widget.user!.address : null);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Create Profile'),
            centerTitle: true,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _name,
                          decoration: const InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person_outline)),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Name must not be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: _phone,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              labelText: 'Phone',
                              prefixIcon: Icon(Icons.phone_android_outlined)),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Phone number must not be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: _address,
                          decoration: const InputDecoration(
                              labelText: 'Address',
                              prefixIcon: Icon(Icons.location_city_outlined)),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Address must not be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                try {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  String uuId =
                                      FirebaseAuth.instance.currentUser!.uid;
                                  UserModel _user = UserModel(
                                      id: uuId,
                                      userDisplayName: _name.text,
                                      address: _address.text,
                                      phone: _phone.text);
                                  await FirebaseHelper().updateUser(_user);
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  if (widget.user == null) {
                                    /*    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => UserProfileScreen(
                                                  user: _user,
                                                ))); */
                                  } else {
                                    Navigator.pop(context, true);
                                  }
                                } catch (e) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              }
                            },
                            child: const Text('Submit'))
                      ],
                    ),
                  ),
                ),
                if (_isLoading) const Center(child: CircularProgressIndicator())
              ],
            ),
          )),
    );
  }
}
