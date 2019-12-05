import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/book_model.dart';
import 'package:flutter/foundation.dart';

class BookApiProvider {
  Client client = Client(); //HTTP
  final _apiKey = "api key";
  //String search = "Brandon+Sanderson";

  Future<BookModel> fetchBookList(String search) async {
    print("Entered fetch");

    final response = await client.get(
        "https://www.googleapis.com/books/v1/volumes?q=$search&projection=full&maxResults=15&key=$_apiKey");
    //print(response.body);
    if (response.statusCode == 200) {
      return BookModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load post");
    }
  }
}
