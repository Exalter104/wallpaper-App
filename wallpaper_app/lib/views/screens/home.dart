import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controller/home_wallpaper_controller/home_wallpaper_controller.dart';
import 'package:wallpaper_app/views/components/colors/app_colors.dart';
import 'package:wallpaper_app/views/screens/category_screen.dart';
import 'package:wallpaper_app/views/screens/setwallpaper_screen.dart';
import 'package:wallpaper_app/views/widgets/categories_section.dart/category_section.dart';
import 'package:wallpaper_app/views/widgets/custome%20_appbar/custome_appbar.dart';
import 'package:wallpaper_app/views/widgets/custome_searchbar/custom_search_bar.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeWallpaperController homeWallpaperController =
      Get.put(HomeWallpaperController());

  List images = [];
  int page = 1;
  loadmore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        "https://api.pexels.com/v1/curated?perpage=80&page=${page.toString()}";
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          'XIiUuwAntckk2WNvYkitqUBZnI2iGblvdVBKdhvQdorjejObUp8CVNHF'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        homeWallpaperController.homeWallpaperModel.addAll(result["photos"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("inside home wallpaper");
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
            const SizedBox(
              height: 15,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const CustomSearchBar()),
            GetBuilder<HomeWallpaperController>(
                init: HomeWallpaperController(),
                builder: (controller) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homeWallpaperModel.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () => Get.to(const CategorieScreen()),
                              child: CategoriesSection(
                                imgUrls: controller.homeWallpaperModel[index]
                                    ["src"]["portrait"],
                                text: 'Softwear',
                              ));
                        }),
                  );
                }),
            GetBuilder<HomeWallpaperController>(
                init: HomeWallpaperController(),
                builder: (controller) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        itemCount: controller.homeWallpaperModel.length,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 13,
                                mainAxisExtent: 400,
                                mainAxisSpacing: 10),
                        itemBuilder: ((context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SetWallpaperScreen(
                                        imageurl:
                                            controller.homeWallpaperModel[index]
                                                ["src"]["portrait"]),
                                  ),
                                );
                              },
                              child: SizedBox(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      // "https://images.pexels.com/photos/1181676/pexels-photo-1181676.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                      controller.homeWallpaperModel[index]
                                          ["src"]["portrait"],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ))),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.kUnreadChatBG,
        onPressed: () {
          loadmore();
        },
        child: const Icon(
          Icons.refresh_outlined,
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
