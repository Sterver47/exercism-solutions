class PhoneNumber {
  String clean(String input) {
    // Exception if user-entered phone number contains letters
    if (RegExp(r'[a-zA-Z]').hasMatch(input)) {
      throw FormatException('letters not permitted');
    }

    // Exception if user-entered phone number contains punctuations
    if (RegExp(r'[!@#$%^&*,?":{}|<>\[\]\\]').hasMatch(input)) {
      throw FormatException('punctuations not permitted');
    }

    // Remove all non-digits
    String cleaned = input.replaceAll(RegExp(r'[^\d]'), '');

    // Exception if user-entered phone number contains more than 11 digits
    if (cleaned.length > 11) {
      throw FormatException('more than 11 digits');
    }

    // Exception if user-entered phone number contains 11 digits and doesn't start with 1
    if (cleaned.length == 11) {
      if (cleaned[0] != '1') {
        throw FormatException('11 digits must start with 1');
      }

      // Remove first digit
      cleaned = cleaned.substring(1);
    }

    // Exception if user-entered phone number doesn't contain 10 digits
    if (cleaned.length != 10) {
      throw FormatException('incorrect number of digits');
    }

    // Exception if user-entered phone number contains invalid area code
    // (starts with 0 or 1)
    if (cleaned[0] == '0') {
      throw FormatException('area code cannot start with zero');
    } else if (cleaned[0] == '1') {
      throw FormatException('area code cannot start with one');
    }

    // Exception if user-entered phone number contains invalid exchange code
    // (starts with 0 or 1)
    if (cleaned[3] == '0') {
      throw FormatException('exchange code cannot start with zero');
    } else if (cleaned[3] == '1') {
      throw FormatException('exchange code cannot start with one');
    }

    return cleaned;
  }
}
