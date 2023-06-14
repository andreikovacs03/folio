import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'extensions/models.dart';

@lazySingleton
class BookViewAPI {
  static late SharedPreferences _prefs;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  List<BookView> getBookViews() {
    final bookViewsString = _prefs.getString("book-views");
    List<BookView> bookViews = bookViewsString == null
        ? []
        : json
            .decode(bookViewsString)
            .map<BookView>((x) => BookView.fromJson(x))
            .toList();

    return bookViews;
  }

  BookView upsertBookView(BookView book) {
    final bookViews = getBookViews();
    final index =
        bookViews.indexWhere((element) => element.book.id == book.book.id);

    if (index == -1) {
      bookViews.add(book);
    } else {
      bookViews[index] = book;
    }

    _prefs.setString("book-views", json.encode(bookViews));

    return book;
  }

  Book removeBookView(Book book) {
    final bookViews = getBookViews();
    final index = bookViews.indexWhere((element) => element.book.id == book.id);

    if (index != -1) {
      bookViews.removeAt(index);
    }

    _prefs.setString("book-views", json.encode(bookViews));

    return book;
  }

  Map<DateTime, List<BookView>> getBookViewsGroupedByDate() {
    final bookViews = getBookViews();

    final bookViewsGroupedByDate = groupBy(
        bookViews,
        (bookView) => DateTime(
            bookView.date.year, bookView.date.month, bookView.date.day));

    // Sort by key (date)
    final sortedBookViewsGroupedByDate = Map.fromEntries(
        bookViewsGroupedByDate.entries.toList()
          ..sort((a, b) => b.key.compareTo(a.key)));

    return sortedBookViewsGroupedByDate;
  }
}
