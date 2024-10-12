import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/configs/theme_config.dart';

import '../configs/app_font.dart';

class ABTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? validationMsg,
      titleText,
      hintText,
      labelText,
      helperText,
      prefixText,
      suffixText;
  final Widget? prefix, suffix;
  final int? maxLength;
  final int maxLines;
  final int? minLength;
  final Function()? onTap;
  final bool? isPassword, countryCodeEnabled, isEnabled;
  final bool? isSimpleField;
  final bool margieRequired;
  final BorderRadius? borderRadius;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String text)? onFieldSubmitted;
  final Function(String? val)? validator;
  final AutovalidateMode? autoValidator;
  final Function(String? val)? onChange;
  final bool isCustomInput;
  final bool enableInteractiveSelection;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? customInputFormatters;

  const ABTextInput(
      {super.key,
      this.controller,
      this.validationMsg,
      this.validator,
      this.autoValidator,
      this.helperText,
      this.suffixText,
      this.prefixText,
      this.prefix,
      this.labelText,
      this.titleText,
      this.hintText,
      this.suffix,
      this.textInputType,
      this.isPassword,
      this.maxLength,
      this.maxLines = 1 ,
      this.onTap,
      this.countryCodeEnabled,
      this.borderRadius,
      this.isSimpleField,
      this.margieRequired = true,
      this.textInputAction,
      this.onFieldSubmitted,
      this.focusNode,
      this.isCustomInput = false,
      this.enableInteractiveSelection = true,
      this.textCapitalization,
      this.onChange,
      this.minLength,
      this.customInputFormatters,
      this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: margieRequired
              ? const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 5)
              : null,
          child: TextFormField(
            maxLines: maxLines,
            maxLength: maxLength,
            keyboardType: textInputType ?? TextInputType.text,
            inputFormatters: isCustomInput
                ? [FilteringTextInputFormatter.digitsOnly]
                : customInputFormatters,
            validator: (val) => validator != null ? validator!(val) : null,
            readOnly: isEnabled ?? false,
            obscureText: isPassword ?? false,
            controller: controller,
            onTap: onTap,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 11, height: 1.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff9aa4b0),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.all(8),
              hintText: hintText,
              hintStyle: AppFont.fontStyle(color: ThemeColor.textGreyColor),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeColor.mainLightColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: suffix,
              prefixIcon: prefix,
            ),
            autovalidateMode: autoValidator ?? AutovalidateMode.disabled,
            style: AppFont.fontStyle(color: ThemeColor.textGreyColor),
          ),
        ),
      ],
    );
  }
}
