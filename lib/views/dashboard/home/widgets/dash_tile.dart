import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';

class DashTile extends StatelessWidget {
  const DashTile(
      {Key? key,
      required this.icon,
      required this.numbers,
      required this.description})
      : super(key: key);

  final IconData icon;
  final String numbers;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.facebook.withOpacity(0.8),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.all(16 * 0.75),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: MyColors.gray3.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 64,
                      color: Colors.white,
                    ),
                  )),
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.more_vert, color: Colors.white54))
            ],
          ),
          Text(
            numbers,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4,
          ),
          // ProgressLine(
          //   color: info.color,
          //   percentage: info.percentage,
          // ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              description,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white70,
                  fontSize: 16,
                  overflow: TextOverflow.clip),
            ),
          )
        ],
      ),
    );
  }
}
