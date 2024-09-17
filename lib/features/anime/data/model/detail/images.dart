import 'image_format.dart';

class Images {
  final ImageFormat jpg;
  final ImageFormat webp;

  Images({
    required this.jpg,
    required this.webp,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: ImageFormat.fromJson(json['jpg']),
      webp: ImageFormat.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}
