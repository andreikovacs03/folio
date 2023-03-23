import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/routes.dart';
import '../services/extensions/libgen_api.dart';

class BookView extends StatelessWidget {
  final String? mirror_1;
  final String? title;
  final String? author;

  const BookView({super.key, this.mirror_1, this.title, this.author});

  @override
  Widget build(BuildContext context) {
    Future<void> onRead() async {
      final libgenApi = LibgenAPI(Dio());
      final download = await libgenApi.download(mirror_1!);

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
                            title ?? "Missing title",
                            style: const TextStyle(fontSize: 17),
                          ),
                          Text(
                            author ?? "Missing author",
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
                      onPressed: () => onRead(),
                      child: const Text('Read'),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
