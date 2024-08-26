part of 'governorate_bloc.dart';

sealed class GovernorateEvent extends Equatable {
  const GovernorateEvent();

  @override
  List<Object> get props => [];
}
//Gover
class GetGovernoratesEvent extends GovernorateEvent{}

