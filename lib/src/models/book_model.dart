
class BookModel {
  String _kind;
  int _totalItems;
  List<_Items> _items = [];

  BookModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['items'].length);
    _kind = parsedJson['kind'];
    _totalItems = parsedJson['totalItems'];

    List<_Items> temp = [];
    for (int i = 0; i < parsedJson['items'].length; i++) {
      _Items item = _Items(parsedJson['items'][i]);
      temp.add(item);
    }
    _items = temp;
  }

  List<_Items> get items => _items;

  String get kind => _kind;

  int get totalItems => _totalItems;
}

class _Items {
  String _kind;
  String _id;
  String _etag;
  String _selfLink;
  _VolumeInfo _volumeInfo;
//  _ImageLinks _imageLinks;

  _Items(items) {
    _kind = items['kind'];
    _id = items['id'];
    _etag = items['etag'];
    _selfLink = items['selfLink'];
    _volumeInfo = _VolumeInfo(items['volumeInfo']);
//    _imageLinks = _ImageLinks(items['imageLinks']);
  }

  String get kind => _kind;

  String get id => _id;

  String get etag => _etag;

  String get selfLink => _selfLink;

  _VolumeInfo get volumeInfo => _volumeInfo;

//  _ImageLinks get imageLinks => _imageLinks;
}

class _VolumeInfo {
  String _title;
  List<String> _authors = [];
  String _publisher;
  String _publishedDate;
  String _description;
  int _pageCount;
  String _printType;
  List<String> _categories = [];
  String _averageRating;
  _ImageLinks _imageLinks;

  _VolumeInfo(volumeInfo) {
    _title = volumeInfo['title'];
    _publisher = volumeInfo['publisher'];
    _publishedDate = volumeInfo['publishedDate'];
    _description = volumeInfo['description'];
    _pageCount = volumeInfo['pageCount'];
    _printType = volumeInfo['printType'];
    _averageRating = volumeInfo['averageRating'].toString();
//    for (int i = 0; i < volumeInfo['categories'].length; i++) {
//      _categories.add(volumeInfo['categories'][i]);
//    }
    for (int i = 0; i < volumeInfo['authors'].length; i++) {
      _authors.add(volumeInfo['authors'][i]);
    }
    _imageLinks = _ImageLinks(volumeInfo['imageLinks']);
  }

  String get title => _title;

  String get publisher => _publisher;

  String get printType => _printType;

  String get averageRating => _averageRating;

  String get description => _description;

  String get publishedDate => _publishedDate;

  int get pageCount => _pageCount;

  List<String> get categories => _categories;

  List<String> get authors => _authors;

  _ImageLinks get imageLinks => _imageLinks;
}

class _ImageLinks{
  String _smallThumbnail;
  String _thumbnail;

  _ImageLinks(imageLinks){
    _smallThumbnail = imageLinks['smallThumbnail'];
    _thumbnail = imageLinks['thumbnail'];
  }

  String get smallThumbnail => _smallThumbnail;

  String get thumbnail => _thumbnail;

}
