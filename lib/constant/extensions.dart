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
