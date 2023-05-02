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
  void initState() {
    super.initState();
    search();
  }

  Future<void> search() async {
    // print(await LibgenAPI2(Dio()).search('test', null, null, null, null, null));
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
