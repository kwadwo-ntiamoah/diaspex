import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/post/post.dart';
import 'package:diaspex/data/models/reply/reply.dart';
import 'package:diaspex/view_models/translate_vm.dart';
import 'package:diaspex/views/shared/simple_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TranslateView extends StatefulWidget {
  final Post? post;
  final Reply? reply;

  const TranslateView({super.key, this.post, this.reply});

  @override
  State<TranslateView> createState() => _TranslateViewState();
}

class _TranslateViewState extends State<TranslateView> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var state = context.read<TranslateVM>();

      if (widget.post != null) state.translatePost(widget.post!);
      if (widget.reply != null) state.translateReply(widget.reply!);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: SimpleAppBar(title: AppStrings.translate, centerTitle: true),
      body: Consumer<TranslateVM>(builder: (context, state, _) {
        if (state.formStatus == FormStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Original Text",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark),
              ),
              SizedBox(height: AppConstants.xSmallSpacing),
              widget.reply == null
                  ? const SizedBox.shrink()
                  : Text(
                widget.reply!.content,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 13, fontStyle: FontStyle.italic),
              ),
              widget.post == null
                  ? const SizedBox.shrink()
                  : Text(widget.post!.content,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 13, fontStyle: FontStyle.italic)),
              SizedBox(height: AppConstants.xSmallSpacing),
              Divider(
                color: AppColors.borderLight,
              ),
              Container(
                color: AppColors.bgPrimaryLight,
                width: double.infinity,
                padding: EdgeInsets.all(AppConstants.smallSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppConstants.xSmallSpacing),
                    Text(
                      "Translated Text",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark),
                    ),
                    SizedBox(height: AppConstants.xSmallSpacing),
                    Text(
                      state.translatedText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
