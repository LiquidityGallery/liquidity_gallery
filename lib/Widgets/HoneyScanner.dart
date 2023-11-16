import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:honeywell_scanner/honeywell_scanner.dart';
import 'package:just_audio/just_audio.dart';

enum BarcodeType {
  upcA,
  ean13,
  code128,
  interleaved,
}

extension BarcodeTypeExtension on BarcodeType {
  String get name {
    switch (this) {
      case BarcodeType.upcA:
        return 'UPC-A';
      case BarcodeType.ean13:
        return 'EAN-13 / Bookland EAN';
      case BarcodeType.code128:
        return 'Code 128';
      case BarcodeType.interleaved:
        return 'Interleaved 2 of 5';
    }
  }
}

String removeCheckDigit(String? code) {
  if (code == null) {
    return '';
  } else {
    return code.substring(0, code.length - 1);
  }
}

class Scanner extends StatefulWidget {
  const Scanner({
    super.key,
    required this.onDecoded,
    required this.child,
    this.debug,
    this.onScannerError,
    this.onError,
  });

  final Function(ScannedData scannedData) onDecoded;
  final Widget child;
  final ScannedData? debug;
  final Function(Exception error)? onScannerError;
  final Function(String error)? onError;

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner>
    with WidgetsBindingObserver
    implements ScannerCallback {
  final HoneywellScanner honeywellScanner = HoneywellScanner();
  bool isSupported = false;

  final AudioPlayer correctPlayer = AudioPlayer();
  final AudioPlayer errorPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    honeywellScanner.scannerCallback = this;
    init();
  }

  Future<void> init() async {
    isSupported = await honeywellScanner.isSupported();
    if (isSupported) {
      await setPlayer();
      updateScanProperties();
      await honeywellScanner.startScanner();
    }
    if (mounted) setState(() {});
  }

  Future<void> setPlayer() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    await correctPlayer.setAsset('assets/audios/correct.mp3');
    await errorPlayer.setAsset('assets/audios/error.mp3');
  }

  Future<void> play(AudioPlayer player) async {
    final playing = player.playerState.playing;
    if (playing != true) {
      return player.play();
    } else {
      return player.seek(Duration.zero);
    }
  }

  Future<void> playCorrectSound() async {
    return play(correctPlayer);
  }

  Future<void> playErrorSound() async {
    return play(errorPlayer);
  }

  void updateScanProperties() {
    List<CodeFormat> codeFormats = [];
    codeFormats.addAll(CodeFormatUtils.ALL_1D_FORMATS);
    codeFormats.addAll(CodeFormatUtils.ALL_2D_FORMATS);
    Map<String, dynamic> properties = {
      ...CodeFormatUtils.getAsPropertiesComplement(codeFormats),
      'DEC_CODABAR_START_STOP_TRANSMIT': true,
      'DEC_EAN13_CHECK_DIGIT_TRANSMIT': true,
      'DEC_UPCA_CHECK_DIGIT_TRANSMIT': true,
    };
    honeywellScanner.setProperties(properties);
  }

  decode(ScannedData scannedData) async {
    try {
      await widget.onDecoded(scannedData);
      playCorrectSound();
    } catch (e) {
      playErrorSound();
      if (widget.onError != null) widget.onError!(e.toString());
      rethrow;
    }
  }

  @override
  void onDecoded(ScannedData? scannedData) async {
    if (scannedData != null) {
      await decode(scannedData);
    }
  }

  @override
  void onError(Exception error) {
    if (widget.onScannerError != null) {
      widget.onScannerError!(error);
    }
  }

  Widget get debugWidget {
    return Material(
      child: IconButton(
        onPressed: () {
          decode(widget.debug!);
        },
        icon: const Icon(Icons.bug_report),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debug != null && kDebugMode) {
      return Stack(
        children: [widget.child, Center(child: debugWidget)],
      );
    } else {
      return widget.child;
    }
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
      case AppLifecycleState
          .paused: //AppLifecycleState.paused is used as stopped state because deactivate() works more as a pause for lifecycle
        honeywellScanner.pauseScanner();
        correctPlayer.stop();
        errorPlayer.stop();
        break;
      case AppLifecycleState.detached:
        honeywellScanner.pauseScanner();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    if (isSupported) {
      honeywellScanner.stopScanner();
      correctPlayer.dispose();
      errorPlayer.dispose();
    }
    super.dispose();
  }
}
