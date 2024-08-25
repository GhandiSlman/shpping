import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_field_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/presentation/screens/step_four_add_order_screen.dart';
import 'package:logistech/test.dart';

class StepThreeAddOrderScreen extends StatefulWidget {
  final String sourceOffice;
  final String destinationOffice;
  final String paymentMethod;
  final String paymentType;
  final String name;
  final String nationalNum;
  final String phoneNum;
  final String family;
  final String motherName;
  final String long;
  final String lat;

  const StepThreeAddOrderScreen({
    super.key,
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
  });

  @override
  State<StepThreeAddOrderScreen> createState() =>
      _StepThreeAddOrderScreenState();
}

class _StepThreeAddOrderScreenState extends State<StepThreeAddOrderScreen> {
  TextEditingController receiverNameController = TextEditingController();
  TextEditingController phoneNumberController =
      TextEditingController(text: "+963");

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Step Three',
        leading: IconBtnWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                    text:
                        'Third step, enter receiver information to move to the last step.',
                    color: AppColor.secoundPrimary,
                    fontSize: 15.sp,
                  ),
                  20.verticalSpace,
                  TextFieldWidget(
                    controller: receiverNameController,
                    hintText: 'Receiver name',
                    validator: ValidationBuilder().minLength(3).build(),
                  ),
                  10.verticalSpace,
                  TextFieldWidget(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    hintText: 'Phone number',
                    validator: (value) {
                      if (value != null && value.length != 13) {
                        return 'Phone number must be 10 digits long (excluding +963)';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (!value.startsWith("+963")) {
                        phoneNumberController.text = "+963";
                        phoneNumberController.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                              offset: phoneNumberController.text.length),
                        );
                      }
                    },
                  ),
                  50.verticalSpace,
                  BtnWidget(
                    text: 'Next',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(Slider2(
                          Page: StepFourAddOrderScreen(
                            destinationOffice: widget.destinationOffice,
                            family: widget.family,
                            lat: widget.lat,
                            long: widget.long,
                            motherName: widget.motherName,
                            name: widget.name,
                            nationalNum: widget.nationalNum,
                            paymentMethod: widget.paymentMethod,
                            paymentType: widget.paymentType,
                            phoneNum: widget.phoneNum,
                            receiverName: receiverNameController.text,
                            receiverPhoneNum: phoneNumberController.text,
                            sourceOffice: widget.sourceOffice,
                          ),
                        ));
                      }
                    },
                    color: AppColor.primary,
                    textColor: AppColor.whiteColor,
                    width: 120.w,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
