

class OTPArguments {
  String title;
  Function() navigateTo;
  bool? isRegistration;
  bool? isForgetPassword;
  OTPArguments({required this.title, required this.navigateTo, this.isRegistration, this.isForgetPassword});
}

class UserArgument {
  String title;
  bool isRegistration;
  UserArgument({required this.title, required this.isRegistration});
}