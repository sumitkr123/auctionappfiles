class LoginWithEmailPasswordFailure {
  final String message;

  const LoginWithEmailPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory LoginWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailPasswordFailure('Email is not valid.');

      case 'wrong-password':
        return const LoginWithEmailPasswordFailure(
            'You have entered wrong password.');

      case 'user-disabled':
        return const LoginWithEmailPasswordFailure(
            'This user has been disabled.');

      case 'user-not-found':
        return const LoginWithEmailPasswordFailure('This user is not found.');

      default:
        return const LoginWithEmailPasswordFailure();
    }
  }
}
