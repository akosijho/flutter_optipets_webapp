import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScrollController = ScrollController(
    initialScrollOffset: maxWidth
  );

  void prints() {
    showDialog(
        context: getContext,
        builder: (_) {
          return const AlertDialog(
            title: Text('data'),
          );
        });
  }
}
