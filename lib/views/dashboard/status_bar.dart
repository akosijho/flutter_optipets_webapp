import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:image_network/image_network.dart';
import 'package:stacked/stacked.dart';

class StatusBar extends ViewModelWidget<HomeViewModel> {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      width: 1166,
      height: 36,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ImageNetwork(
                  image: viewModel.user!.displayImage!,
                  imageCache:
                      CachedNetworkImageProvider(viewModel.user!.displayImage!),
                  height: 32,
                  width: 32,
                  duration: 1500,
                  curve: Curves.easeIn,
                  onPointer: true,
                  debugPrint: false,
                  fullScreen: false,
                  fitAndroidIos: BoxFit.contain,
                  fitWeb: BoxFitWeb.contain,
                  borderRadius: BorderRadius.circular(70),
                  onLoading: const CircularProgressIndicator(
                    color: Colors.indigoAccent,
                  ),
                  onError: Text(viewModel.user!.firstName![0],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )),
                  onTap: () {},
                )),
            const SizedBox(
              width: 8,
            ),
            Text("Hi, ${viewModel.user!.firstName!}!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }
}
