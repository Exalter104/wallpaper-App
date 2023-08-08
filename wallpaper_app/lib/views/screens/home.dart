import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/views/screens/category_screen.dart';
import 'package:wallpaper_app/views/widgets/categories_section.dart/category_section.dart';
import 'package:wallpaper_app/views/widgets/custome%20_appbar/custome_appbar.dart';
import 'package:wallpaper_app/views/widgets/custome_searchbar/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> img = [
    "https://images.pexels.com/photos/1181676/pexels-photo-1181676.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/16129703/pexels-photo-16129703/free-photo-of-man-coding-on-computers-sitting-at-desk.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1181467/pexels-photo-1181467.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/5473302/pexels-photo-5473302.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/5380792/pexels-photo-5380792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/5380590/pexels-photo-5380590.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1181676/pexels-photo-1181676.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/16129703/pexels-photo-16129703/free-photo-of-man-coding-on-computers-sitting-at-desk.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomAppBar(
            word1: 'home_appBar_Title'.tr,
            word2: 'second_appBar_Title'.tr,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const CustomSearchBar()),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () => Get.to(const CategorieScreen()),
                          child: const CategoriesSection());
                    }),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    itemCount: img.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 13,
                            mainAxisExtent: 400,
                            mainAxisSpacing: 10),
                    itemBuilder: ((context, index) => SizedBox(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(img[index])),
                        ))),
              )
            ],
          ),
        ));
  }
}
