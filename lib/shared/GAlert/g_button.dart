import 'package:flutter/material.dart';

abstract class GButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool? isLoading;
  final bool? isDisabled;
  final bool? isSecondary;

  const GButton({
    Key? key,
    required this.onPressed,
    this.label = 'Continue',
    this.isLoading,
    this.isDisabled,
    this.isSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: isSecondary != null
                ? const Color(0xff227093)
                : isDisabled != null
                ? Colors.grey
                : const Color(0xffffb142)),
        child: Text(label,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}

class GButtonLoading extends GButton {
  const GButtonLoading({
    super.key,
    required super.onPressed,
    super.isLoading = true,
  });
}

class GButtonDisabled extends GButton {
  const GButtonDisabled({
    super.key,
    super.label,
    required super.onPressed,
    super.isDisabled = true,
  });
}

class GButtonPrimary extends GButton {
  const GButtonPrimary({
    super.key,
    super.label,
    required super.onPressed,
  });
}

class GButtonSecondary extends GButton {
  const GButtonSecondary({
    super.key,
    super.label,
    required super.onPressed,
    super.isSecondary = true,
  });
}
