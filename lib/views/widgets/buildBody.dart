// ignore_for_file: file_names

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';

class BuildBody extends StatelessWidget {
  BuildBody({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AdaptiveScrollbar(
            width: 12,
            controller: scrollController,
            position: ScrollbarPosition.bottom,
            underColor: Colors.grey.shade400,
            sliderDefaultColor: MyColors.primaryColor,
            sliderActiveColor: MyColors.primaryColor,
            child: SingleChildScrollView(
                controller: verticalScrollController,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Container(),
                    )))));
  }
}
