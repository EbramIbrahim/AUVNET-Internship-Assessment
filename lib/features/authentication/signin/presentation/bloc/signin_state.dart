import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  final LoginStatus? loginStatus;
  final String? errorMessage;
  final dynamic data;

  const SignInState({required this.loginStatus, this.errorMessage, this.data});

  SignInState copyWith({
    LoginStatus? loginStatus,
    String? errorMessage,
    dynamic data,
  }) {
    return SignInState(
      loginStatus: loginStatus,
      errorMessage: errorMessage,
      data: data,
    );
  }

  @override
  List<Object?> get props => [loginStatus];
}

