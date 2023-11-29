library g_alert;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'g_button.dart';

enum AlertType { success, error, info, warning }

final navigatorKey = GlobalKey<NavigatorState>();

abstract class GAlert extends StatelessWidget {
  final String title;
  final String subtitle;
  final AlertType alertType;
  final Widget? icon;
  final Widget? button;
  final Widget? secondaryButton;
  final BuildContext context;
  final VoidCallback onWillPop;

  const GAlert({
    Key? key,
    required this.context,
    required this.title,
    required this.subtitle,
    required this.onWillPop,
    this.icon,
    this.button,
    this.secondaryButton,
    this.alertType = AlertType.success,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IntrinsicHeight(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 16),
                _buildIcons,
                _buildBody,
                const SizedBox(height: 16),
                secondaryButton == null
                    ? button ?? GButtonPrimary(onPressed: () {})
                    : const SizedBox.shrink(),
                secondaryButton != null
                    ? _buildSecondaryButtonActions
                    : const SizedBox.shrink(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _buildBody {
    return Column(
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2C3A47))),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Color(0xff2C3A47)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSingleIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Icon(icon, color: color, size: 60),
    );
  }

  Widget get _buildIcons {
    if (icon != null) {
      return icon!;
    }

    switch (alertType) {
      case AlertType.success:
        return _buildSingleIcon(
            Icons.check_circle_rounded, const Color(0xff218c74));
      case AlertType.error:
        return _buildSingleIcon(
            Icons.warning_amber_rounded, const Color(0xffff5252));
      case AlertType.info:
        return _buildSingleIcon(
            Icons.info_outline_rounded, const Color(0xff34ace0));
      case AlertType.warning:
        return _buildSingleIcon(
            Icons.info_outline_rounded, const Color(0xffffb142));
      default:
        return icon!;
    }
  }

  // Widget get _buildSecondaryButtonActions {
  //   return Column(
  //     children: [
  //       button ?? GButtonPrimary(onPressed: () {}),
  //       const SizedBox(height: 10),
  //       secondaryButton != null
  //           ? secondaryButton!
  //           : const SizedBox.shrink()
  //     ],
  //   );
  // }

  Widget get _buildSecondaryButtonActions {
    return Row(
      children: [
        Expanded(child: button ?? GButtonPrimary(onPressed: () {})),
        const SizedBox(width: 8),
        secondaryButton != null
            ? Expanded(
                child: secondaryButton ?? GButtonSecondary(onPressed: () {}))
            : const SizedBox.shrink()
      ],
    );
  }
}

class GAlertDefault extends GAlert {
  const GAlertDefault({
    super.key,
    required super.context,
    required super.title,
    required super.subtitle,
    required super.onWillPop,
    super.alertType,
    super.button,
  });

  void fire() {
    showGAlert(this, context, onWillPop);
  }
}

class GAlertWithCustomIcon extends GAlert {
  const GAlertWithCustomIcon(
      {super.key,
      required super.context,
      required super.title,
      required super.subtitle,
      required super.icon,
      required super.onWillPop,
      super.alertType,
      super.button});

  void fire() {
    showGAlert(this, context, onWillPop);
  }
}

class GAlertWithSecondaryButton extends GAlert {
  const GAlertWithSecondaryButton(
      {super.key,
      required super.context,
      required super.title,
      required super.subtitle,
      required super.onWillPop,
      super.alertType,
      super.button,
      super.secondaryButton,
      super.icon});

  void fire() {
    showGAlert(this, context, onWillPop);
  }
}

// alert functions
void showGAlert(Widget child, BuildContext context, VoidCallback onWillPop) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
            child: Align(
              alignment: Alignment.center,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: IntrinsicHeight(
                  child: Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 550),
                      child: Dialog(
                          insetPadding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: child,
                          )),
                    ),
                  ),
                ),
              ),
            ),
            onWillPop: () async {
              // onWillPop();
              // Navigator.of(context).pop();
              return false;
            });
      });
}
