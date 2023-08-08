import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/components/utils/utils.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: Image.network(
                height: 55,
                width: 100,
                fit: BoxFit.cover,
                "https://images.pexels.com/photos/7988113/pexels-photo-7988113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
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
              "Softwears",
              style: SafeGoogleFont("Monsterrate",
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]));
  }
}
