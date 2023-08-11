import 'package:wallpaper_app/controller/data/network/network_api_services.dart';
import 'package:wallpaper_app/views/components/app_url/app_url.dart';

class HomeWallpaperRepository {
  final _apiServices = NetworkApiServices();

  getAllWallpaper() async {
    var response = await _apiServices.getApi(url: AppUrl.curatedWallpaper);

    return response;
  }
}
