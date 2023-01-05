import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'regular_input.dart';

class SearchTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final VoidCallback? onClear;
  final ValueChanged<String> onChanged;
  final bool? readOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;

  const SearchTextInput({
    Key? key,
    required this.controller,
    this.hint,
    this.onClear,
    required this.onChanged,
    this.readOnly,
    this.onTap,
    this.focusNode,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      textHintColor: StaticColors.inactiveIcon,
      hintText: hint,
      focusNode: focusNode,
      controller: controller,
      prefix: const Icon(
        Icons.search,
        color: StaticColors.inactiveIcon,
      ),
      onChange: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      suffix: (controller?.text ?? '').isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                controller?.clear();
                if (onClear != null) {
                  onClear!();
                }
              },
            )
          : null,
    );
  }
}
