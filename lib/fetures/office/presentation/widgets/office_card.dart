// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/core/widget/my_custom_clip.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/bloc/favorite_state.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/favorite_event.dart';
import 'package:logistech/fetures/office/presentation/bloc/office/offices_bloc.dart';
import 'package:logistech/fetures/order/presentation/screens/location_screen.dart';
import 'package:logistech/fetures/order/presentation/screens/step_one_add_order_screen.dart';
import 'package:logistech/test.dart';

class OfficeCard extends StatelessWidget {
  final GetOfficesLoadedState? officesState;
  final GetFavoriteOfficeLoadedState? getFavoriteOfficeLoadedState;
  final GetFilterOfficesLoadedState? getFilterOfficesLoadedState;
  final String? city;
  final String? address;
  final String? phone;
  final String? id;
  final int index;

  const OfficeCard({
    this.officesState,
    this.getFavoriteOfficeLoadedState,
    this.getFilterOfficesLoadedState,
    this.city,
    this.address,
    this.phone,
    this.id,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final office =
    // final favoriteOffices =
    //     getFavoriteOfficeLoadedState!.favoriteOfficesModel[index];

    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.lightGrey),
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColor.superLightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    10.horizontalSpace,
                    SizedBox(
                      width: 200.w,
                      child: AutoSizeText(
                        city!,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        minFontSize: 20.sp,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColor.primary),
                      ),
                    ),
                    BlocBuilder<FavoriteBloc, FavoriteState>(
                        builder: (context, state) {
                      bool isFavorite = false;

                      // Check if the state is FavoriteLoadedState and update the favorite status
                      if (state is FavoriteLoadedState &&
                          state.favorite.status != null) {
                        isFavorite = state.favorite.status!;
                        return IconButton(
                          tooltip:  isFavorite ? 'Unfavorite' :
                              'Favorite',
                          onPressed: () {
                            BlocProvider.of<FavoriteBloc>(context)
                                .add(AddRemoveFavoriteEvent(officesState!.offices[index].id!));
                          },
                          icon: isFavorite
                              ? Icon(
                                  Iconsax.lovely5,
                                  color: AppColor.redColor,
                                )
                              : Icon(
                                  Iconsax.lovely,
                                  color: AppColor.redColor,
                                ),
                        );
                      }
                      return const SizedBox();
                    })
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            5.horizontalSpace,
                            Icon(
                              Iconsax.location,
                              color: AppColor.primary,
                            ),
                            5.horizontalSpace,
                            SizedBox(
                              width: 200.w,
                              child: AutoSizeText(
                                address!,
                                maxLines: 1,
                                minFontSize: 15.sp,
                                maxFontSize: 15.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            5.horizontalSpace,
                            Icon(
                              Iconsax.mobile,
                              color: AppColor.primary,
                            ),
                            5.horizontalSpace,
                            SizedBox(
                              width: 200.w,
                              child: AutoSizeText(
                                phone!,
                                maxLines: 1,
                                minFontSize: 15.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StepOneAddOrderScreen(
                                  officeId: id!.toString(),
                                )));
                      },
                      child: ClipPath(
                        clipper: MyCustomClip(
                            curveHeight: 10.0,
                            clipFromTop: false,
                            clipFromRight: true),
                        child: Container(
                          height: 32.h,
                          width: 260.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                            ),
                            color: AppColor.primary,
                          ),
                          child: Center(
                            child: TextWidget(
                              text: 'Add Order',
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    Slider2(Page: LocationPickerScreen(sourceOfficeId: id)));
              },
              child: ClipPath(
                clipper: MyCustomClip(
                    curveHeight: 50.0, clipFromTop: true, clipFromRight: false),
                child: Container(
                  height: 150.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                    ),
                    color: AppColor.primary,
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.location,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
