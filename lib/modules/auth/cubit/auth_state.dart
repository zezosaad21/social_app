part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {}

class AuthSuccessCreatUserState extends AuthState {}

class AuthErrorCreatuserState extends AuthState {}
