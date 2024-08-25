import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/custom_drop_down.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_btn.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_field_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/presentation/bloc/add_delete_more_goods/add_delete_more_goods_bloc.dart';

class GoodsForm extends StatelessWidget {
  const GoodsForm({
    super.key,
    required this.index,
    required this.goodsList,
  });

  final int index;
  final List<Map> goodsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Item ${index + 1}',
          fontSize: 15.sp,
          color: AppColor.blackColor,
        ),
        10.verticalSpace,
        TextFieldWidget(
          hintText: 'Good name',
          validator:
              ValidationBuilder().minLength(2).build(),
          onChanged: (value) {
            goodsList[index]['name'] = value;
          },
          onSaved: (value) {
            goodsList[index]['name'] = value;
          },
        ),
        10.verticalSpace,
        TextFieldWidget(
          keyboardType: TextInputType.number,
          hintText: 'Quantity',
          validator:
              ValidationBuilder().minLength(1).build(),
          onChanged: (value) {
            goodsList[index]['quantity'] = value;
          },
          onSaved: (value) {
            goodsList[index]['quantity'] = value;
          },
        ),
        10.verticalSpace,
        CustomDropDown(
          items: [
            'under_5',
            'under_20',
            'under_40',
            'under_60'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hintText: 'Weight',
          value: goodsList[index][
              'weight'], // Ensure the selected value is maintained
          onChanged: (value) {
            goodsList[index]['weight'] = value;
          },
          onSaved: (value) {
            goodsList[index]['weight'] = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a weight';
            }
            return null;
          },
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            goodsList.length > 1 &&
                    index == goodsList.length - 1
                ? IconButton(
                    icon: const Icon(Iconsax.trash,
                        color: Colors.red),
                    onPressed: () {
                      context
                          .read<AddDeleteMoreGoodsBloc>()
                          .add(RemoveGoodsEvent(
                              index: goodsList.length - 1));
                    },
                  )
                : const SizedBox(),
            index == goodsList.length - 1
                ? TextBtn(
                    onPressed: () {
                      context
                          .read<AddDeleteMoreGoodsBloc>()
                          .add(AddMoreGoodsEvent());
                    },
                    color: AppColor.secoundPrimary,
                    fontSize: 15.sp,
                    text: 'Add more goods',
                  )
                : const SizedBox(),
          ],
        ),
        goodsList.length > 1
            ? const Divider()
            : const SizedBox(),
      ],
    );
  }
}
