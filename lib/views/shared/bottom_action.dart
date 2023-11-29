import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:flutter/material.dart';

class BottomActionButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPressed;

  const BottomActionButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: AppConstants.xMLargeSpacing,
        decoration: BoxDecoration(color: AppColors.bgGray3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonLabel,
                  style: TextStyle(color: AppColors.btnPrimary),
                )),
            SizedBox(width: AppConstants.smallSpacing)
          ],
        ),
      ),
    );
  }
}
