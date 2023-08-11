class PhotosModel {
  String? imgSrc;
  String? PhotoName;

  PhotosModel({this.PhotoName, this.imgSrc});

  static PhotosModel fromAPI2App(Map<String, dynamic> photoMap) {
    return PhotosModel(
        PhotoName: photoMap["photographer"],
        imgSrc: (photoMap["src"])["portrait"]);
  }
}
