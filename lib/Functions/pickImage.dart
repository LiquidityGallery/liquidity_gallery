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

Future<PickFile> pickImage() async {
  final XFile? pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    final uint8List = await pickedFile.readAsBytes();
    return PickFile(uint8list: uint8List, name: basename(pickedFile.path));
  } else {
    throw 'No image selected';
  }
}
