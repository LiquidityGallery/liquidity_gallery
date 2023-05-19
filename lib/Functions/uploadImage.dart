import 'package:firebase_storage/firebase_storage.dart';
import 'package:liquidity_gallery/Models/PickFile.dart';

Future<String> uploadImage(PickFile pickFile) async {
  final ref = FirebaseStorage.instance.ref('MDOS/${pickFile.name}');
  try {
    await ref.putData(pickFile.uint8list);
    return await ref.getDownloadURL();
  } catch (e) {
    rethrow;
  }
}
