import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:wallpaper_app/views/widgets/custome%20_appbar/custome_appbar.dart';
import 'package:wallpaper_app/views/widgets/custome_searchbar/custom_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomAppBar(
            word1: 'search_screen_appBar'.tr,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const CustomSearchBar()),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 40,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 13,
                            mainAxisExtent: 400,
                            mainAxisSpacing: 10),
                    itemBuilder: ((context, index) => SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                fit: BoxFit.cover,
                                "https://images.pexels.com/photos/16129703/pexels-photo-16129703/free-photo-of-man-coding-on-computers-sitting-at-desk.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                          ),
                        ))),
              )
            ],
          ),
        ));
  }
}
