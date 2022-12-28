
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectPhotoController extends GetxController {
  XFile? file;
  final ImagePicker imagePicker = ImagePicker();

  getImage() async {
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    update();
  }
}
