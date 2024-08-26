import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/core/utils/app_consts.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/core/widget/custom_toast.dart';
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
        box.write('status', result.data!.isOnline!);
        emit(DeliveryStatusLoadedState(deliveryStatusModel: result.data!));
      } else if (result is DataFailed<DeliveryStatusModel>) {
        emit(DeliveryStatusErrorState());
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
  }
}
