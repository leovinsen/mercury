class ResultMoreThanOneException implements Exception {
  final String msg;
  final List<Map<String, dynamic>> resultSet;
  const ResultMoreThanOneException(this.resultSet)
      : this.msg = "ResultSet for getOne() is greater than 1 - result: $resultSet";
}
