import 'package:bloc/bloc.dart';
import 'package:nawel/features/authentication/domain/repository/auth_repository.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_event.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;

  SignInBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(SignInState(loginStatus: LoginStatus.initial)) {

    on<SignInRequired>((event, emit) async {
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      final result = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            loginStatus: LoginStatus.failure,
            errorMessage: l.erorr,
          ),
        ),
        (r) => emit(state.copyWith(loginStatus: LoginStatus.success, data: r)),
      );
    });
  }
}
