extension ExtString on String {
  //check valid name
  bool get isValidName {
    final nameRegExp = RegExp(r'^[a-zA-ZÀ-ÿ\s]{2,}(?: [a-zA-ZÀ-ÿ\s]+){1,}$');
    return nameRegExp.hasMatch(trim()) && trim().length >= 2;
  }

  //check valid email
  bool get isValidEmail {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
    );
    return emailRegExp.hasMatch(trim());
  }

  //check for valid phone number
  bool get isValidPhone {
    final phoneRegExp = RegExp(r'^(\+?254|0)?[71]\d{8}$');
    return phoneRegExp.hasMatch(trim().replaceAll(RegExp(r'[\s-]'), ''));
  }

  //check valid password
  bool get isValidPassword {
    return trim().length >= 8 &&
        trim().length <= 64 &&
        RegExp(r'[A-Z]').hasMatch(this) && // at least one uppercase
        RegExp(r'[a-z]').hasMatch(this) && // at least one lowercase
        RegExp(r'[0-9]').hasMatch(this) && // at least one digit
        RegExp(r'[\W_]').hasMatch(this); // at least one special char
  }
}
