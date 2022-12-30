import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? _instance;
  late SharedPreferences sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveEmail({required String email}) async {
    await sharedPreferences.setString("email", email);
  }
  Future<void> saveName({required String username}) async {
    await sharedPreferences.setString("name", username);
  }
  Future<void> saveImage({required String path}) async {
    await sharedPreferences.setString("imagePath", path);
  }

  String? get email{
    return sharedPreferences.getString("email");
  }
  String? get username{
    return sharedPreferences.getString("name");
  }
  String? get image{
    return sharedPreferences.getString("imagePath");
  }
}
