import 'package:flutter/material.dart';
import 'package:folio/services/book_view_api.dart';
import 'package:intl/intl.dart';

import '../core/routes.dart';
import '../services/extensions/models.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final _bookViewAPI = BookViewAPI();

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<BookView>> bookViewsGroupedByDate =
        _bookViewAPI.getBookViewsGroupedByDate();

    void viewBook(Book book) {
      HistoryBookRoute(
        id: book.id,
        title: book.title,
        author: book.author,
        mirror_1: book.mirror_1,
      ).go(context);
    }

    void removeBookView(Book book) {
      _bookViewAPI.removeBookView(book);
      setState(() =>
          bookViewsGroupedByDate = _bookViewAPI.getBookViewsGroupedByDate());
    }

    return bookViewsGroupedByDate.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "No books in your history",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Browse to add a book in your history",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        : ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: bookViewsGroupedByDate.length,
              itemBuilder: (context, index) {
                final date = bookViewsGroupedByDate.keys.elementAt(index);
                final bookViews = bookViewsGroupedByDate[date];

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(date),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...bookViews!
                          .map(
                            (bookView) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                padding: const EdgeInsets.all(16),
                                //no shape
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(0),
                                  ),
                                ),
                              ),
                              onPressed: () => viewBook(bookView.book),
                              child: Row(
                                children: [
                                  Card(
                                    margin: const EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                          height: 90,
                                          width: 60,
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Libgen_logo.svg/1200px-Libgen_logo.svg.png"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            bookView.book.title ??
                                                "Missing title",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            bookView.book.author ??
                                                "Missing author",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        removeBookView(bookView.book),
                                    icon: const Icon(Icons.delete_outline),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ]);
              },
            ),
          );
  }
}
