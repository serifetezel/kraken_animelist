class ImageFormat {
  final String imageUrl;
  final String? smallImageUrl;

  ImageFormat({
    required this.imageUrl,
    this.smallImageUrl,
  });

  factory ImageFormat.fromJson(Map<String, dynamic> json) {
    return ImageFormat(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
    };
  }
}
