import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:folio/services/book_view_api.dart';
import 'package:folio/services/favorites_api.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/routes.dart';
import '../services/extensions/libgen_api.dart';
import '../services/extensions/models.dart';

class BookPageView extends StatefulWidget {
  late final Book book;

  BookPageView({super.key, Book? book}) {
    this.book = book!;
  }

  @override
  State<BookPageView> createState() => _BookPageViewState();
}

class _BookPageViewState extends State<BookPageView> {
  late bool isFavorite;
  late final FavoritesAPI _favoritesAPI;
  late final BookViewAPI _bookViewAPI;

  @override
  void initState() {
    super.initState();

    _favoritesAPI = FavoritesAPI();
    _bookViewAPI = BookViewAPI();
    isFavorite = _favoritesAPI.isFavorite(widget.book);
  }

  onFavorite() async {
    _favoritesAPI.upsertFavoriteBook(widget.book);
    setState(() => isFavorite = true);
  }

  onUnfavorite() async {
    _favoritesAPI.removeFavoriteBook(widget.book);
    setState(() => isFavorite = false);
  }

  onOpenInBrowser() async {
    var logger = Logger();

    try {
      final uri = Uri.parse(Uri.encodeFull(widget.book.mirror_1 ??
          widget.book.mirror_2 ??
          widget.book.mirror_3 ??
          widget.book.mirror_4 ??
          widget.book.mirror_5!));

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        logger.e("Could not launch ${uri.toString()}");
      }
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onRead() async {
      final libgenApi = LibgenAPI(Dio());
      final download = await libgenApi.download(widget.book.mirror_1!);

      _bookViewAPI
          .upsertBookView(BookView(book: widget.book, date: DateTime.now()));

      if (download.cloudflare != null) {
        // ignore: use_build_context_synchronously
        PdfRoute(download.cloudflare!).go(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BackButton(onPressed: () => context.pop()),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 120,
                        maxHeight: 165,
                        maxWidth: 120,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.network(
                              height: 100,
                              width: 95,
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Libgen_logo.svg/1200px-Libgen_logo.svg.png"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.book.title ?? "Missing title",
                            style: const TextStyle(fontSize: 17),
                          ),
                          Text(
                            widget.book.author ?? "Missing author",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              foreground: Paint()..color = Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: isFavorite
                            ? null
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withAlpha(160),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        padding: const EdgeInsets.all(16),
                      ),
                      statesController: MaterialStatesController(),
                      onPressed: () =>
                          isFavorite ? onUnfavorite() : onFavorite(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Icon(isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border),
                          ),
                          Text(isFavorite ? 'In library' : 'Add to library'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withAlpha(160),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        padding: const EdgeInsets.all(16),
                      ),
                      statesController: MaterialStatesController(),
                      onPressed: () => onOpenInBrowser(),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Icon(Icons.public),
                          ),
                          Text('Open in browser'),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // shape: const RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.zero),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () => onRead(),
                        child: const Text('Read'),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
