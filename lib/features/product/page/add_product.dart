import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/utils/firebase_helper.dart';

import '../../../data/model/mode.dart';

class AddProduct extends StatefulWidget {
  final ProductModel? product;
  const AddProduct({Key? key, this.product}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final ImagePicker _imagePicker = ImagePicker();
  FileModel? image;
  User? user = FirebaseAuth.instance.currentUser;
  late TextEditingController _productName;
  late TextEditingController _productDescription;
  late TextEditingController _addressController;
  late TextEditingController _priceController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _productName = TextEditingController(
        text: widget.product != null ? widget.product!.name : null);
    _productDescription = TextEditingController(
        text: widget.product != null ? widget.product!.description : null);
    _addressController = TextEditingController(
        text: widget.product != null ? widget.product!.location! : null);
    _priceController = TextEditingController(
        text: widget.product != null ? widget.product!.price! : null);
    if (widget.product != null) {
      if (widget.product!.imageUrl != null) {
        image = FileModel(name: widget.product!.imageUrl);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product == null ? "Add Product" : "Edit Product"),
        ),
        body: InkWell(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                IgnorePointer(
                  ignoring: isLoading,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: _productName,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Enter Product Name';
                              } else {
                                return null;
                              }
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Product Name',
                              hintText: 'What should be product name ..?',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF090F13),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),

                        /*   const SizedBox(
                        height: 8,
                      ), */
                        //const Text('Enter Product Description'),
                        //description
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: _productDescription,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Enter Product Description';
                              } else {
                                return null;
                              }
                            },
                            obscureText: false,
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              hintText: 'Enter Product description...?',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF090F13),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        //location
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: _addressController,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Enter Product available location';
                              } else {
                                return null;
                              }
                            },
                            obscureText: false,
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: 'Location',
                              hintText: 'Product available at...?',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF090F13),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        //price
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: _priceController,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Enter Product price';
                              } else {
                                return null;
                              }
                            },
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Price',
                              hintText: 'Product price should be...?',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF090F13),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        if (image != null) _reviewImage(),
                        ElevatedButton.icon(
                            onPressed: () => _getImage(context),
                            icon: const Icon(Icons.camera_alt_outlined),
                            label: const Text('Upload image')),

                        ElevatedButton(
                            onPressed: () async {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                if (image != null) {
                                  try {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (widget.product != null) {
                                      ProductModel _product = widget.product!;
                                      _product.name = _productName.text;
                                      _product.description =
                                          _productDescription.text;
                                      _product.price = _priceController.text;
                                      _product.imageUrl = image!.name;
                                      _product.location =
                                          _addressController.text;

                                      await FirebaseHelper()
                                          .updateProduct(_product);
                                    } else {
                                      await FirebaseHelper().addProduct(
                                          ProductModel(
                                              name: _productName.text,
                                              description:
                                                  _productDescription.text,
                                              price: _priceController.text,
                                              imageUrl: image!.name,
                                              createAt: DateTime.now(),
                                              ownerId: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              location:
                                                  _addressController.text));
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pop(context);
                                  } catch (e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Text(
                                        e.toString(),
                                      ),
                                    );
                                    _scaffoldMessengerKey.currentState!
                                        .showSnackBar(snackBar);
                                  }
                                } else {
                                  const snackBar = SnackBar(
                                    backgroundColor: Colors.redAccent,
                                    content: Text(
                                      'Please upload product image',
                                    ),
                                  );
                                  _scaffoldMessengerKey.currentState!
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            child: const Center(child: Text('Add Product')))
                      ],
                    ),
                  ),
                ),
                if (isLoading)
                  Positioned(
                      top: MediaQuery.of(context).size.height / 3,
                      left: MediaQuery.of(context).size.width / 2,
                      child: const Center(child: CircularProgressIndicator()))
              ]),
            ),
          ),
        ),
      ),
    );
  }

  _getImage(BuildContext context) {
    return showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.camera_alt_rounded),
              label: const Text("Camera"),
              onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            TextButton.icon(
              icon: const Icon(Icons.collections_bookmark_rounded),
              label: const Text("Gallery"),
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
        title: const Text("Choose image source"),
      ),
    ).then((ImageSource? source) async {
      if (source != null) {
        XFile? pickedFile =
            await _imagePicker.pickImage(source: source, imageQuality: 70);
        if (pickedFile != null) {
          uploadFile(pickedFile);
        }
      }
    });
  }

  _reviewImage() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          image?.file == null
              ? Image.network(
                  image?.name ?? "",
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  File(image!.file!.path),
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
          Positioned(
            child: CircleAvatar(
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  removeFile(image?.file!.path);
                  setState(() {
                    image = null;
                  });
                },
              ),
            ),
            bottom: 160,
            left: 260,
          ),
        ],
      ),
    );
  }

  Future<void> uploadFile(XFile filePath) async {
    File file = File(filePath.path);

    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseStorage.instance
          .ref('Images/${user!.uid}/${filePath.path.split('/').last}')
          .putFile(file)
          .then((fileSnapshot) async {
        debugPrint(fileSnapshot.storage.bucket);
        if (fileSnapshot.state == TaskState.success) {
          final String downloadUrl = await fileSnapshot.ref.getDownloadURL();
          setState(() {
            image = FileModel(file: filePath, name: downloadUrl);
            isLoading = false;
          });
        }
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      const snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Server Error While Uploading File',
        ),
      );
      _scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
      debugPrint(e.toString());
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      const snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Unable to uploda file',
        ),
      );
      _scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
    }
  }

  Future<void> removeFile(String? path) async {
    if (path != null) {
      try {
        await FirebaseStorage.instance
            .ref('Images/${user!.uid}/${path.split('/').last}')
            .delete();
      } on FirebaseException catch (e) {
        debugPrint(e.toString());
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
