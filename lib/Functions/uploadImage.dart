import 'package:firebase_storage/firebase_storage.dart';
import 'package:liquidity_gallery/Models/PickFile.dart';

Future<String> uploadImage(PickFile pickFile) async {
  final _ref = FirebaseStorage.instance.ref('MDOS/${pickFile.name}');
  try {
    await _ref.putData(pickFile.uint8list);
    return await _ref.getDownloadURL();
  } catch (e) {
    throw e;
  }
}
