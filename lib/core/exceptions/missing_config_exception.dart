class MissingConfigException implements Exception {
  final String nameOfConfig;

  MissingConfigException(this.nameOfConfig);

  @override
  String toString() => 'Missing $nameOfConfig config ';
}
