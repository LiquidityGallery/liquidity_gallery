// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:mobile_scanner/mobile_scanner.dart';

/// Scan barcode and qr code, then return [Barcode], return null if
/// user close it.
Future<void> scan(
    BuildContext context, void Function(Barcode? barcode) onScan) async {
  final barcode = await showModalBottomSheet<Barcode>(
      context: context, builder: (context) => const _ScanView());
  onScan(barcode);
}

class _ScanView extends StatefulWidget {
  const _ScanView({Key? key}) : super(key: key);

  @override
  State<_ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<_ScanView>
    with SingleTickerProviderStateMixin {
  /// Allow only one barcode to scan.
  bool isScanned = false;

  void onDetect(Barcode barcode, MobileScannerArguments? arguments) {
    if (!isScanned) Navigator.maybePop(context, barcode);
    isScanned = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(onDetect: onDetect),
    );
  }
}
