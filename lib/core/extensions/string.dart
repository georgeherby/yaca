extension StringExt on String {
  bool equalsIgnoreCase(String compareTo) =>
      toLowerCase() == compareTo.toLowerCase();
}
