class Model {
  final String login;
  final String password;
  final String polynomial;
  final String polynomialResult;

  Model(this.polynomialResult,
      {required this.login, required this.password, required this.polynomial});

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
        'polnomial': polynomial,
        'polynomialResult': polynomialResult
      };
}
