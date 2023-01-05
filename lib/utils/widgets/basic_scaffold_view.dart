import 'package:flutter/material.dart';

class BasicScaffoldView extends StatelessWidget {
  const BasicScaffoldView({Key? key, required this.bodyWidget})
      : super(key: key);
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20),
          child: bodyWidget,
        ),
      ],
    );
  }
}
