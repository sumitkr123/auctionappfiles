class SignUpWithEmailPasswordFailure {
  final String message;

  const SignUpWithEmailPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory SignUpWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailPasswordFailure(
            'Please enter a strong password.');

      case 'invalid-email':
        return const SignUpWithEmailPasswordFailure(
            'Email is not valid or badly formatted.');

      case 'email-already-in-use':
        return const SignUpWithEmailPasswordFailure(
            'An account already exists for that e-mail.');

      default:
        return const SignUpWithEmailPasswordFailure();
    }
  }
}
