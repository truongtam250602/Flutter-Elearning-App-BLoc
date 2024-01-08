class SignUpStates{
  final String userName;
  final String email;
  final String password;
  final String rePassword;
  const SignUpStates({
    this.userName="",
    this.email="",
    this.password="",
    this.rePassword=""
  });

  SignUpStates copyWith({
    String? userName, String? email, String? password, String? rePassword
  }){
    return SignUpStates(
      userName: userName??this.userName,
      email: email??this.email,
      password: password??this.password,
      rePassword: rePassword??this.rePassword
    );
  }
}