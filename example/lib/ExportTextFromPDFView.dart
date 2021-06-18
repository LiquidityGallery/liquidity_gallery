import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:path_provider/path_provider.dart';

class ExportTextFromPDFView extends StatefulWidget {
  @override
  _ExportTextFromPDFViewState createState() => _ExportTextFromPDFViewState();
}

class _ExportTextFromPDFViewState extends State<ExportTextFromPDFView> {
  String? _string;

  Future<File> loadExamplePDF() async {
    print('Loading bytes from assets');
    final _bytes = await rootBundle.load('assets/pdf/MDO_example.pdf');
    print('Bytes loaded');

    print('Creating temporary empty file...');
    final _file =
        File('${(await getTemporaryDirectory()).path}/pdf/MDO_example.pdf');
    print('Temporary empty file created');

    print('Writing bytes from assets to temporary empty file...');
    await _file.writeAsBytes(
        _bytes.buffer.asUint8List(_bytes.offsetInBytes, _bytes.lengthInBytes));
    print('Bytes from assets wrote to temporary empty file');

    return _file;
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
        title: Text('Export text from PDF'),
      ),
      body: _string == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Center(
              child: Text(_string!),
            ),
    );
  }
}
