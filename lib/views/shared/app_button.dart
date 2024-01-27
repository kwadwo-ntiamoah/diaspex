import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  ButtonStyles._();

  static ButtonStyle defaultButtonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.btnPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(
        width: 1,
        color: AppColors.btnPrimary,
      ),
    ),
  );
}

///
/// Button Abstract Class start
///
abstract class IDButton extends StatelessWidget {
  final String? label;
  final Widget? loader;
  final Color? textColor, backgroundColor, borderColor;
  final VoidCallback? onPressed;

  const IDButton({
    super.key,
    this.label,
    this.loader,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppConstants.xLargeSpacing,
      child: TextButton(
        style: _buttonStyle,
        onPressed: onPressed ?? () {},
        child: _ButtonChild(
          label: label,
          loader: loader,
          textColor: textColor,
        ),
      ),
    );
  }

  ButtonStyle get _buttonStyle {
    return TextButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.btnPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(
          width: 1,
          color: borderColor ?? backgroundColor ?? AppColors.btnPrimary,
        ),
      ),
    );
  }
}

///
/// Button Abstract Class end
///

///
/// Button Children Start
///
class _ButtonChild extends StatelessWidget {
  final Widget? loader;
  final String? label;
  final Color? textColor;

  const _ButtonChild({this.loader, this.label, this.textColor});

  @override
  Widget build(BuildContext context) {
    return loader != null
        ? const _DButtonLoader()
        : Text(
            label!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: textColor ?? AppColors.white),
          );
  }
}

class _SocialButtonChild extends StatelessWidget {
  final String label;
  final String icon;

  const _SocialButtonChild({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: AppConstants.largeSpacing,
          width: AppConstants.largeSpacing,
          child: Image.asset(icon),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: AppConstants.defaultSpacing,
          child: VerticalDivider(width: 1,
            thickness: 1,
            endIndent: 0,
            color: AppColors.white,),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white),
          ),
        )
      ],
    );
  }
}

class _DButtonLoader extends StatelessWidget {
  const _DButtonLoader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.smallSpacing,
      width: AppConstants.smallSpacing,
      child: CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 3,
      ),
    );
  }
}

///
/// Button Children End
///

///
/// Button Types Start
///
class DButton extends IDButton {
  const DButton({
    super.key,
    required super.label,
    required super.onPressed,
  });
}

class DSecondaryButton extends IDButton {
  DSecondaryButton({
    super.key,
    required super.label,
    required super.onPressed,
  }) : super(
          backgroundColor: AppColors.btnDisabled,
          textColor: AppColors.primary,
        );
}

class DLoadingButton extends IDButton {
  DLoadingButton({super.key})
      : super(
          loader: const _DButtonLoader(),
          backgroundColor: AppColors.btnDisabled,
        );
}

class DDisabledButton extends IDButton {
  DDisabledButton({
    super.key,
    required super.label,
  }) : super(backgroundColor: AppColors.btnDisabled, onPressed: null);
}

class DSocialButton extends IDButton {
  final String icon;
  DSocialButton({
    super.key,
    required this.icon,
    required super.label,
    required super.onPressed,
  }): super(backgroundColor: AppColors.transparent, borderColor: AppColors.white);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: _buttonStyle,
      child: _SocialButtonChild(label: label!, icon: icon),
    );
  }
}

///
/// Button Types End
///
