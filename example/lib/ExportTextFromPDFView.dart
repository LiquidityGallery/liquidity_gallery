import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:path_provider/path_provider.dart';

class ExportTextFromPDFView extends StatefulWidget {
  const ExportTextFromPDFView({super.key});

  @override
  _ExportTextFromPDFViewState createState() => _ExportTextFromPDFViewState();
}

class _ExportTextFromPDFViewState extends State<ExportTextFromPDFView> {
  String? _string;

  Future<File> loadExamplePDF() async {
    print('Loading bytes from assets');
    final bytes = await rootBundle.load('assets/pdf/MDO_example.pdf');
    print('Bytes loaded');

    print('Creating temporary empty file...');
    final file =
        File('${(await getTemporaryDirectory()).path}/pdf/MDO_example.pdf');
    print('Temporary empty file created');

    print('Writing bytes from assets to temporary empty file...');
    await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    print('Bytes from assets wrote to temporary empty file');

    return file;
  }

  Future<PDFDoc> convertFileToPDFDoc(File file) async {
    return await PDFDoc.fromFile(file);
  }

  Future<String> getTextFromPDFDoc(PDFDoc pdfDoc) async {
    return await pdfDoc.text;
  }

  @override
  void initState() {
    super.initState();
    loadExamplePDF().then((value) => convertFileToPDFDoc(value).then((value) {
          getTextFromPDFDoc(value).then((value) {
            setState(() {
              _string = value;
            });
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export text from PDF'),
      ),
      body: _string == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Center(
              child: Text(_string!),
            ),
    );
  }
}
