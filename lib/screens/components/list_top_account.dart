import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/resources/style.dart';

class ListTopAccount extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final int i;
  const ListTopAccount({required this.imageUrl, required this.title, required this.category, required this.i, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.1,
                child: Text(
                  title,
                  style: tsWhite.copyWith(fontWeight: fwSemiBold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(category, style: tsGrey.copyWith(fontWeight: fwMedium, fontSize: 14)),
              Row(
                children: List.generate(i, (index) => const Icon(MdiIcons.star, color: Colors.yellow)).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
