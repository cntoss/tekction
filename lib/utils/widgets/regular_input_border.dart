import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preferences/preferences.dart';

import 'input_label.dart';

class RegularInputBorder extends StatelessWidget {
  const RegularInputBorder(
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
      this.showCounterText,
      this.labelColor,
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
  final bool? showCounterText;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: label,
          isRequired: isRequired,
          labelColor: labelColor,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(
              size: 12,
            ),
            primaryColor: Theme.of(context).textTheme.headline5!.color,
          ),
          child: TextFormField(
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
                    ? Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)
                    : Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: StaticColors.appColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
            keyboardType: inputType,
            enabled: enable,
            onTap: onTap,
            readOnly: readOnly ?? false,
            inputFormatters: inputFormatters,
            autofocus: autoFocus ?? false,
            decoration: InputDecoration(
              counterText: (maxLength != 160) ? "" : null,
              labelText: textlabel,
              prefixIcon: (prefix != null && prefixIcon == null)
                  ? Padding(
                      padding: const EdgeInsets.all(14),
                      child: prefix,
                    )
                  : (prefixIcon != null ? Icon(prefixIcon, size: 20) : null),
              contentPadding: (contentPadding == true
                  ? const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    )
                  : const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 14,
                    )),
              fillColor: background ?? Colors.white,
              hintText: hintText ?? '',
              errorText: errorText,
              suffixIcon: suffix,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: StaticColors.borderGray,
                  width: 1,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: StaticColors.borderGray,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: StaticColors.borderGray,
                  width: 1,
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: StaticColors.borderGray,
                  width: 1,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: StaticColors.errorColor,
                  width: 1,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: StaticColors.errorColor,
                  width: 1,
                ),
              ),
              hintStyle: (textHintColor != null
                  ? Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: textHintColor, fontWeight: FontWeight.w400)
                  : Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: StaticColors.descColor,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ),
      ],
    );
  }
}
