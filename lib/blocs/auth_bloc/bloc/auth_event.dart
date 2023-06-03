part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class GoogleSign extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AppleSign extends AuthEvent {
  @override
  List<Object> get props => [];
}
