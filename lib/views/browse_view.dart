import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../services/extensions/libgen_api_v2.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  @override
  Future<void> initState() async {
    super.initState();
    print(await LibgenAPI2(Dio()).search(req: "hello"));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Browse',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
