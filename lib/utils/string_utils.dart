class StringUtils {
  static String getAbbreviation(String text) {
    var textFormatted = _removeParantheses(text);

    var splitTextArr = textFormatted.split(' ');

    if (splitTextArr.length == 1) return text.substring(0, 3);

    var abbr = '';

    splitTextArr.forEach((text) => abbr += text[0]);

    return abbr;
  }

  static String _removeParantheses(String text) {
    return text.replaceAll('(', '').replaceAll(')', '');
  }
}
