import 'package:flutter/material.dart';
import 'regular_input.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final String? errorText;
  final FocusNode? focusNode;
  final Color? background;
  final bool? enable;
  final bool? contentPadding;
  final ValueChanged<String>? onSubmit;
  final Color? textColor;
  final Widget? prefix;
  const PasswordInput(
      {Key? key,
      this.controller,
      this.hint,
      this.errorText,
      this.label,
      this.focusNode,
      this.textColor,
      this.enable = true,
      this.background,
      this.contentPadding,
      this.onSubmit,
      this.prefix})
      : super(key: key);
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      contentPadding: widget.contentPadding,
      errorText: widget.errorText,
      controller: widget.controller,
      onSubmit: widget.onSubmit,
      hintText: widget.hint,
      label: widget.label,
      textColor: widget.textColor,
      enable: widget.enable,
      background: widget.background,
      focusNode: widget.focusNode,
      inputType: TextInputType.visiblePassword,
      obscureText: !isVisible,
      suffix: _buildSuffix(),
      prefix: widget.prefix,
    );
  }

  Widget _buildSuffix() {
    return InkWell(
      child: Icon(
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: Colors.white,
      ),
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
    );
  }
}
