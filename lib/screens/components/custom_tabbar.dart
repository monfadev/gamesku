import 'package:flutter/material.dart';
import 'package:gamesku/core/resources/style.dart';

import '../../core/resources/color.dart';

class CustomTabBar extends StatelessWidget {
  final int? selectedIndex;
  final List<String>? titles;
  final Function(int)? onTap;

  const CustomTabBar({required this.titles, this.selectedIndex, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: titles!
            .map((e) => Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap!(titles!.indexOf(e));
                          }
                        },
                        child: Text(e, style: (titles!.indexOf(e) == selectedIndex) ? tsWhite : tsGrey),
                      ),
                      Container(
                        width: 40,
                        height: 3,
                        margin: const EdgeInsets.only(top: 13),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.5), color: (titles!.indexOf(e) == selectedIndex) ? greyColor : Colors.transparent),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
