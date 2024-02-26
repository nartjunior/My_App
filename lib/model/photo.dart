class PictureModel {
  final String author;
  final String? title;
  final String imageUrl;

  const PictureModel({
    required this.author,
    this.title,
    required this.imageUrl,
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      author: json['user']['name'],
      title: json['description'],
      imageUrl: json['urls']['regular'],
    );
  }
}