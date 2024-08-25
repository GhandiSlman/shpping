import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/no_data_widget.dart';
import 'package:logistech/core/widget/no_internet.dart';
import 'package:logistech/fetures/office/presentation/widgets/custom_governorate_dialog.dart';
import 'package:logistech/fetures/office/presentation/bloc/office/offices_bloc.dart';
import 'package:logistech/fetures/office/presentation/widgets/office_card.dart';
import 'package:logistech/fetures/office/presentation/widgets/shimmer_office_widget.dart';

class OfficesScreen extends StatelessWidget {
  const OfficesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OfficesBloc>().add(GetAllOfficesEvent());
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Offices',
          trailing: [
            CustomGovernorateDialog(),
            // CustomPopMenu(items: [
            //   PopupMenuItem(
            //     onTap: () {
            //       Navigator.of(context)
            //           .push(Slider3(Page: const FavoriteOfficesScreen()));
            //     },
            //     child: const Text('Favorite offices            '),
            //   ),
            // ]),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child:
              BlocBuilder<OfficesBloc, OfficesState>(builder: (context, state) {
            if (state is GetOfficesLoadingState ||
                state is GetFilterOfficesLoadingState) {
              return ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const ShimmerOfficeWidget();
                },
                separatorBuilder: (context,index) {
                  return 10.verticalSpace;
                },
              );
            } else if (state is GetOfficesLoadedState) {
              return state.offices.isEmpty
                  ? const NoDataWidget()
                  : AnimationLimiter(
                    
                      child: ListView.separated(
                         
                        itemCount: state.offices.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1000),
                              child: SlideAnimation(
                                verticalOffset: 100.0,
                                child: FadeInAnimation(
                                  child: OfficeCard(
                                    index: index,
                                    officesState: state,
                                    city: state.offices[index].city,
                                    address: state.offices[index].address,
                                    phone: state.offices[index].phone,
                                    id: state.offices[index].id.toString(),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context,index) {
                          return 10.verticalSpace;
                        },
                      ),
                    );
            } else if (state is GetFilterOfficesLoadedState) {
              return AnimationLimiter(
                child: ListView.separated(
                  itemCount: state.offices.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                        child: SlideAnimation(
                          verticalOffset: 100.0,
                          child: FadeInAnimation(
                            child: OfficeCard(
                              index: index,
                              getFilterOfficesLoadedState: state,
                              city: state.offices[index].city,
                              address: state.offices[index].address,
                              phone: state.offices[index].phone,
                              id: state.offices[index].id.toString(),
                            ),
                          ),
                        ));
                  },
                  separatorBuilder: (context,index) {
                    return 10.verticalSpace;
                  },
                ),
              );
            } else if (state is GetOfficesErrorState) {
              return NoInternetWidget(
                onTap: () {
                  context.read<OfficesBloc>().add(GetAllOfficesEvent());
                },
              );
            }
            return const SizedBox();
          }),
        ));
  }
}
