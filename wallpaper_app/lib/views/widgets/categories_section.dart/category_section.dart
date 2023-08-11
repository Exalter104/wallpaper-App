// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wallpaper_app/views/components/utils/utils.dart';

class CategoriesSection extends StatelessWidget {
  String imgUrls;
  final String text;
  CategoriesSection({
    Key? key,
    required this.imgUrls,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: Image.network(
                height: 55, width: 100, fit: BoxFit.cover, imgUrls),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.black26),
          ),
          Positioned(
            left: 20,
            top: 14,
            child: Text(
              text,
              style: SafeGoogleFont("Monsterrate",
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]));
  }
}
