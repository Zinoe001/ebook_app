import 'dart:convert';
import 'dart:math';
import 'package:ebook_app/models/ebook_model.dart';
import 'package:ebook_app/models/explore_model.dart';
import 'package:ebook_app/models/genre_model.dart';
import 'package:ebook_app/models/search_model.dart';
import 'package:http/http.dart' as http;

class EbookServices {
  var randomNum = Random();
  late int index = randomNum.nextInt(monthNum.length);
  List<int> monthNum = [1, 2, 3, 4, 5, 6];
  Future<EBookModel> getEbookDetails({required int id}) async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://hapi-books.p.rapidapi.com/book/$id"),
          headers: {
            'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
            'X-RapidAPI-Key':
                'e52790d41emsh87fe76bfd5d6cc7p107285jsnde884c58d376'
          });
      final data = jsonDecode(response.body);
      return EBookModel.fromMap(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<GenreModel>> getEbookList({required String query}) async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://hapi-books.p.rapidapi.com/week/$query"),
          headers: {
            'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
            'X-RapidAPI-Key':
                'e52790d41emsh87fe76bfd5d6cc7p107285jsnde884c58d376'
          });
      final data = jsonDecode(response.body);
      List<GenreModel> ebookList =
          List<GenreModel>.from(data.map((e) => GenreModel.fromMap(e)));
      return ebookList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<ExploreModel>> getRandomEbooks() async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://hapi-books.p.rapidapi.com/month/2022/$index"),
          headers: {
            'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
            'X-RapidAPI-Key':
                'e52790d41emsh87fe76bfd5d6cc7p107285jsnde884c58d376'
          });
      final result = jsonDecode(response.body);
      List<ExploreModel> randomList =
          List<ExploreModel>.from(result.map((e) => ExploreModel.fromMap(e)));

      return randomList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<SearchEbookModel>> getSearchedEbook({required String q}) async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://hapi-books.p.rapidapi.com/search/$q"),
          headers: {
            'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
            'X-RapidAPI-Key':
                'e52790d41emsh87fe76bfd5d6cc7p107285jsnde884c58d376'
          });
      final data = jsonDecode(response.body);
      List<SearchEbookModel> seearchedEbook = List<SearchEbookModel>.from(
          data.map((e) => SearchEbookModel.fromMap(e)));
      return seearchedEbook;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
