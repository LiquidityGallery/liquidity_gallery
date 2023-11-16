import 'package:image_picker/image_picker.dart';
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

Future<XFile> takeImage() async {
  final pickedFile =
      await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedFile != null) {
    final uint8List = await pickedFile.readAsBytes();
    return XFile.fromData( uint8List, name: basename(pickedFile.path));
  } else {
    throw 'No image selected';
  }
}
