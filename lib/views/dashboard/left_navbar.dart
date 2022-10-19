import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftNavBar extends StatelessWidget {
  const LeftNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 768,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          // shape: BoxShape.rectangle,
          // borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(8),
          //     bottomLeft: Radius.circular(8))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('lib/assets/images/logo.svg',
            width: 184,),
            Material(
                color: Theme.of(getContext).primaryColor,
                child: InkWell(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.white, width: 0.5)),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                                child: Text(
                              'New',
                              style: TextStyle(
                                fontSize: Theme.of(getContext)
                                    .textTheme
                                    .headline6!
                                    .fontSize,
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                              ),
                            )),
                          ],
                        )),
                    onTap: () {
                      showDialog(
                          context: getContext,
                          builder: (_) {
                            return const AlertDialog(
                              title: const Text('data'),
                            );
                          });
                    })),
          ],
        ));
  }
}
