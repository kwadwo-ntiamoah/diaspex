import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../config/theme_config.dart';

abstract class IDTextField extends StatelessWidget {
  final String? labelText;
  final Widget? prefix;
  final TextEditingController controller;

  const IDTextField({super.key, required this.controller, this.prefix, this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.xLargeSpacing,
      width: double.infinity,
      child: TextField(
        style: Theme.of(context).textTheme.bodySmall,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.borderDefault),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: prefix,
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  final String? labelText;
  final IconData prefix;
  final VoidCallback onTap;

  const SearchButton({super.key, required this.onTap, required this.prefix, this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.xLargeSpacing,
      width: double.infinity,
      child: TextField(
        style: Theme.of(context).textTheme.bodySmall,
        onTap: onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: AppColors.borderDefault, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(color: AppColors.borderPrimary, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(color: AppColors.borderDefault, width: 1)),
          labelText: labelText,
          labelStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.borderDefault),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(prefix, size: AppConstants.defaultIconSize)
        ),
      ),
    );
  }
}