class RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String confirm_password;

  const RegisterStates(
      {this.userName = '',
      this.email = '',
      this.password = '',
      this.confirm_password = ''});

  RegisterStates copyWith(
      {String? userName,
      String? email,
      String? password,
      String? confirm_password}) {
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirm_password: confirm_password ?? this.confirm_password);
  }
}
