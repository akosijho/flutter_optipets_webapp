import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/widgets/widgets.dart';
import 'package:image_network/image_network.dart';
import 'package:stacked/stacked.dart';

class ViewClient extends ViewModelWidget<AddNewViewModel> {
  const ViewClient({super.key});

  @override
  Widget build(BuildContext context, AddNewViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                ),
                child:
                    viewModel.applicationViewModel.userObject!.displayImage ==
                            null
                        ? Center(
                          child: Text(
                              viewModel
                                  .applicationViewModel.userObject!.firstName![0],
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 120,
                                color: Colors.white,
                              )),
                        )
                        : ImageNetwork(
                            image: viewModel
                                .applicationViewModel.userObject!.displayImage!,
                            imageCache: CachedNetworkImageProvider(viewModel
                                .applicationViewModel
                                .userObject!
                                .displayImage!),
                            height: 160,
                            width: 160,
                            duration: 1500,
                            curve: Curves.easeIn,
                            onPointer: true,
                            debugPrint: false,
                            fullScreen: false,
                            fitAndroidIos: BoxFit.cover,
                            fitWeb: BoxFitWeb.cover,
                            borderRadius: BorderRadius.circular(70),
                            onError: Text(
                                viewModel.applicationViewModel.userObject!
                                    .firstName![0],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                )),
                          )),
        ),

      ],
    );
  }
}
