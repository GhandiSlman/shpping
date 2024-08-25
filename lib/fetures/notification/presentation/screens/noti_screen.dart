import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/no_internet.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/notification/presentation/bloc/notification_bloc.dart';
import 'package:logistech/fetures/notification/presentation/widgets/no_noti.dart';
import 'package:logistech/fetures/notification/presentation/widgets/noti_shimmer.dart';
import 'package:logistech/fetures/notification/presentation/widgets/notification_card.dart';
import 'package:logistech/fetures/order/presentation/bloc/home/home_bloc.dart'; // Import HomeBloc to dispatch TabChangeEvent

class NotiScreen extends StatelessWidget {
  const NotiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NotificationBloc>().add(GetNotiEvent());
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        leading: box.read('role') == 'client'
            ? IconBtnWidget(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Iconsax.arrow_left_2),
              )
            : null,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is GetNotiLoadingState) {
              return ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const NotiShimmer();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return 10.verticalSpace;
                },
              );
            } else if (state is GetNotiLoadedState) {
              if (state.allNoti.isEmpty) {
                return const NoNotiWidget();
              } else {
                return AnimationLimiter(
                  child: ListView.builder(
                    itemCount: state.allNoti.length,
                    itemBuilder: (context, index) {
                      // Access the title for the current notification at index
                      box.read('role') == 'client' &&
                          state.allNoti[index].title! == 'Status Update';

                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                        child: SlideAnimation(
                          verticalOffset: 100.0,
                          child: FadeInAnimation(
                            child: GestureDetector(
                              onTap: () {
                                if (box.read('role') == 'delivery' &&
                                    state.allNoti[index].title! ==
                                        'Status Update') {
                                  null;
                                } else {
                                  context
                                      .read<HomeBloc>()
                                      .add(const TabChangeEvent(index: 0));
                                }
                              },
                              behavior: HitTestBehavior.translucent,
                              child: NotiCard(
                                index: index,
                                title: state.allNoti[index].title!,
                                subTitle: state.allNoti[index].message!,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            } else if (state is GetNotiErrorState) {
              return NoInternetWidget(
                onTap: () {
                  context.read<NotificationBloc>().add(GetNotiEvent());
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
