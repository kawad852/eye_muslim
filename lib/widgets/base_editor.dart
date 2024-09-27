import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseEditor extends StatelessWidget {
  final String? initialValue;
  final String? suffixText;
  final String? hintText;
  final Function(String)? onChanged;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final MouseCursor? mouseCursor;
  final bool canRequestFocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? suffixIconConstraints;
  final AutovalidateMode? autoValidateMode;
  final bool autofocus;
  final EdgeInsetsGeometry? padding;
  final String? title;
  final String? helperText;
  final bool required;
  final bool obscureText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool withIndicator;
  final Function()? onTapOutside;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final InputBorder? focusedBorder;
  final TextStyle? style;

  const BaseEditor({
    super.key,
    this.initialValue,
    this.onChanged,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.suffixText,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.hintText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.autofocus = false,
    this.padding,
    this.title,
    this.required = false,
    this.floatingLabelBehavior,
    this.obscureText = false,
    this.helperText,
    this.prefixIcon,
    this.maxLines = 1,
    this.textDirection,
    this.withIndicator = true,
    this.onTapOutside,
    this.filled,
    this.fillColor,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.focusedBorder,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: style,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        initialValue: initialValue,
        autovalidateMode: autoValidateMode,
        autofocus: autofocus,
        obscureText: obscureText,
        maxLines: maxLines,
        textDirection: textDirection,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          filled: filled,
          fillColor: fillColor,
          suffixText: suffixText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconConstraints: suffixIconConstraints,
          prefixIconConstraints: suffixIconConstraints,
          floatingLabelBehavior: floatingLabelBehavior,
          alignLabelWithHint: true,
          helperText: helperText,
          hintStyle: hintStyle,
          focusedBorder:focusedBorder,
        ),
        validator: validator,
        canRequestFocus: canRequestFocus,
        mouseCursor: mouseCursor,
        onTapOutside: (value) => onTapOutside ?? context.unFocusKeyboard(),
        onTap: onTap,
      ),
    );
  }
}
