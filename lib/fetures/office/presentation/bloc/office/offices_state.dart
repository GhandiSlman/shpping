part of 'offices_bloc.dart';

sealed class OfficesState extends Equatable {
  const OfficesState();

  @override
  List<Object> get props => [];
}

final class OfficesInitial extends OfficesState {}

//Offices
final class GetOfficesLoadingState extends OfficesState {}

final class GetOfficesLoadedState extends OfficesState {
  final List<GetOfficesModelData> offices;

  const GetOfficesLoadedState({required this.offices});

  @override
  List<Object> get props => [offices];
}

final class GetOfficesErrorState extends OfficesState {
  final String message;

  const GetOfficesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

//Filtr office

final class GetFilterOfficesLoadingState extends OfficesState {}

final class GetFilterOfficesLoadedState extends OfficesState {
  final List<GetOfficesModelData> offices;

  const GetFilterOfficesLoadedState({required this.offices});

  @override
  List<Object> get props => [offices];
}

final class GetFilterOfficesErrorState extends OfficesState {
  final String message;

  const GetFilterOfficesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
