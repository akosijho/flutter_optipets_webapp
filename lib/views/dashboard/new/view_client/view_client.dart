import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';

class ViewClient extends ViewModelWidget<AddNewViewModel> {
  const ViewClient({super.key});

  @override
  Widget build(BuildContext context, AddNewViewModel viewModel) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), //color of shadow
            blurRadius: 8, // blur radius
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
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
                child: viewModel.user!.displayImage == null
                    ? Center(
                        child: Text(viewModel.user!.firstName![0],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 120,
                              color: Colors.white,
                            )),
                      )
                    : ImageNetwork(
                        image: viewModel.user!.displayImage!,
                        imageCache: CachedNetworkImageProvider(viewModel
                            .userObject!.displayImage!),
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
                        onError: Text(viewModel.user!.firstName![0],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                      )),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
              'Pets:    ${viewModel.user!.pets == null ? 'None' : viewModel.user!.pets!.toString()}'),
          const SizedBox(
            height: 8,
          ),
          Text('Registered On:   ${viewModel.user!.createdAt!}'),
        ],
      ),
    );
  }
}
