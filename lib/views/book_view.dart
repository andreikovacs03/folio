import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/extensions/libgen_api.dart';

class BookView extends StatelessWidget {
  final Book book;

  const BookView({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
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
                          minWidth: 120, maxHeight: 165, maxWidth: 120),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Image.network(
                                height: 100,
                                width: 95,
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Libgen_logo.svg/1200px-Libgen_logo.svg.png")),
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
                            book.title ?? "Missing title",
                            style: const TextStyle(fontSize: 17),
                          ),
                          Text(
                            book.author ?? "Missing author",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                foreground: Paint()..color = Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // shape: const RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.zero),
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {},
                      child: const Text('Download'),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
