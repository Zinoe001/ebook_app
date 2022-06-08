import 'package:ebook_app/core/services/ebook_services.dart';
import 'package:ebook_app/models/ebook_model.dart';
import 'package:ebook_app/models/explore_model.dart';
import 'package:ebook_app/models/genre_model.dart';
import 'package:ebook_app/widgets/rating.dart';

class EbookFunctions {
  EbookServices services = EbookServices();
  List<ExploreModel> ebookList = [];
  List<GenreModel> genreList = [];
  List<EBookModel> ebook = [];

  getEbook({required int id}) async {
     ebook.add(await services.getEbookDetails(id: id));
  }

  getEbookList() async {
    ebookList = await services.getRandomEbooks();
  }

  getGenreList({required String q}) async {
    genreList = await services.getEbookList(query: q);
  }

  getStarRating({required double rating}) {
    if (0 <= rating && rating <= 0.9) {
      return const StarRating(
        length: 0,
        halfLength: 1,
      );
    } else if (0.9 <= rating && rating <= 1) {
      return const StarRating(
        length: 1,
        halfLength: 0,
      );
    } else if (1 <= rating && rating <= 1.9) {
      return const StarRating(
        length: 1,
        halfLength: 1,
      );
    } else if (1.9 <= rating && rating <= 2) {
      return const StarRating(
        length: 2,
        halfLength: 0,
      );
    } else if (2 <= rating && rating <= 2.9) {
      return const StarRating(
        length: 2,
        halfLength: 1,
      );
    } else if (2.9 <= rating && rating <= 3) {
      return const StarRating(
        length: 3,
        halfLength: 0,
      );
    } else if (3 <= rating && rating <= 3.9) {
      return const StarRating(
        length: 3,
        halfLength: 1,
      );
    } else if (3.9 <= rating && rating <= 4) {
      return const StarRating(
        length: 4,
        halfLength: 0,
      );
    } else if (4 <= rating && rating <= 4.9) {
      return const StarRating(
        length: 4,
        halfLength: 1,
      );
    } else {
      return const StarRating(
        length: 5,
        halfLength: 0,
      );
    }
  }
}
