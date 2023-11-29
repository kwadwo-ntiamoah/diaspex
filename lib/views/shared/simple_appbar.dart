import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool centerTitle;
  final bool boldTitle;
  final bool implyLeading;

  const SimpleAppBar({
    super.key,
    this.title = "",
    this.centerTitle = true,
    this.boldTitle = false,
    this.implyLeading = true,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: .2,
      iconTheme: IconThemeData(color: AppColors.textDark),
      centerTitle: centerTitle,
      leading: implyLeading ? IconButton(
        onPressed: () => context.pop(),
        icon: Icon(FontAwesomeIcons.arrowLeftLong,
            size: AppConstants.defaultIconSize),
      ): null,
      title: Text(title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall!.copyWith(
        fontWeight: boldTitle ? FontWeight.bold : FontWeight.normal
      )),
      scrolledUnderElevation: .2,
      backgroundColor: AppColors.bgLight,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
