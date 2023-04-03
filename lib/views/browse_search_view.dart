import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:folio/core/routes.dart';
import 'package:go_router/go_router.dart';

import '../services/extensions/libgen_api.dart';
import '../services/extensions/models.dart';

class BrowseSearchView extends StatefulWidget {
  const BrowseSearchView({super.key});

  @override
  State<BrowseSearchView> createState() => _BrowseSearchViewState();
}

class _BrowseSearchViewState extends State<BrowseSearchView>
    with TickerProviderStateMixin {
  String title = "";
  bool isLoading = false;
  List<Book>? books;
  late AnimationController controller;

  Future<void> _onSubmitted(String value) async {
    setState(() {
      title = value;
      isLoading = true;
    });

    final libgenApi = LibgenAPI(Dio());
    try {
      final books = await libgenApi.searchTitle(value);
      setState(() {
        this.books = books;
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    void viewBook(Book book) {
      BookRoute(
        id: book.id,
        title: book.title,
        author: book.author,
        mirror_1: book.mirror_1,
      ).go(context);
    }

    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BackButton(onPressed: () => context.pop()),
          ),
          title: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
            onSubmitted: (value) => _onSubmitted(value),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => setState(() => title = ""),
              ),
            ),
          ],
        ),
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          isLoading
              ? const LinearProgressIndicator(
                  semanticsLabel: 'Loading progress',
                )
              : Container(),
          books == null
              ? Container()
              : Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          "Libgen",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: books!.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        clipBehavior: Clip.antiAlias,
                        itemBuilder: (context, index) {
                          final book = books![index];
                          return GestureDetector(
                            onTap: () => viewBook(book),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Image.network(
                                          height: 80,
                                          width: 95,
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Libgen_logo.svg/1200px-Libgen_logo.svg.png"),
                                    ),
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth: 95, maxHeight: 40),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Center(
                                      child: Text(
                                        book.title ?? "Missing title",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
        ]));
  }
}
