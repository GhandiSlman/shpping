// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/custom_drop_down.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/shimmer_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_btn.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/office/presentation/bloc/office/offices_bloc.dart';
import 'package:logistech/fetures/order/presentation/screens/step_two_add_order_screen.dart';
import 'package:logistech/test.dart';

class StepOneAddOrderScreen extends StatelessWidget {
  final String? officeId;
  StepOneAddOrderScreen({super.key, this.officeId});

  final TextEditingController sourceOfficeController = TextEditingController();
  final TextEditingController destinationOfficeController =
      TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  final TextEditingController paymentTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<OfficesBloc>().add(GetAllOfficesEvent());
    officeId != null ? sourceOfficeController.text = officeId! : null;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add order',
        leading: IconBtnWidget(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                    text:
                        'First step, enter the general information to move to next step.',
                    color: AppColor.secoundPrimary,
                    fontSize: 15.sp,
                  ),
                  20.verticalSpace,
                  BlocBuilder<OfficesBloc, OfficesState>(
                      builder: (context, state) {
                    if (state is GetOfficesLoadingState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ShimmerWidget(
                            height: 60.h,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 10.verticalSpace;
                        },
                      );
                    } else if (state is GetOfficesLoadedState) {
                      final offices = state.offices.map((offices) {
                        return DropdownMenuItem(
                          value: offices.id.toString(),
                          child: Text(offices.city!),
                        );
                      });

                      return Column(
                        children: [
                          CustomDropDown(
                            value: (sourceOfficeController.text.isEmpty
                                ? null
                                : sourceOfficeController.text),
                            items: offices.toList(),
                            hintText: 'Select source office',
                            onChanged: (val) {
                              sourceOfficeController.text = val!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a source office';
                              }
                              return null;
                            },
                          ),
                          10.verticalSpace,
                          CustomDropDown(
                            value: destinationOfficeController.text.isEmpty
                                ? null
                                : destinationOfficeController.text,
                            items: offices.toList(),
                            hintText: 'Select destination office',
                            onChanged: (val) {
                              destinationOfficeController.text = val;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a destination office';
                              }
                              return null;
                            },
                          ),
                        ],
                      );
                    } else if (state is GetOfficesErrorState) {
                      return Center(
                        child: Container(
                          width: double.infinity,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColor.redColor.withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoSizeText(
                                ' ${state.message}',
                                style: TextStyle(
                                  color: AppColor.redColor,
                                  fontSize: 15.sp,
                                ),
                                maxLines: 1,
                                minFontSize: 5.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextBtn(
                                onPressed: () {
                                  BlocProvider.of<OfficesBloc>(context)
                                      .add(GetAllOfficesEvent());
                                },
                                color: AppColor.blackColor,
                                fontSize: 15.sp,
                                text: 'Reload',
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Container(
                          width: double.infinity,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColor.redColor.withOpacity(0.3),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: 'Something went wrong, please try again.',
                              color: AppColor.redColor,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                  10.verticalSpace,
                  CustomDropDown(
                    items: ['Cash', 'Electronic payment'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hintText: 'Payment method',
                    onChanged: (val) {
                      paymentMethodController.text = val;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a payment method';
                      }
                      return null;
                    },
                  ),
                  10.verticalSpace,
                  CustomDropDown(
                    items: ['Pre paid', 'Post paid'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hintText: 'Payment type',
                    onChanged: (val) {
                      paymentTypeController.text = val;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a payment type';
                      }
                      return null;
                    },
                  ),
                  50.verticalSpace,
                  BtnWidget(
                    text: 'Next',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(Slider2(
                          Page: StepTwoAddOrderScreen(
                            sourceOffice: sourceOfficeController.text,
                            destinationOffice: destinationOfficeController.text,
                            paymentMethod: paymentMethodController.text,
                            paymentType: paymentTypeController.text,
                          ),
                        ));
                      }
                    },
                    color: AppColor.primary,
                    textColor: AppColor.whiteColor,
                    width: 120.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
