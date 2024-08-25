// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:logistech/core/utils/app_consts.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/no_internet.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/order/presentation/bloc/order/order_bloc.dart';
import 'package:logistech/fetures/order/presentation/widgets/shimmer_location.dart';

class LocationPickerScreen extends StatelessWidget {
  final String? sourceOfficeId;
  final String? orderId;
  const LocationPickerScreen({super.key, this.sourceOfficeId, this.orderId});

  @override
  Widget build(BuildContext context) {
    box.read('role') == 'client'
        ? context
            .read<OrderBloc>()
            .add(GetLocationEvent(id: sourceOfficeId.toString()))
        : context
            .read<OrderBloc>()
            .add(GeUsertLocationEvent(id: orderId.toString()));

    return WillPopScope(
      onWillPop: () async {
        context.read<OrderBloc>().add(GetUserOrderEvent());
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Location',
          leading: IconBtnWidget(
            onPressed: () {
              context.read<OrderBloc>().add(GetUserOrderEvent());
              Navigator.of(context).pop();
            },
            icon: const Icon(Iconsax.arrow_left_2),
          ),
        ),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is GetOfficeLocationLoadingState ||
                state is GetOrderLocationLoadingState) {
              return const ShimmerLocation();
            } else if (state is GetOfficeLocationLoadedState ||
                state is GetOrderLocationLoadedState ||
                state is SelectLocationOnMapState) {
              LatLng? location;
              if (state is SelectLocationOnMapState) {
                location = state.selectedLocatoin;
              } else {
                location = LatLng(
                  double.tryParse(box.read('lat').toString()) ?? 0.0,
                  double.tryParse(box.read('long').toString()) ?? 0.0,
                );
              }

              return FlutterMap(
                options: MapOptions(
                  initialCenter: location,
                  onTap: (tapPosition, point) {
                    BlocProvider.of<OrderBloc>(context)
                        .add(SelectLocationOnMapEvent(point));
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: location,
                        width: 40.w,
                        height: 40.h,
                        child: Icon(
                          Iconsax.location5,
                          color: AppColor.primary,
                          size: 40.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is GetOfficeLocationErrorgState ||
                state is GetOrderLocationErrorgState) {
              return NoInternetWidget(onTap: () {
                if (box.read('role') == 'client') {
                  context
                      .read<OrderBloc>()
                      .add(GetLocationEvent(id: sourceOfficeId.toString()));
                } else {
                  context.read<OrderBloc>();
                }
              });
            } else {
              return const Text('An error occurred.');
            }
          },
        ),
        floatingActionButton: box.read('role') == 'client'
            ? FloatingActionButton(
                backgroundColor: AppColor.primary,
                onPressed: () {
                  final OrderBloc orderBloc =
                      BlocProvider.of<OrderBloc>(context);
                  final LatLng selectedLocation = orderBloc.selectedLocation ??
                      LatLng(
                        double.tryParse(box.read('lat').toString()) ?? 0.0,
                        double.tryParse(box.read('long').toString()) ?? 0.0,
                      );

                  Navigator.of(context).pop({
                    'latitude': selectedLocation.latitude.toString(),
                    'longitude': selectedLocation.longitude.toString(),
                  });
                },
                child: Icon(
                  Icons.check,
                  color: AppColor.whiteColor,
                ),
              )
            : null,
      ),
    );
  }
}
