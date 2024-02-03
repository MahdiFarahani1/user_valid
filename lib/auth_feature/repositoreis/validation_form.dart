class Valid {
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'نام کاربری نمی‌تواند خالی باشد';
    } else if (value.length < 3) {
      return 'نام کاربری باید حداقل 3 کاراکتر باشد';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'رمز عبور نمی‌تواند خالی باشد';
    } else if (value.length < 6) {
      return 'رمز عبور باید حداقل 6 کاراکتر باشد';
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'شماره همراه نمی‌تواند خالی باشد';
    } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
      return 'شماره همراه باید شامل 11 عدد باشد';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'ایمیل نمی‌تواند خالی باشد';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'ایمیل وارد شده معتبر نیست';
    }
    return null;
  }
}
