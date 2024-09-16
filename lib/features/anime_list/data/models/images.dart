import 'image_detail.dart';

class Images {
  final ImageDetail jpg;
  final ImageDetail webp;

  Images({required this.jpg, required this.webp});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: ImageDetail.fromJson(json['jpg']),
      webp: ImageDetail.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}
