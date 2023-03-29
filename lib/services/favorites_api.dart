import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'extensions/models.dart';

@lazySingleton
class FavoritesAPI {
  static late SharedPreferences _prefs;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  List<Book> getFavoriteBooks() {
    final favoritesString = _prefs.getString("favorites");
    List<Book> favorites = favoritesString == null
        ? []
        : json
            .decode(favoritesString)
            .map<Book>((x) => Book.fromJson(x))
            .toList();

    return favorites;
  }

  Book upsertFavoriteBook(Book book) {
    final favorites = getFavoriteBooks();
    final index = favorites.indexWhere((element) => element.id == book.id);

    if (index == -1) {
      favorites.add(book);
    } else {
      favorites[index] = book;
    }

    _prefs.setString("favorites", json.encode(favorites));

    return book;
  }

  Book removeFavoriteBook(Book book) {
    final favorites = getFavoriteBooks();
    final index = favorites.indexWhere((element) => element.id == book.id);

    if (index != -1) {
      favorites.removeAt(index);
    }

    _prefs.setString("favorites", json.encode(favorites));

    return book;
  }

  bool isFavorite(Book book) {
    final favorites = getFavoriteBooks();
    final index = favorites.indexWhere((element) => element.id == book.id);

    return index != -1;
  }
}
