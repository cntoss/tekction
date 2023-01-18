// ignore: implementation_imports
import 'package:auto_route/src/router/controller/pageless_routes_observer.dart'
    show PagelessRoutesObserver;
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../dialog/custom_auto_dialog.dart';

class AutoBackCustom extends StatefulWidget {
  final Color? color;
  final bool showIfParentCanPop;
  final bool? showDialog;
  final String? titleText;
  final String? descText;
  final String? buttonText;
  final VoidCallback? onTap;
  const AutoBackCustom(
      {Key? key,
      this.color,
      this.showIfParentCanPop = true,
      this.showDialog,
      this.titleText,
      this.descText,
      this.buttonText,
      this.onTap})
      : super(key: key);

  @override
  _AutoBackCustomState createState() => _AutoBackCustomState();
}

class _AutoBackCustomState extends State<AutoBackCustom> {
  late final PagelessRoutesObserver _pagelessRoutesObserver;

  @override
  void initState() {
    super.initState();
    _pagelessRoutesObserver = AutoRouter.of(context).pagelessRoutesObserver;
    _pagelessRoutesObserver.addListener(_handleRebuild);
  }

  @override
  void dispose() {
    super.dispose();
    _pagelessRoutesObserver.removeListener(_handleRebuild);
  }

  @override
  Widget build(BuildContext context) {
    final scope = RouterScope.of(context, watch: true);
    if (_canPopSelfOrChildren(scope.controller)) {
      return IconButton(
          splashRadius: 25,
          onPressed: () {
            if (widget.showDialog == true) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => CustomActionDialog(
                  widget.titleText,
                  widget.descText,
                  widget.buttonText,
                  () {
                    context.router.pop();
                    widget.onTap!.call();
                  },
                ),
              );
            } else {
              context.router.pop();
            }
          },
          padding: EdgeInsets.all(4.0),
          color: Colors.grey[900],
          iconSize: 38,
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            color: widget.color ?? Colors.white,
          ));
    }
    return const SizedBox.shrink();
  }

  bool _canPopSelfOrChildren(RoutingController controller) {
    if (controller.parent() != null && widget.showIfParentCanPop) {
      return controller.canPopSelfOrChildren ||
          _canPopSelfOrChildren(controller.parent()!);
    }
    return controller.canPopSelfOrChildren;
  }

  void _handleRebuild() {
    setState(() {});
  }
}
