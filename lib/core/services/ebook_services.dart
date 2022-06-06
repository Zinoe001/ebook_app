import 'dart:convert';
import 'package:ebook_app/models/ebook_model.dart';
import 'package:ebook_app/models/genre_model.dart';
import 'package:ebook_app/models/search_model.dart';
import 'package:http/http.dart' as http;

class EbookServices {
  Future<EBookModel> getEbookDetails({required int id}) async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(
          Uri.parse("https://hapi-books.p.rapidapi.com/book/$id"),
          headers: {
            'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
            'X-RapidAPI-Key':'fb78cc69c4msh5f011b209dbacb8p1860d2jsn49d8d0c478fb'
          });
      final data = jsonDecode(response.body);
      EBookModel ebook = EBookModel.fromMap(data);
      print("finished with services");
      return ebook;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<GenreModel>> getEbookList({required String q}) async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(
          Uri.parse("https://hapi-books.p.rapidapi.com/week/$q"),
          headers: {
            'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
            'X-RapidAPI-Key':
                'fb78cc69c4msh5f011b209dbacb8p1860d2jsn49d8d0c478fb'
          });
      final data = jsonDecode(response.body);
      List<GenreModel> ebookList =
          List<GenreModel>.from(data.map((item) => GenreModel.fromMap(item)));
      print("finished with services");
      return ebookList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<SearchEbookModel>> getSearchedEbook({required String q}) async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(
          Uri.parse("https://hapi-books.p.rapidapi.com/search/$q"),
          headers: {
            'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
            'X-RapidAPI-Key':
                'fb78cc69c4msh5f011b209dbacb8p1860d2jsn49d8d0c478fb'
          });
      final data = jsonDecode(response.body);
      List<SearchEbookModel> seearchedEbook = List<SearchEbookModel>.from(
          data.map((item) => SearchEbookModel.fromMap(item)));
      print("finished with services");
      return seearchedEbook;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
