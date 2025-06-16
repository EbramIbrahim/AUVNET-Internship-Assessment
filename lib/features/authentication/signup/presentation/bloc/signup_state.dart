import 'package:equatable/equatable.dart';

enum SignUpStatus { initial, loading, success, failure }

class SignUpState extends Equatable {
  final SignUpStatus? signUpStatus;
  final String? errorMessage;
  final dynamic data;

  const SignUpState({required this.signUpStatus, this.errorMessage, this.data});

  SignUpState copyWith({
    SignUpStatus? signUpStatus,
    String? errorMessage,
    dynamic data,
  }) {
    return SignUpState(
      signUpStatus: signUpStatus,
      errorMessage: errorMessage,
      data: data,
    );
  }

  @override
  List<Object?> get props => [signUpStatus];
}
