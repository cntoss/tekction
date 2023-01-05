import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_label.dart';

class RegularInput extends StatelessWidget {
  const RegularInput(
      {Key? key,
      this.obscureText = false,
      this.focusNode,
      this.focusedBorder,
      this.hintText,
      this.suffix,
      this.prefixIcon,
      this.controller,
      this.background,
      this.errorText,
      this.minLine = 1,
      this.maxLine = 1,
      this.onChange,
      this.onSubmit,
      this.inputAction,
      this.style,
      this.inputType,
      this.enable = true,
      this.onTap,
      this.readOnly,
      this.inputFormatters,
      this.maxLength,
      this.autoFocus,
      this.label,
      this.onClearText,
      this.prefix,
      this.isRequired,
      this.textColor,
      this.textCapitalization,
      this.contentPadding,
      this.initialValue,
      this.textlabel,
      this.isValid,
      this.textHintColor})
      : super(key: key);
  final String? initialValue;
  final Color? textColor;
  final Color? textHintColor;
  final IconData? prefixIcon;
  final bool? obscureText, enable, readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText, errorText;
  final Widget? suffix;
  final Color? background;
  final int minLine, maxLine;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final TextInputAction? inputAction;
  final TextStyle? style;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? autoFocus;
  final String? label;
  final VoidCallback? onClearText;
  final Widget? prefix;
  final bool? isRequired;
  final bool? textCapitalization;
  final bool? contentPadding;
  final InputBorder? focusedBorder;
  final String? textlabel;
  final bool? isValid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: label,
          isRequired: isRequired,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(size: 12),
            primaryColor: Theme.of(context).textTheme.headline5!.color,
          ),
          child: Column(
            children: [
              TextFormField(
                textCapitalization: (textCapitalization == true
                    ? TextCapitalization.words
                    : TextCapitalization.none),
                focusNode: focusNode,
                controller: controller,
                obscureText: obscureText ?? false,
                minLines: minLine,
                maxLines: maxLine,
                maxLength: maxLength,
                onChanged: onChange,
                initialValue: initialValue,
                onFieldSubmitted: onSubmit,
                textInputAction: inputAction ?? TextInputAction.done,
                style: style ??
                    (textColor != null
                        ? ThemeData().textTheme.subtitle1!.copyWith(
                            color: textColor, fontWeight: FontWeight.w400)
                        : ThemeData().textTheme.subtitle1!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w400)),
                keyboardType: inputType,
                enabled: enable,
                onTap: onTap,
                readOnly: readOnly ?? false,
                inputFormatters: inputFormatters,
                autofocus: autoFocus ?? false,
                decoration: InputDecoration(
                    labelText: textlabel,
                    prefixIcon: (prefix != null && prefixIcon == null)
                        ? Padding(
                            padding: const EdgeInsets.all(14),
                            child: prefix,
                          )
                        : (prefixIcon != null
                            ? Icon(prefixIcon, size: 20)
                            : null),
                    counterText: '',
                    contentPadding: (contentPadding == true
                        ? const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 18,
                          )
                        : const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 14,
                          )),
                    fillColor: background,
                    hintText: hintText ?? '',
                    suffixIcon: suffix,
                    focusedBorder: focusedBorder,
                    errorText: errorText,
                    errorMaxLines: 2,
                    hintStyle: (textHintColor != null
                        ? Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: textHintColor, fontWeight: FontWeight.w400)
                        : Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w400))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

///contentPadding:
///
