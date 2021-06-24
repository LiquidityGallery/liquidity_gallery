import 'package:file_picker/file_picker.dart';
import 'package:liquidity_gallery/Models/PickFile.dart';

Future<PickFile> pickFile() async {
  final _result = await FilePicker.platform.pickFiles();

  if (_result != null) {
    return PickFile(uint8list: _result.files.single.bytes!, name: _result.files.single.name);
  } else {
    throw 'User did not pick file';
  }
}