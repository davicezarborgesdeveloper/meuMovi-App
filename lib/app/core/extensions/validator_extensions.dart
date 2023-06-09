extension ValidatorExtensions on String {
  bool get isCPFValid {
    final String number = replaceAll(RegExp(r'[^0-9]'), '');
    if (number == '00000000000' ||
        number == '11111111111' ||
        number == '22222222222' ||
        number == '33333333333' ||
        number == '44444444444' ||
        number == '55555555555' ||
        number == '66666666666' ||
        number == '77777777777' ||
        number == '88888888888' ||
        number == '99999999999') return false;

    if (number.length != 11) {
      return false;
    }
    final List<int> numbers = number.split('').map(int.parse).toList();
    int firstSum = 0;

    for (int i = 0; i < 9; i++) {
      firstSum += numbers[i] * (10 - i);
    }

    final int firstDigit = (firstSum % 11 < 2) ? 0 : 11 - (firstSum % 11);

    if (firstDigit != numbers[9]) {
      return false;
    }

    int secondSum = 0;

    for (int i = 0; i < 10; i++) {
      secondSum += numbers[i] * (11 - i);
    }

    final int secondDigit = (secondSum % 11 < 2) ? 0 : 11 - (secondSum % 11);

    if (secondDigit != numbers[10]) {
      return false;
    }

    return true;
  }

  bool get isCNPJValid {
    final String number = replaceAll(RegExp(r'[^0-9]'), '');

    if (number == '00000000000000' ||
        number == '11111111111111' ||
        number == '22222222222222' ||
        number == '33333333333333' ||
        number == '44444444444444' ||
        number == '55555555555555' ||
        number == '66666666666666' ||
        number == '77777777777777' ||
        number == '88888888888888' ||
        number == '99999999999999') return false;

    if (number.length != 14) {
      return false;
    }
    final List<int> numbers = number.split('').map(int.parse).toList();
    final List<int> numFstSum = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    int firstSum = 0;

    for (int i = 0; i < numFstSum.length; i++) {
      firstSum += numbers[i] * numFstSum[i];
    }

    final int firstDigit = (firstSum % 11 < 2) ? 0 : 11 - (firstSum % 11);

    if (firstDigit != numbers[12]) {
      return false;
    }

    int secondSum = 0;
    final List<int> numSndSum = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

    for (int i = 0; i < numSndSum.length; i++) {
      secondSum += numbers[i] * numSndSum[i];
    }

    final int secondDigit = (secondSum % 11 < 2) ? 0 : 11 - (secondSum % 11);

    if (secondDigit != numbers[13]) {
      return false;
    }

    return true;
  }

  bool get isPhoneValid {
    final RegExp regex = RegExp(
      r'^\([1-9]{2}\) (?:[2-8]|9[1-9])[0-9]{3}\-[0-9]{4}$',
    );
    return regex.hasMatch(this);
  }

  bool get isEmailValid {
    final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$",
    );
    return regex.hasMatch(this);
  }

  bool get isZipValid {
    final RegExp regex = RegExp(
      r'^(\d{3}[.\s]?\d{3}[.\s]?\d{3}[-.\s]?\d{2})$',
    );
    return regex.hasMatch(this);
  }
}
