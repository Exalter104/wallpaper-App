// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:wallpaper_app/views/components/colors/app_colors.dart';

class SetWallpaperScreen extends StatefulWidget {
  final String imageurl;

  const SetWallpaperScreen({
    Key? key,
    required this.imageurl,
  }) : super(key: key);

  @override
  State<SetWallpaperScreen> createState() => _SetWallpaperScreenState();
}

class _SetWallpaperScreenState extends State<SetWallpaperScreen> {
  //Set HomeScreen wallapaper
  Future<void> setHomeScreenwallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, location))
            as String;
  }

  Future<void> setlockScreenwallpaper() async {
    int location = WallpaperManager.LOCK_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, location))
            as String;
  }

  PaletteGenerator? _paletteGenerator;
  Future<void> _loadImagePalette() async {
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(NetworkImage(widget.imageurl));
    setState(() {
      _paletteGenerator = paletteGenerator;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadImagePalette();
  }

  @override
  Widget build(BuildContext context) {
    Color shadowColor = _paletteGenerator?.dominantColor?.color ?? Colors.black;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Set Wallpaper'),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  shadowColor.withOpacity(0.99),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      widget.imageurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share,
                          size: 35, color: AppColor.kWhiteColor),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    IconButton(
                      onPressed: () {
                        bottomSheet();
                      },
                      icon: const Icon(Icons.download_for_offline,
                          size: 35, color: AppColor.kWhiteColor),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border,
                          size: 35, color: AppColor.kWhiteColor),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_outlined,
                          size: 35, color: AppColor.kWhiteColor),
                    ),
                  ],
                )
              ],
            )));

    // setHomeScreenwallpaper();
  }

  Future<dynamic> bottomSheet() {
    return Get.bottomSheet(Container(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      height: 350,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 26, 26, 26),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Center(
              child: Text(
            "What would you like todo ",
            style: TextStyle(color: Colors.white),
          )),
          InkWell(
            onTap: () {
              setHomeScreenwallpaper();
            },
            child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    setHomeScreenwallpaper();
                  },
                  icon: const Icon(Icons.now_wallpaper_outlined,
                      size: 30, color: Colors.white),
                ),
                title: const Text(
                  "SET WALLPAPER",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          ListTile(
              leading: IconButton(
                onPressed: () {
                  setlockScreenwallpaper();
                },
                icon: const Icon(Icons.lock, size: 30, color: Colors.white),
              ),
              title: const Text(
                "SET LOCKSCREEN",
                style: TextStyle(color: Colors.white),
              )),
          ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_balance_wallet_outlined,
                    size: 30, color: Colors.white),
              ),
              title: const Text(
                "SET BOTH",
                style: TextStyle(color: Colors.white),
              )),
          ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 30, color: Colors.white),
              ),
              title: const Text(
                "SAVE TO MEDIA FOLDER",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    ));
  }
}
