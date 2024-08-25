part of 'offices_bloc.dart';

sealed class OfficesEvent extends Equatable {
  const OfficesEvent();

  @override
  List<Object> get props => [];
}

class GetAllOfficesEvent extends OfficesEvent {}

class GetAllFilterdOfficesEvent extends OfficesEvent {
  final String gover;
 
  const GetAllFilterdOfficesEvent({required this.gover });
  @override
  List<Object> get props => [gover ];
}


