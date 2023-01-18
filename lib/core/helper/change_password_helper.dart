import 'package:dependencies/dependencies.dart';
import 'package:tekction/locator.dart';
import 'package:tekction/utils/ui_helper.dart';

class ProfileHelper {
  Future<void> updatePassword({required String newPassword}) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? currentUser = firebaseAuth.currentUser;
    currentUser!.updatePassword(newPassword).then((_) {
      // Password has been updated.
      locator<UiHelper>().showToast(msg: 'Password has been updated');
    }).catchError((err) {
      // An error has occured.
      locator<UiHelper>().showToast(msg: 'Unable to change password');
    });
  }
}
