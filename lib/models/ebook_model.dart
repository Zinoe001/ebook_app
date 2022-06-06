

class EBookModel {
  EBookModel({
    required this.id,
    required this.name,
    required this.cover,
    required this.author,
    required this.url,
    required this.rating,
    required this.published,
    required this.pages,
    required this.synopsis,
  });

  final int id;
  final String name;
  final String cover;
  final String author;
  final String url;
  final int rating;
  final String published;
  final int pages;
  final String synopsis;

  factory EBookModel.fromMap(Map<String, dynamic> json) => EBookModel(
        id: json["book_id"],
        name: json["name"],
        cover: json["cover"],
        author: json["authors"],
        url: json["url"],
        rating: json["rating"],
        pages: json["pages"],
        published: json["published_date"],
        synopsis: json["synopsis"],
      );

  Map<String, dynamic> toMap() => {
        "book_id": id,
        "name": name,
        "cover": cover,
        "authors": author,
        "url": url,
        "rating": rating,
        "pages": pages,
        "published_date": published,
        "synopsis": synopsis,
      };
}
