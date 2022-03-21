import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:honeywell_scanner/honeywell_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Scanner extends StatefulWidget {
  const Scanner({
    Key? key,
    required this.validator,
    required this.onDecoded,
    required this.onError,
    this.showScanned = true,
    this.enableOnScreenScanButton = true,
    this.enableAudio = true,
    this.buttonAlignment = Alignment.bottomCenter,
    required this.child,
  }) : super(key: key);

  final bool Function(String? result) validator;

  final void Function(String? result) onDecoded;
  final void Function(Exception error) onError;

  final bool showScanned;
  final bool enableOnScreenScanButton;
  final bool enableAudio;
  final Alignment buttonAlignment;

  final Widget child;

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner>
    with WidgetsBindingObserver
    implements ScannerCallBack {
  final HoneywellScanner honeywellScanner = HoneywellScanner();

  final audioPlayer = AudioCache(prefix: 'assets/audios/');

  playCorrect() => audioPlayer.play('correct.wav');
  playError() => audioPlayer.play('error.wav');

  handle(String? result) {
    widget.onDecoded(result);
    if (widget.showScanned) {
      Fluttertoast.showToast(msg: result ?? 'empty', gravity: ToastGravity.TOP);
    }
    if (widget.enableAudio) playCorrect();
  }

  handleError(String msg) {
    if (widget.showScanned) {
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.TOP);
    }
    if (widget.enableAudio) playError();
  }

  Future<void> init() async {
    final isDeviceSupported = await honeywellScanner.isSupported();
    if (isDeviceSupported) await honeywellScanner.startScanner();
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    honeywellScanner.setScannerCallBack(this);
    init();
  }

  @override
  void onDecoded(String? result) {
    if (widget.validator(result)) {
      handle(result);
    } else {
      handleError('Scanned code invalid');
    }
  }

  @override
  void onError(Exception error) {
    onError(error);
    handleError(error.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.enableOnScreenScanButton)
          Align(
            alignment: widget.buttonAlignment,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                child: const Icon(
                  Icons.qr_code_scanner,
                  size: 30,
                ),
                onTapUp: (details) => honeywellScanner.stopScanning(),
                onTapDown: (details) => honeywellScanner.startScanning(),
              ),
            ),
          )
      ],
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        honeywellScanner.resumeScanner();
        break;
      case AppLifecycleState.inactive:
        honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState.paused:
        honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState.detached:
        honeywellScanner.pauseScanner();
        break;
    }
  }

  @override
  void dispose() {
    honeywellScanner.stopScanner();
    super.dispose();
  }
}
