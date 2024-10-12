import 'package:flutter/material.dart';

// import 'package:ibb_golf/core/config/app_font.dart';
// import 'package:ibb_golf/core/utils/theme_config.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/app_font.dart';
import '../configs/theme_config.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final String? imageUrl;
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool isPassword;
  final bool readOnly;
  final int maxLines;
  final List<String>? dropdownItems;
  final String? selectedItem;
  final Function(String?)? onChangedDropdown;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode; // Add autovalidateMode property

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.imageUrl,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
    this.onTap,
    this.isPassword = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.dropdownItems,
    this.selectedItem,
    this.onChangedDropdown,
    this.validator,
    this.autovalidateMode, // Initialize the autovalidateMode property
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return widget.dropdownItems == null
        ? TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: isObscure,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            // Pass autovalidateMode to TextFormField
            decoration: InputDecoration(
              filled: true,
              labelText: widget.labelText,
              fillColor: ThemeColor.white,
              prefixIcon: widget.imageUrl != null
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(widget.imageUrl!),
                    )
                  : (widget.prefixIcon != null
                      ? Icon(
                          widget.prefixIcon,
                          color: ThemeColor.iconColor,
                        )
                      : null),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: ThemeColor.iconColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: AppFont.fontStyle(
                color: ThemeColor.featureColor,
                size: 16,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: ThemeColor.borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: ThemeColor.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: ThemeColor.borderColor,
                ),
              ),
            ),
          )
        : DropdownButtonFormField<String>(
            value: widget.selectedItem,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: ThemeColor.tabTextColor,
            ),
            decoration: InputDecoration(
              filled: true,
              labelText: widget.labelText,
              fillColor: ThemeColor.tfBGColor,
              prefixIcon: widget.imageUrl != null
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(widget.imageUrl!),
                    )
                  : (widget.prefixIcon != null
                      ? Icon(
                          widget.prefixIcon,
                          color: ThemeColor.iconColor,
                        )
                      : null),
              hintText: widget.hintText,
              hintStyle: AppFont.fontStyle(
                color: ThemeColor.featureColor,
                size: 16,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: ThemeColor.borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: ThemeColor.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: ThemeColor.borderColor,
                ),
              ),
            ),
            items: widget.dropdownItems!
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: AppFont.fontStyle(
                    color: ThemeColor.black,
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }).toList(),
            onChanged: widget.onChangedDropdown,
            validator: widget.validator,
            autovalidateMode: widget
                .autovalidateMode, // Pass autovalidateMode to DropdownButtonFormField
          );
  }
}
