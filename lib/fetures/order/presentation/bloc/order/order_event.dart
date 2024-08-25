// ignore_for_file: camel_case_types

part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class GetUserOrderEvent extends OrderEvent {}

class CreateOrderEvent extends OrderEvent {
  final CreateOrderModel createOrderModel;

  const CreateOrderEvent({required this.createOrderModel});

  @override
  List<Object> get props => [createOrderModel];
}

class PayMentEvent extends OrderEvent {
  final PayMentModel payMentModel;
  const PayMentEvent({required this.payMentModel});
  @override
  List<Object> get props => [payMentModel];
}

class GetLocationEvent extends OrderEvent {
  final String id;
  const GetLocationEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class GeUsertLocationEvent extends OrderEvent {
  final String id;
  const GeUsertLocationEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class updateOrderStateEvent extends OrderEvent {
  final String id;
  const updateOrderStateEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class SelectLocationOnMapEvent extends OrderEvent {
  final LatLng selectedLocatoin;
  const SelectLocationOnMapEvent(this.selectedLocatoin);
  @override
  List<Object> get props => [selectedLocatoin];

}
