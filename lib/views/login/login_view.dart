import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';

class LoginView extends StatelessWidget{
  const LoginView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.bottom,
          controller: scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            interactive: true,
            radius: Radius.zero,
          child: SingleChildScrollView(
            controller: scrollController,
            primary: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Center(
                child: SizedBox(
                  width: 1366,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRect(
                        child: Container(
                           width: 136,
                           color: Colors.yellow,
                           height: MediaQuery.of(context).size.height,
                        ),
                      ),
                      ClipRect(
                        child: Container(
                          width: 136,
                          color: Colors.white,
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}