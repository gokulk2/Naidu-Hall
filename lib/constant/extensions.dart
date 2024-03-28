import 'dart:ui';

String toSSN(T) {
  String parsedText = '${T ?? ''}';
  if (parsedText.isNotEmpty) {
    parsedText = parsedText.replaceAllMapped(
        RegExp(r".{3}"), (match) => "${match.group(0)}-");
    var pos = parsedText.length - 1;
    parsedText = pos != -1 ? parsedText.substring(0, pos) : parsedText;
  }
  return parsedText;
}

String toNullableString(T) {
  String parsedText = '${T ?? ''}';
  return parsedText;
}

bool toNullableBool(T) {
  bool parsedText = T ?? false;
  return parsedText;
}

bool isNullOrEmpty(T) {
  if ('${T ?? ''}'.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool isNotNullOrEmpty(T) {
  if ('${T ?? ''}'.isEmpty) {
    return false;
  } else {
    return true;
  }
}

toColorString(T) {
  return isNotNullOrEmpty(T) ? '${Color(int.parse('$T'))}' : '';
}

Color? toColor(T) {
  return isNotNullOrEmpty(T) ? Color(int.parse('$T')) : null;
}
