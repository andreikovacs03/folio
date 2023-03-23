import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  final String link;

  const PdfView({required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.network(link));
  }
}
