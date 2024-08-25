import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/no_data_widget.dart';
import 'package:logistech/core/widget/no_internet.dart';
import 'package:logistech/fetures/order/presentation/bloc/order/order_bloc.dart';
import 'package:logistech/fetures/order/presentation/widgets/order_user_card.dart';
import 'package:logistech/fetures/order/presentation/widgets/shimmer_order_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
        context.read<OrderBloc>().add(GetUserOrderEvent());
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My orders',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
          if (state is GetUserOrdersLoadingState) {
            return const ShimmerOrderWidget();
          } else if (state is GetUserOrdersLoadedState) {
            return state.userOrders.isEmpty
                ? const NoDataWidget()
                : AnimationLimiter(
                    child: ListView.separated(
                      itemCount: state.userOrders.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1000),
                          child: OrderUserCard(
                            index: index,
                            price: state.userOrders[index].totalPrice!,
                            payMethod: state.userOrders[index].paymentMethod!,
                            payType: state.userOrders[index].paymentType!,
                            status: state.userOrders[index].status!,
                            sourceOfficeId:
                                state.userOrders[index].fromOfficeId.toString(),
                            orderId: state.userOrders[index].id.toString(),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 10.verticalSpace;
                      },
                    ),
                  );
          } else if (state is GetUserOrdersErrorState) {
            return NoInternetWidget(onTap: () {
              context.read<OrderBloc>().add(GetUserOrderEvent());
            });
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
