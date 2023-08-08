import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:wallpaper_app/views/components/colors/app_colors.dart';
import 'package:wallpaper_app/views/widgets/custome%20_appbar/custome_appbar.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({super.key});

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomAppBar(
            word1: 'categories_Appbar'.tr,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.network(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      "https://images.pexels.com/photos/1181676/pexels-photo-1181676.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black26),
                ),
                const Positioned(
                  top: 40,
                  left: 180,
                  child: Column(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            color: AppColor.kWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      Text(
                        "Python",
                        style: TextStyle(
                            color: AppColor.kWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  //   )
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 40,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        ])));
  }
}
