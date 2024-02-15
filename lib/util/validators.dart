import 'package:frontend/util/constants.dart';

String? nameValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return ValidationConstants.requiredField;
  }
    if ((value?.length ?? 0) < 3) {
    return ValidationConstants.nameMinCharError;
  }
  if (value!.contains(RegExp(r'\s'))) {
    return ValidationConstants.nameSpacesError;
  }
  return null;
}

String? emailValidator(String? value) {
    if (value?.isEmpty ?? true) {
        return ValidationConstants.requiredField;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!)) {
        return ValidationConstants.emailRegexError;
    }
    return null;
}

String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if ((value?.length ?? 0) < 6) {
      return ValidationConstants.passwordMinCharError;
    }
    return null;
}