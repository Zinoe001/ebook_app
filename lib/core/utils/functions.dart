import 'package:ebook_app/core/services/ebook_services.dart';
import 'package:ebook_app/models/ebook_model.dart';
import 'package:ebook_app/models/explore_model.dart';
import 'package:ebook_app/models/genre_model.dart';
import 'package:ebook_app/models/search_model.dart';
import 'package:ebook_app/widgets/rating.dart';

class EbookFunctions {
  EbookServices services = EbookServices();
  List<ExploreModel> ebookList = [];
  List<GenreModel> genreList = [];
  List<SearchEbookModel> searchList = [];
  List<EBookModel> ebook = [];
  static List<Map<String, dynamic>> bookmarkList = [];

  getEbook({required int id}) async {
    ebook.add(await services.getEbookDetails(id: id));
  }

  getEbookList() async {
    ebookList = await services.getRandomEbooks();
  }

  getGenreList({required String q}) async {
    genreList = await services.getEbookList(query: q);
  }

  getSearhedList({required String q}) async {
    searchList = await services.getSearchedEbook(q: q);
  }

  static addBookmarkList(Map<String, dynamic> book) {
    bookmarkList.add(book);
    print(bookmarkList.length);
  }

  static removeBookmarkList(Map<String, dynamic> book) {
    bookmarkList.removeWhere((element) => book["id"] == element["id"]);
    print(bookmarkList.length);
  }

  getStarRating({required double rating, required double size}) {
    if (0 <= rating && rating <= 0.9) {
      return StarRating(
        length: 0,
        halfLength: 1,
        size: size,
      );
    } else if (0.9 <= rating && rating <= 1) {
      return StarRating(
        length: 1,
        halfLength: 0,
        size: size,
      );
    } else if (1 <= rating && rating <= 1.9) {
      return StarRating(
        length: 1,
        halfLength: 1,
        size: size,
      );
    } else if (1.9 <= rating && rating <= 2) {
      return StarRating(
        length: 2,
        halfLength: 0,
        size: size,
      );
    } else if (2 <= rating && rating <= 2.9) {
      return StarRating(
        length: 2,
        halfLength: 1,
        size: size,
      );
    } else if (2.9 <= rating && rating <= 3) {
      return StarRating(
        length: 3,
        halfLength: 0,
        size: size,
      );
    } else if (3 <= rating && rating <= 3.9) {
      return StarRating(
        length: 3,
        halfLength: 1,
        size: size,
      );
    } else if (3.9 <= rating && rating <= 4) {
      return StarRating(
        length: 4,
        halfLength: 0,
        size: size,
      );
    } else if (4 <= rating && rating <= 4.9) {
      return StarRating(
        length: 4,
        halfLength: 1,
        size: size,
      );
    } else {
      return StarRating(
        length: 5,
        halfLength: 0,
        size: size,
      );
    }
  }
}
