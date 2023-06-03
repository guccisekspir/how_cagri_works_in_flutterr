part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AuthLoadedState extends AuthState {
  const AuthLoadedState({required this.user});
  final KipssUser user;

  @override
  List<Object> get props => [
        user,
      ];
}

class AuthErrorState extends AuthState {
  const AuthErrorState({required this.errorCode});
  final String errorCode;

  @override
  List<Object> get props => [errorCode];
}
