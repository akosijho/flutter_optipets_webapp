import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:image_network/image_network.dart';
import 'package:stacked/stacked.dart';

class StatusBar extends ViewModelWidget<HomeViewModel> {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      width: maxWidth,
      height: 48,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 24, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ImageNetwork(
                  image:
                      viewModel.applicationViewModel.userObject!.displayImage!,
                  imageCache: CachedNetworkImageProvider(
                      viewModel.applicationViewModel.userObject!.displayImage!),
                  height: 36,
                  width: 36,
                  duration: 1500,
                  curve: Curves.easeIn,
                  onPointer: true,
                  debugPrint: false,
                  fullScreen: false,
                  fitAndroidIos: BoxFit.cover,
                  fitWeb: BoxFitWeb.cover,
                  borderRadius: BorderRadius.circular(70),
                  onError: Text(
                      viewModel.applicationViewModel.userObject!.firstName![0],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )),
                  onTap: () {},
                )),
            const SizedBox(
              width: 8,
            ),
            Text(
                "Hi, ${viewModel.applicationViewModel.userObject!.firstName!}!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2
                )),
          ],
        ),
      ),
    );
  }
}
