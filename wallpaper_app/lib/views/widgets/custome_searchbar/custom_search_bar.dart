import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/views/screens/search_screen.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 228, 228),
          border: Border.all(color: const Color.fromARGB(255, 197, 194, 194)),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Wallpaper",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
              onTap: () => Get.to(const SearchScreen()),
              child: const Icon(Icons.search))
        ],
      ),
    );
  }
}
