import 'package:flutter/cupertino.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/book_model.dart';

class BookBloc{
  final _repository = Repository();
  final _booksFetcher = PublishSubject<BookModel>();

  Observable<BookModel> get allBooks => _booksFetcher.stream;

  fetchBooks(search) async{
    BookModel bookModel = await _repository.fetchBooks(search);
    _booksFetcher.sink.add(bookModel);
  }

  dispose(){
    _booksFetcher.close();
  }
}

final bloc = BookBloc();