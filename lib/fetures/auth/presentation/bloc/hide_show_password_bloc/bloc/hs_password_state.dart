part of 'hs_password_bloc.dart';

sealed class HsPasswordState extends Equatable {
  const HsPasswordState();
  
  @override
  List<Object> get props => [];
}

final class HsPasswordInitial extends HsPasswordState {}
class PasswordHideShowState extends HsPasswordState {
  final bool isPasswordHidden;
  const PasswordHideShowState(this.isPasswordHidden);

  @override
  List<Object> get props => [isPasswordHidden];
}

