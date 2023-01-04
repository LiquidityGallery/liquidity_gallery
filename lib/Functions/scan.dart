// Flutter imports:
import 'package:flutter/material.dart';
import 'package:honeywell_scanner/scanned_data.dart';

// Package imports:
import 'package:mobile_scanner/mobile_scanner.dart';

import '../Widgets/HoneyScanner.dart' as honeywell;

/// Scan barcode and qr code, then return [Barcode], return null if
/// user close it.
Future<void> scan(
    BuildContext context, void Function(String? barcode) onScan) async {
  final barcode = await showModalBottomSheet<String?>(
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
    if (!isScanned) Navigator.maybePop(context, barcode.rawValue);
    isScanned = true;
  }

  @override
  Widget build(BuildContext context) {
    return honeywell.Scanner(
        debug: ScannedData(
          codeType: honeywell.BarcodeType.ean13.name,
          code: '99999',
        ),
        onDecoded: (scanData) async {
          print(scanData.code);
          Navigator.maybePop(context, scanData.code);
        },
        child: Scaffold(
          body: MobileScanner(onDetect: onDetect),
        ));
  }
}
