// ignore_for_file: must_be_immutable

part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

//Order
final class GetOrderLoadingState extends OrderState {}

final class GetOrderLoadedState extends OrderState {}

final class GetOrderErrorState extends OrderState {}

//user orders

final class GetUserOrdersLoadingState extends OrderState {}

final class GetUserOrdersLoadedState extends OrderState {
  final List<GetUserOrdersModelData> userOrders;

  const GetUserOrdersLoadedState({required this.userOrders});
  @override
  List<Object> get props => [userOrders];
}

final class GetUserOrdersErrorState extends OrderState {
  final String errorMessage;
  const GetUserOrdersErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class CreateOrderLoadingState extends OrderState {}

class CreateOrderLoadedState extends OrderState {}

class CreateOrderErrorState extends OrderState {}

//payMent

class PayMentLoadingState extends OrderState {}

class PayMentLoadedState extends OrderState {}

class PayMentErrorState extends OrderState {}

//locationnn

class GetOfficeLocationLoadingState extends OrderState {}

class GetOfficeLocationLoadedState extends OrderState {}

class GetOfficeLocationErrorgState extends OrderState {}

class GetOrderLocationLoadingState extends OrderState {}

class GetOrderLocationLoadedState extends OrderState {}

class GetOrderLocationErrorgState extends OrderState {}

class UpdateOrderStatusLoadingState extends OrderState {}

class UpdateOrderStatusLoadedState extends OrderState {}

class UpdateOrderStatusErrorState extends OrderState {}

//location select
class SelectLocationOnMapState extends OrderState {
  LatLng selectedLocatoin;
  SelectLocationOnMapState(this.selectedLocatoin);
  @override
  List<Object> get props => [selectedLocatoin];
}
