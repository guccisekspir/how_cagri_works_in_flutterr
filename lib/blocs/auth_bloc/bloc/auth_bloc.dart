import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:how_cagri_work_on_flutter/data/auth_repository.dart';
import 'package:how_cagri_work_on_flutter/data/database_repository.dart';
import 'package:how_cagri_work_on_flutter/locator.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is GoogleSign) {
          await _loginWithGoogle(emit);
        }
      },
    );
  }
  final AuthRepository _authRepository = getIt<AuthRepository>();
  final DatabaseRepository _databaseRepository = getIt<DatabaseRepository>();

  Future<void> _loginWithGoogle(Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final user = await _authRepository.loginWithGoogle();

      if (user != null) {
        final isSaved = await _databaseRepository.coreSaveUser(user);
        if (isSaved) {
          emit(AuthLoadedState(user: user));
        } else {
          emit(const AuthErrorState(errorCode: 'User not saved'));
        }
      } else {
        emit(const AuthErrorState(errorCode: 'Internal error'));
      }
    } on FirebaseException catch (e) {
      emit(AuthErrorState(errorCode: e.code));
    } catch (e) {
      emit(AuthErrorState(errorCode: e.toString()));
    }
  }
}
