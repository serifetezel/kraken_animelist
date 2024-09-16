class ImageDetail {
  final String imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  ImageDetail({
    required this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }
}
