import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/loading_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/presentation/bloc/add_delete_more_goods/add_delete_more_goods_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/order/order_bloc.dart';
import 'package:logistech/fetures/order/data/model/add_order_model.dart';
import 'package:logistech/fetures/order/presentation/screens/payment_screen.dart';
import 'package:logistech/fetures/order/presentation/widgets/goods_form.dart';
import 'package:logistech/test.dart';

class StepFourAddOrderScreen extends StatelessWidget {
  final String sourceOffice;
  final String destinationOffice;
  final String paymentMethod;
  final String paymentType;
  final String name;
  final String nationalNum;
  final String phoneNum;
  final String family;
  final String motherName;
  final String lat;
  final String long;
  final String receiverName;
  final String receiverPhoneNum;

  const StepFourAddOrderScreen(
      {super.key,
      required this.sourceOffice,
      required this.destinationOffice,
      required this.paymentMethod,
      required this.paymentType,
      required this.name,
      required this.nationalNum,
      required this.phoneNum,
      required this.family,
      required this.motherName,
      required this.lat,
      required this.long,
      required this.receiverName,
      required this.receiverPhoneNum});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Finally',
        leading: IconBtnWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: BlocBuilder<AddDeleteMoreGoodsBloc, AddDeleteMoreGoodsState>(
        builder: (context, state) {
          final goodsList = state is GoodsUpdatedState ? state.goodsList : [{}];

          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text:
                            'Last step, enter the goods that you want to send.',
                        color: AppColor.secoundPrimary,
                        fontSize: 15.sp,
                      ),
                      20.verticalSpace,
                      ...goodsList.asMap().entries.map((good) {
                        int index = good.key;

                        return GoodsForm(index: index, goodsList: goodsList);
                      }),
                      50.verticalSpace,
                      BlocListener<OrderBloc, OrderState>(
                        listener: (context, state) {
                          if (state is CreateOrderLoadedState) {
                            Navigator.of(context).push(
                              Slider2(Page: const PayMentScreen()),
                            );
                          }
                        },
                        child: BlocBuilder<OrderBloc, OrderState>(
                            builder: (context, state) {
                          return state is CreateOrderLoadingState
                              ? LoadingWidget(
                                  color: AppColor.primary,
                                  border: Border.all(),
                                )
                              : BtnWidget(
                                  text: 'Send order',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      context
                                          .read<OrderBloc>()
                                          .add(CreateOrderEvent(
                                            createOrderModel: CreateOrderModel(
                                              fromOfficeId: sourceOffice,
                                              toOfficeId: destinationOffice,
                                              paymentMethod: paymentMethod,
                                              paymentType: paymentType,
                                              sUser: name,
                                              sNationalId: nationalNum,
                                              sPhoneNumber: phoneNum,
                                              sMotherName: motherName,
                                              lat: lat,
                                              long: long,
                                              sFamilyRegistration: family,
                                              rUser: receiverName,
                                              rPhoneNumber: receiverPhoneNum,
                                              incomingGoods: goodsList
                                                  .map((good) => IncomingGoods(
                                                        goodName: good['name'],
                                                        quantity:
                                                            good['quantity'],
                                                        weight: good['weight'],
                                                      ))
                                                  .toList(),
                                            ),
                                          ));
                                    }
                                  },
                                  color: AppColor.primary,
                                  textColor: AppColor.whiteColor,
                                  width: double.infinity,
                                );
                        }),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
