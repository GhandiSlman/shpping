import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:logistech/core/utils/app_consts.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/core/data/data_state.dart';

import 'package:logistech/core/widget/custom_toast.dart';
import 'package:logistech/fetures/order/data/model/location_model.dart';
import 'package:logistech/fetures/order/data/model/payment_model.dart';
import 'package:logistech/fetures/order/data/model/update_order_status_model.dart';
import 'package:logistech/fetures/order/data/model/user_location_model.dart';
import 'package:logistech/fetures/order/data/repo/order_repo.dart';
import 'package:logistech/fetures/order/data/model/add_order_model.dart';
import 'package:logistech/fetures/order/data/model/get_user_order_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepo orderRepo;
  LatLng? selectedLocation;
  OrderBloc(this.orderRepo) : super(OrderInitial()) {
    on<GetUserOrderEvent>((event, emit) async {
      emit(GetUserOrdersLoadingState());
      final result =
          await orderRepo.getOrder(getOrderModel: GetUserOrdersModel());
      if (result is DataSuccess<GetUserOrdersModel>) {
        emit(GetUserOrdersLoadedState(userOrders: result.data!.data!));
      } else if (result is DataFailed) {
        emit(GetUserOrdersErrorState(errorMessage: result.errorMessage!));
      }
    });

    on<CreateOrderEvent>((event, emit) async {
      emit(CreateOrderLoadingState());
      final DataState result =
          await orderRepo.createOrder(createOrderModel: event.createOrderModel);
      if (result is DataSuccess<GetOrderModel>) {
        emit(CreateOrderLoadedState());
        box.write('order_id', result.data!.data!.order!.id!);
        box.write('price', result.data!.data!.order!.totalPrice!);
        CustomToast.showToast(
          message: 'Success, your order will send safety.',
          backgroundColor: AppColor.greenColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      } else if (result is DataFailed) {
        emit(CreateOrderErrorState());
        CustomToast.showToast(
          message: result.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });
    on<PayMentEvent>((event, emit) async {
      emit(PayMentLoadingState());
      final result = await orderRepo.payMent(
          payMentModel: PayMentModel(order_id: event.payMentModel.order_id));
      if (result is DataSuccess<GetPayMentModel>) {
        emit(PayMentLoadedState());
      } else if (result is DataFailed) {
        emit(PayMentErrorState());
        CustomToast.showToast(
          message: result.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 5,
        );
      }
    });
    on<GetLocationEvent>((event, emit) async {
      emit(GetOfficeLocationLoadingState());
      final result = await orderRepo.getOfficeLocation(
          locationModel: LocationModel(), officeId: event.id.toString());
      if (result is DataSuccess<LocationModel>) {
        emit(GetOfficeLocationLoadedState());
        await box.write('long', result.data!.longitude);
        await box.write('lat', result.data!.latitude);
      } else if (result is DataFailed) {
        emit(GetOfficeLocationErrorgState());
      }
    });
    on<GeUsertLocationEvent>((event, emit) async {
      emit(GetOrderLocationLoadingState());
      final result = await orderRepo.getUserLocation(
          getUserOrdersModel: UserLocatoinModel(), orderId: event.id);
      if (result is DataSuccess<UserLocatoinModel>) {
        emit(GetOrderLocationLoadedState());
      } else if (result is DataFailed) {
        emit(GetOrderLocationErrorgState());
      }
    });
    on<updateOrderStateEvent>((event, emit) async {
      emit(UpdateOrderStatusLoadingState());
      final result = await orderRepo.updateOrder(orderId: event.id , updateOrderStatusModel: UpdateOrderStatusModel());
      if (result is DataSuccess<UpdateOrderStatusModel>) {
        emit(UpdateOrderStatusLoadedState());
        add(GetUserOrderEvent());
        CustomToast.showToast(
          message: result.data!.message!,
          backgroundColor: AppColor.greenColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      } else if (result is DataFailed<UpdateOrderStatusModel>) {
        emit(UpdateOrderStatusErrorState());
        add(GetUserOrderEvent());
        CustomToast.showToast(
          message: result.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });
    on<SelectLocationOnMapEvent>((event, emit) {
      selectedLocation = event.selectedLocatoin;
      emit(SelectLocationOnMapState(selectedLocation!));
    });
  }
}
