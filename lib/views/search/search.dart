import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/shared/app_text_field.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        backgroundColor: AppColors.bgLight,
        flexibleSpace: Container(
          alignment: Alignment.bottomCenter,
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
          child: SearchButton(
            onTap: () {},
            prefix: Icons.search,
            labelText: "Search",
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.defaultSpacing),
        child: ListView(
          children: [
            Text("Recent",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
