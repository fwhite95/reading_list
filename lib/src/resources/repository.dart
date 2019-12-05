import 'dart:async';
import 'book_api_provider.dart';
import '../models/book_model.dart';

class Repository{
  final bookApiProvider = BookApiProvider();

  Future<BookModel> fetchBooks(String search) =>
      bookApiProvider.fetchBookList(search);
}