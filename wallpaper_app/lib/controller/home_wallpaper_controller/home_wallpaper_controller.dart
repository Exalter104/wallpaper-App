import 'package:get/get.dart';
import 'package:wallpaper_app/controller/repository/home_wallapaper_repository.dart';

class HomeWallpaperController extends GetxController {
  final _getHomeWallpaperRepo = HomeWallpaperRepository();
  List homeWallpaperModel = [].obs;
  RxBool isLoading = true.obs;
  RxBool isRefresh = true.obs;

  @override
  onInit() async {
    await getHomeWallpaper();
    print("print 3 controller : inside of controller");
    super.onInit();
  }

  getHomeWallpaper() async {
    try {
      homeWallpaperModel = await _getHomeWallpaperRepo.getAllWallpaper();

      update();

      isLoading = false.obs;
      isRefresh = false.obs;

      update();
    } catch (e) {
      isLoading = false.obs;
      isRefresh = false.obs;

      update();
    }
  }

  loadMore() {}
}
