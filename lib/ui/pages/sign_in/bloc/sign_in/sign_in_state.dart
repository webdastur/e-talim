part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final String username;
  final String password;
  final bool showPassword;

  const SignInState({
    this.isLoading = false,
    this.hasError = false,
    this.username = "",
    this.password = "",
    this.showPassword = false,
  });

  @override
  List<Object> get props => [
        isLoading,
        hasError,
        username,
        password,
        showPassword,
      ];

  @override
  bool? get stringify => true;

  SignInState copyWith({
    bool? isLoading,
    bool? hasError,
    String? username,
    String? password,
    bool? showPassword,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      username: username ?? this.username,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
