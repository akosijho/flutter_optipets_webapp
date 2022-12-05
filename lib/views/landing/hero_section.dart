import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:image_network/image_network.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.screenSize});

  // screensize from parent widget
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return screenSize.width < 800
        ? Container(
            width: screenSize.width,
            color: MyColors.coverColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width - 16,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xfff9f9f8).withOpacity(0.2),
                        const Color(0xffe5e6e4).withOpacity(0.4)
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: const [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                  ),
                  child: const Center(
                    child: ImageNetwork(
                      image: 'assets/${SvgIcons.appLogin}',
                      fitWeb: BoxFitWeb.fill,
                      fitAndroidIos: BoxFit.fill,
                      width: 300,
                      height: 544,
                      curve: Curves.easeOut,
                      // const MyImage(imageUrl: SvgIcons.bvcLogo),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Center(
                    child: animatedText(text: 'Your Pet Care Assistant'),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: entryText(),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: ImageNetwork(
                    image: 'assets/${SvgIcons.googlePlay}',
                    fitWeb: BoxFitWeb.fill,
                    fitAndroidIos: BoxFit.fill,
                    width: screenSize.width / 2,
                    height: 72,
                    curve: Curves.easeOut,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          )
        : Container(
            width: double.infinity,
            height: 560,
            color: MyColors.coverColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                          width: 666,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              animatedText(text: 'Your Pet Care Assistant'),
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 104),
                                child: entryText(),
                              ),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.topCenter,
                                child: ImageNetwork(
                                  image: 'assets/${SvgIcons.googlePlay}',
                                  fitWeb: BoxFitWeb.fill,
                                  fitAndroidIos: BoxFit.fill,
                                  width: screenSize.width / 2,
                                  height: 64,
                                  curve: Curves.easeOut,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Flexible(
                      child: Container(
                        width: 666,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xfff9f9f8).withOpacity(0.2),
                              const Color(0xffe5e6e4).withOpacity(0.4)
                            ],
                            begin: const FractionalOffset(0.2, 0.2),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: const [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(24)),
                        ),
                        child: const Center(
                            child: ImageNetwork(
                              image: 'assets/${SvgIcons.appLogin}',
                              fitWeb: BoxFitWeb.fill,
                              fitAndroidIos: BoxFit.fill,
                              width: 300,
                              height: 544,
                              curve: Curves.easeOut,
                            
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  // typing animation
  Widget animatedText({required String text}) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(text,
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                overflow: TextOverflow.clip,
                fontWeight: FontWeight.w700),
            cursor: '|',
            speed: const Duration(milliseconds: 90),
            textAlign: TextAlign.center),
      ],
      repeatForever: true,
      pause: const Duration(microseconds: 2000),
      displayFullTextOnTap: true,
    );
  }

  Widget entryText() {
    return Center(
      child: Text(
        'Get a hold on your pets in your fingertips. Interact and socialize with other pet lovers.',
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
