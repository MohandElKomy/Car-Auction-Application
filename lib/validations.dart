import 'constants/texts.dart';

class Validations {
  static String? validatePhoneNumber(String? value) {
    var pattern = r'(^01[0125][0-9]{8}$)';
    RegExp regExp = RegExp(pattern);
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      value = value!.replaceAll(arabic[i], english[i]);
    }
    if (value!.isEmpty) {
      return tPhoneEmpty;
    } else if (regExp.hasMatch(value) == false) {
      return tPhoneStart;
    }
    return null;
  }
}
