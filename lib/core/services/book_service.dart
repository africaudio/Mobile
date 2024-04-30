import 'dart:async';
import 'dart:convert';

import 'package:abook/data/models/book_model.dart';
import 'package:abook/index.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<BookModel>> allBooks(
      {required int limit, required int page}) async {
    final response = await http.get(
        Uri.parse(
          '$baseUrl/api/v1/title?limit=$limit&page=$page',
        ),
        headers: {'Authorization': 'Bearer $token'});
    try {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['ok'] == true) {
          final books = List<BookModel>.from(
            jsonResponse['data']['items'].map(
              (i) => BookModel.fromMap(i),
            ),
          );
          // print(jsonResponse['data']['items']);
          return books;
        } else {
          throw Exception('Server returned an error');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print(response.statusCode);
      }
      throw Exception('Failed to load books');
    }
  }

  // Future<List<BookModel>> allBooks() async {
  //   List<BookModel> books = [];
  //   final url = Uri.parse(
  //     '$baseUrl/api/v1/title?limit=1&page=5',
  //   );
  //   final response = await http.get(
  //     url,
  //   );
  //   final data = jsonDecode(response.body);

  //   try {
  //     if (data['ok'] == true) {
  //       for (dynamic item in data['data']) {
  //         BookModel book = BookModel(
  //           ratings: Ratings.fromMap(item['ratings']),
  //           id: item['_id'],
  //           title: item['title'],
  //           author: item['author'],
  //           narrator: item['narrator'],
  //           length: item['length'],
  //           releaseDate: DateTime.parse(item['release_date']),
  //           language: item['language'],
  //           publisher: item['publisher'],
  //           categories: List<String>.from(item['categories'].map((x) => x)),
  //           coverImageUrl: item['coverImageUrl'],
  //           audioSampleUrl: item['audioSampleUrl'],
  //           description: item['description'],
  //           reviews: List<Review>.from(
  //               item['reviews'].map((x) => Review.fromMap(x))),
  //           chapters: List<Chapter>.from(
  //               item['chapters'].map((x) => Chapter.fromMap(x))),
  //           v: item['__v'],
  //           createdAt: DateTime.parse(item['createdAt']),
  //           updatedAt: DateTime.parse(item['updatedAt']),
  //         );
  //         books.add(book);
  //       }
  //       print(books);
  //     } else {
  //       books = [];
  //     }
  //   } on SocketException {
  //     books = [];
  //     // si.dialogService.showToast('Please Check your Internet Connection');
  //   } on TimeoutException catch (_) {
  //     books = [];
  //     // si.dialogService.showToast(e.message.toString());
  //   }
  //   return books;
  // }
}
