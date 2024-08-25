import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/custom_toast.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_field_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/presentation/screens/location_screen.dart';
import 'package:logistech/fetures/order/presentation/screens/step_three_add_order_screen.dart';
import 'package:logistech/test.dart';

class StepTwoAddOrderScreen extends StatefulWidget {
  final String sourceOffice;
  final String destinationOffice;
  final String paymentMethod;
  final String paymentType;

  const StepTwoAddOrderScreen({
    super.key,
    required this.sourceOffice,
    required this.destinationOffice,
    required this.paymentMethod,
    required this.paymentType,
  });

  @override
  State<StepTwoAddOrderScreen> createState() => _StepTwoAddOrderScreenState();
}

class _StepTwoAddOrderScreenState extends State<StepTwoAddOrderScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalNumController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController familyController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  String? location; // Store selected location

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Step Two',
        leading: IconBtnWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextWidget(
                  text:
                      'Second step, enter your information to move to the next step.',
                  color: AppColor.secoundPrimary,
                  fontSize: 15.sp,
                ),
                20.verticalSpace,
                // Name Field
                TextFieldWidget(
                  controller: nameController,
                  hintText: 'Name',
                  validator: ValidationBuilder().minLength(3).build(),
                ),
                10.verticalSpace,
                // National Number Field
                TextFieldWidget(
                  controller: nationalNumController,
                  keyboardType: TextInputType.number,
                  hintText: 'National number',
                  validator: ValidationBuilder()
                      .minLength(
                          11, 'National number must be 11 characters long')
                      .maxLength(
                          11, 'National number must be 11 characters long')
                      .build(),
                ),
                10.verticalSpace,
                // Phone Number Field
                TextFieldWidget(
                  controller: phoneNumController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone number',
                  validator: ValidationBuilder()
                      .minLength(10, 'Phone number must be 10 characters long')
                      .maxLength(10, 'Phone number must be 10 characters long')
                      .build(),
                ),
                10.verticalSpace,
                // Family Registration Field
                TextFieldWidget(
                  controller: familyController,
                  hintText: 'Family registration',
                  validator: ValidationBuilder().minLength(2).build(),
                ),
                10.verticalSpace,
                // Mother Name Field
                TextFieldWidget(
                  controller: motherNameController,
                  hintText: 'Mother name',
                  validator: ValidationBuilder().minLength(3).build(),
                ),
                10.verticalSpace,
                // Location Picker Button
                GestureDetector(
                  onTap: () async {
                    var result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LocationPickerScreen(
                          sourceOfficeId: widget.sourceOffice,
                        ),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        location =
                            "${result['latitude']}, ${result['longitude']}";
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                      color: AppColor.primary.withOpacity(0.1),
                      border: Border.all(color: AppColor.primary),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.location5,
                          color: AppColor.primary,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          location ?? 'Select Location',
                          style: TextStyle(
                            color: AppColor.primary,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                50.verticalSpace,
                // Next Button
                BtnWidget(
                  text: 'Next',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (location == null) {
                        CustomToast.showToast(
                          message: 'Please select your location.',
                          backgroundColor: AppColor.redColor,
                          fontSize: 15.sp,
                          gravity: ToastGravity.BOTTOM,
                          textColor: AppColor.whiteColor,
                          toastDuration: 5,
                        );
                      } else {
                        Navigator.of(context).push(Slider2(
                          Page: StepThreeAddOrderScreen(
                            destinationOffice: widget.destinationOffice,
                            family: familyController.text,
                            lat: location!.split(', ')[0], // Latitude
                            long: location!.split(', ')[1], // Longitude
                            motherName: motherNameController.text,
                            name: nameController.text,
                            nationalNum: nationalNumController.text,
                            paymentMethod: widget.paymentMethod,
                            paymentType: widget.paymentType,
                            phoneNum: phoneNumController.text,
                            sourceOffice: widget.sourceOffice,
                          ),
                        ));
                      }
                    }
                  },
                  color: AppColor.primary,
                  textColor: AppColor.whiteColor,
                  width: 120.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
