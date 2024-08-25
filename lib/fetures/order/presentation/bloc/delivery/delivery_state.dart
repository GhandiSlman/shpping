part of 'delivery_bloc.dart';

sealed class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object> get props => [];
}

final class DeliveryInitial extends DeliveryState {}

class DeliveryStatusLoadingState extends DeliveryState {}

class DeliveryStatusLoadedState extends DeliveryState {
  final DeliveryStatusModel deliveryStatusModel;
  const DeliveryStatusLoadedState({required this.deliveryStatusModel});
  @override
  List<Object> get props => [deliveryStatusModel];
}

class DeliveryStatusErrorState extends DeliveryState {}
