import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              controller: model.scrollController,
              child: SingleChildScrollView(
                controller: model.scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Scrollbar(
                  scrollbarOrientation: ScrollbarOrientation.right,
                  controller: model.verticalScrollController,
                  child: SingleChildScrollView(
                    controller: model.verticalScrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      width: 1366,
                      height: 768,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
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
