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
    this.enableOnScreenScanButton = false,
    this.enableAudio = true,
    this.buttonAlignment = Alignment.bottomCenter,
    required this.child,
    this.debugInput,
  }) : super(key: key);

  final bool Function(String result) validator;

  final Function(String result) onDecoded;
  final void Function(Exception error) onError;

  final bool showScanned;
  final bool enableOnScreenScanButton;
  final bool enableAudio;
  final Alignment buttonAlignment;

  final Widget child;

  final String? debugInput;

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner>
    with WidgetsBindingObserver
    implements ScannerCallback {
  final HoneywellScanner honeywellScanner = HoneywellScanner();

  bool isDeviceSupported = false;

  final audioPlayer = AudioCache(prefix: 'assets/audios/');

  playCorrect() => audioPlayer.play('correct.wav');
  playError() => audioPlayer.play('error.wav');

  handle(String result) async {
    try {
      await widget.onDecoded(result);
    } catch (e) {
      handleError(e.toString());
      return;
    }
    if (widget.showScanned) {
      Fluttertoast.showToast(msg: result, gravity: ToastGravity.TOP);
    }
    if (widget.enableAudio) playCorrect();
  }

  handleError(String msg) {
    if (widget.showScanned) {
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.TOP);
    }
    if (widget.enableAudio) playError();
  }

  @override
  void initState() {
    super.initState();
    updateScanProperties();
    WidgetsBinding.instance.addObserver(this);
    honeywellScanner.scannerCallback = this;
    init();
  }

  void updateScanProperties() {
    List<CodeFormat> codeFormats = [];
    codeFormats.addAll(CodeFormatUtils.ALL_1D_FORMATS);
    codeFormats.addAll(CodeFormatUtils.ALL_2D_FORMATS);

    Map<String, dynamic> properties = {
      ...CodeFormatUtils.getAsPropertiesComplement(codeFormats),
      'DEC_CODABAR_START_STOP_TRANSMIT': true,
      'DEC_EAN13_CHECK_DIGIT_TRANSMIT': true,
    };
    honeywellScanner.setProperties(properties);
  }

  Future<void> init() async {
    isDeviceSupported = await honeywellScanner.isSupported();
    if (isDeviceSupported) await honeywellScanner.startScanner();
    if (mounted) setState(() {});
  }

  @override
  void onDecoded(ScannedData? scannedData) {
    if (scannedData != null &&
        scannedData.code != null &&
        widget.validator(scannedData.code!)) {
      handle(scannedData.code!);
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
        if (widget.enableOnScreenScanButton && isDeviceSupported)
          Align(
            alignment: widget.buttonAlignment,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                child: const Icon(
                  Icons.qr_code_scanner,
                  size: 30,
                ),
                onTapUp: (details) {
                  if (isDeviceSupported) honeywellScanner.stopScanning();
                },
                onTapDown: (details) {
                  if (isDeviceSupported) honeywellScanner.startScanning();
                },
              ),
            ),
          ),
        if (widget.debugInput != null)
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Material(
                    child: IconButton(
                  icon: const Icon(Icons.bug_report),
                  onPressed: () {
                    if (widget.validator(widget.debugInput!)) {
                      handle(widget.debugInput!);
                    } else {
                      handleError('Scanned code invalid');
                    }
                  },
                )),
              ))
      ],
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (isDeviceSupported) {
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
  }

  @override
  void dispose() {
    if (isDeviceSupported) honeywellScanner.stopScanner();
    super.dispose();
  }
}
