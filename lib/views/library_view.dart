import 'package:flutter/material.dart';

import '../core/routes.dart';
import '../services/extensions/models.dart';
import '../services/favorites_api.dart';

class LibraryView extends StatelessWidget {
  LibraryView({super.key});

  final _favoritesAPI = FavoritesAPI();

  @override
  Widget build(BuildContext context) {
    final List<Book> books;
    books = _favoritesAPI.getFavoriteBooks();

    void viewBook(Book book) {
      FavoriteBookRoute(
        id: book.id,
        title: book.title,
        author: book.author,
        mirror_1: book.mirror_1,
      ).go(context);
    }

    return Align(
        alignment: Alignment.topCenter,
        child: books.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "No books in your library",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Browse to add a book in your library",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () => viewBook(book),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Center(
                                child: Image.network(
                                  height: 170,
                                  width: 185,
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Libgen_logo.svg/1200px-Libgen_logo.svg.png",
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    book.title ?? "Missing title",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ));
  }
}
