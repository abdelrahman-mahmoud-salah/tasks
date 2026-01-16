extension StringValidators on String {
  bool get isValidPhone {
    // basic 10-digit phone validation
    final onlyDigits = replaceAll(RegExp(r'\D'), '');
    return onlyDigits.length >= 8;
  }

  bool get isValidPassword {
    // very simple validation: at least 6 chars
    return trim().length >= 6;
  }
}

