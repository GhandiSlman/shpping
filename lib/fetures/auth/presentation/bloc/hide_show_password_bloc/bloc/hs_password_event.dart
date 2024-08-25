part of 'hs_password_bloc.dart';

sealed class HsPasswordEvent extends Equatable {
  const HsPasswordEvent();

  @override
  List<Object> get props => [];
}

class HidePasswordEvent extends HsPasswordEvent {
  final bool hideOrShow;
  const HidePasswordEvent({required this.hideOrShow});
  @override
  List<Object> get props => [hideOrShow];
}
