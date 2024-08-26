part of 'governorate_bloc.dart';

sealed class GovernorateState extends Equatable {
  const GovernorateState();

  @override
  List<Object> get props => [];
}

final class GovernorateInitial extends GovernorateState {}

final class GetGovernoratesLoadingState extends GovernorateState {}

final class GetGovernoratesLoadedState extends GovernorateState {
  final List<GovernorateModelData> governorates;

  const GetGovernoratesLoadedState({required this.governorates});

  @override
  List<Object> get props => [governorates];
}

final class GetGovernoratesErrorState extends GovernorateState {
  final String message;

  const GetGovernoratesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

