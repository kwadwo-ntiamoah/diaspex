import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:flutter/material.dart';

abstract class IDTextFormField extends StatelessWidget {
  final String? labelText;
  final Widget? suffix;
  final Widget? prefix;
  final bool? obscureText;
  final TextEditingController controller;
  final bool? dense;
  final int? maxLines;
  final double? fieldHeight;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool? readonly;

  const IDTextFormField({
    super.key,
    required this.controller,
    this.labelText = "Label",
    this.suffix,
    this.prefix,
    this.obscureText,
    this.dense,
    this.maxLines,
    this.fieldHeight = 66,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.readonly,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLines != null && maxLines! > 2
          ? fieldHeight
          : AppConstants.xLargeSpacing,
      width: double.infinity,
      child: TextFormField(
        onTap: onTap,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.textDark, fontSize: 12),
        validator: validator,
        readOnly: readonly ?? false,
        obscureText: obscureText ?? false,
        controller: controller,
        maxLines: obscureText == true ? 1 : maxLines ?? 4,
        minLines: 1,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: true,
          labelStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.borderDefault, fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: suffix,
          prefixIcon: prefix,
        ),
      ),
    );
  }
}

class DTextFormField extends IDTextFormField {
  const DTextFormField(
      {super.key,
      required super.labelText,
      required super.controller,
      super.validator,
      super.obscureText = false,
      super.fieldHeight,
      super.maxLines,
        super.readonly,
        super.onTap,
      super.textInputAction,
      super.textInputType});
}

class DTextFormFieldWithSuffix extends IDTextFormField {
  const DTextFormFieldWithSuffix({
    super.key,
    super.obscureText = false,
    super.maxLines,
    super.fieldHeight,
    super.textInputAction,
    super.textInputType,
    super.validator,
    required super.controller,
    required super.labelText,
    required super.suffix,
  });
}

class DTextFormFieldWithPrefix extends IDTextFormField {
  const DTextFormFieldWithPrefix({
    super.key,
    super.obscureText = false,
    super.dense = true,
    super.maxLines,
    super.fieldHeight,
    super.textInputAction,
    super.textInputType,
    super.validator,
    required super.controller,
    required super.labelText,
    required super.prefix,
  });
}
