part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInLoggedIn extends SignInEvent {}

class SignInPasswordVisibilityChanged extends SignInEvent {
  final bool value;

  const SignInPasswordVisibilityChanged({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}

class SignInUsernameChanged extends SignInEvent {
  final String value;

  SignInUsernameChanged({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}

class SignInPasswordChanged extends SignInEvent {
  final String value;

  SignInPasswordChanged({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}
