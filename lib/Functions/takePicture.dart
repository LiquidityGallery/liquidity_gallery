import 'package:image_picker/image_picker.dart';
import 'package:liquidity_gallery/Models/PickFile.dart';
import 'package:path/path.dart';

///Usage (IOS Only): add these three line to Info.plist
///
/// 	<key>NSPhotoLibraryUsageDescription</key>
///
/// 	<string>Privacy - Photo Library Usage Description</string>
///
/// 	<key>NSCameraUsageDescription</key>
///
///   <string>Privacy - Camera Usage Description</string>
///
///   <key>NSMicrophoneUsageDescription</key>
///
///   <string>Privacy - Microphone Usage Description</string>

Future<PickFile> takeImage() async {
  final PickedFile? _pickedFile =
      await ImagePicker().getImage(source: ImageSource.camera);
  if (_pickedFile != null) {
    final _uint8List = await _pickedFile.readAsBytes();
    return PickFile(uint8list: _uint8List, name: basename(_pickedFile.path));
  } else {
    throw 'No image selected';
  }
}
