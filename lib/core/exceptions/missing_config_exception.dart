class MissingConfigException implements Exception {
  MissingConfigException(this.nameOfConfig);
  final String nameOfConfig;

  @override
  String toString() => 'Missing $nameOfConfig config ';
}
