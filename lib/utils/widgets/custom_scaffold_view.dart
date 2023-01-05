import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomScaffoldView extends StatelessWidget {
  const CustomScaffoldView({Key? key, required this.bodyWidget, this.titlePge})
      : super(key: key);
  final Widget bodyWidget;

  final String? titlePge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.router.pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(titlePge ?? "",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
            centerTitle: false,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: bodyWidget,
    );
  }
}
