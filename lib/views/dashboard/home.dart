import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/dash_views.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:flutter_optipets_webapp/views/dashboard/left_navbar.dart';
import 'package:flutter_optipets_webapp/views/dashboard/status_bar.dart';
import 'package:flutter_optipets_webapp/views/widgets/loader.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width <= 1366
        ? 1366
        : MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height <= 667
        ? 667
        : MediaQuery.of(context).size.height;
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) async => model.init(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return model.isBusy
            ? const Loader()
            : Scaffold(
                body: AdaptiveScrollbar(
                  width: 12,
                  controller: model.scrollController,
                  position: ScrollbarPosition.bottom,
                  underColor: Colors.grey.shade400,
                  sliderDefaultColor: MyColors.primaryColor,
                  sliderActiveColor: MyColors.primaryColor,
                  child: SingleChildScrollView(
                    controller: model.verticalScrollController,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: SingleChildScrollView(
                      controller: model.scrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        width: maxWidth,
                        height: maxHeight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LeftNavBar(), //left navbar
                            // Changeable panel
                            
                            Expanded(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    StatusBar(),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: DashViews(),
                                      ),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
