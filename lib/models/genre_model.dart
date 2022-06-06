class GenreModel {
  GenreModel({
    required this.id,
    required this.name,
    required this.cover,
    required this.url,
  });

  final int id;
  final String name;
  final String cover;
  final String url;

  factory GenreModel.fromMap(Map<String, dynamic> json) => GenreModel(
        id: json["book_id"],
        name: json["name"],
        cover: json["cover"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "book_id": id,
        "name": name,
        "cover": cover,
        "url": url,
      };
}
