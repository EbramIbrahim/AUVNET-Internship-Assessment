import 'package:bloc/bloc.dart';
import 'package:nawel/features/authentication/domain/repository/auth_repository.dart';
import 'package:nawel/features/authentication/signup/presentation/bloc/signup_event.dart';
import 'package:nawel/features/authentication/signup/presentation/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository;

  SignUpBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(SignUpState(signUpStatus: SignUpStatus.initial)) {
    on<SignUpRequired>((event, emit) async {
      emit(state.copyWith(signUpStatus: SignUpStatus.loading));
      final result = await _authRepository.signUp(
        email: event.email,
        password: event.password,
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            signUpStatus: SignUpStatus.failure,
            errorMessage: l.erorr,
          ),
        ),
        (r) =>
            emit(state.copyWith(signUpStatus: SignUpStatus.success, data: r)),
      );
    });
  }
}
