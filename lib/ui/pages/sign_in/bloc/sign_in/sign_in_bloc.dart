import 'package:bloc/bloc.dart';
import 'package:e_talim/core/services/http_service.dart';
import 'package:e_talim/core/services/store_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInLoggedIn>(_onSignInLoggedIn);
    on<SignInPasswordChanged>(_onSignInPasswordChanged);
    on<SignInUsernameChanged>(_onSignInUsernameChanged);
    on<SignInPasswordVisibilityChanged>(_onSignInPasswordVisibilityChanged);
  }

  Future<void> _onSignInUsernameChanged(
    SignInUsernameChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(username: event.value));
  }

  Future<void> _onSignInPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(password: event.value));
  }

  Future<void> _onSignInLoggedIn(
    SignInLoggedIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    String? value = await Modular.get<HttpService>().signIn(
      password: state.password,
      username: state.username,
    );

    if (value != null) {
      Modular.get<StoreService>()
        ..setLoggedIn(true)
        ..setToken(value);
    } else {
      emit(state.copyWith(hasError: true, isLoading: false));
    }

    emit(state.copyWith(isLoading: false, hasError: false));
  }

  Future<void> _onSignInPasswordVisibilityChanged(
    SignInPasswordVisibilityChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(showPassword: event.value));
  }
}
