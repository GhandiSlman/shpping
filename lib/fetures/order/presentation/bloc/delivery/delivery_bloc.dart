import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/order/data/model/delivery_status_model.dart';
import 'package:logistech/fetures/order/data/repo/order_repo.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  OrderRepo orderRepo;
  DeliveryBloc(this.orderRepo) : super(DeliveryInitial()) {
    on<GetDeliveryStatusEvent>((event, emit) async {
      emit(DeliveryStatusLoadingState());
      final result = await orderRepo.getDeleiveryStatus(
          deliveryStatusModel: DeliveryStatusModel());
      if (result is DataSuccess<DeliveryStatusModel>) {
        emit(DeliveryStatusLoadedState(deliveryStatusModel: result.data!));
      } else if (result is DataFailed) {
        emit(DeliveryStatusErrorState());
      }
    });
  }
}
