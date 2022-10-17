import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String textLabel;
  final String textHint;
  final TextInputAction? textAction;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixOnPressed;
  final FormFieldValidator<String>? validate;
  final Function(String?)? textOnChanged;
  final Function(String?)? textOnSubmitted;
  final TextInputType? type;
  final bool isObscure;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;

  const DefaultTextFormField({
    super.key,
    required this.textLabel,
    required this.textHint,
    this.textAction,
    required this.prefixIcon,
    this.suffixOnPressed,
    this.suffixIcon,
    required this.validate,
    required this.textOnChanged,
    required this.type,
    this.isObscure = false,
    required this.controller,
    this.textOnSubmitted,
    required this.focusNode,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: textLabel,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          onPressed: suffixOnPressed,
          icon: Icon(
            suffixIcon,
          ),
        ),
        hintText: textHint,
      ),
      validator: validate,
      onChanged: textOnChanged,
      keyboardType: type,
      obscureText: isObscure,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      textInputAction: textAction,
    );
  }
}
