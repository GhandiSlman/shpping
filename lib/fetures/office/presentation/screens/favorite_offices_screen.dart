import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/images.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/no_internet.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/bloc/favorite_state.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/favorite_event.dart';
import 'package:logistech/fetures/office/presentation/widgets/office_card.dart';
import 'package:logistech/fetures/office/presentation/widgets/shimmer_office_widget.dart';

class FavoriteOfficesScreen extends StatelessWidget {
  const FavoriteOfficesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteBloc>().add(GetFavoriteOfficesEvent());
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favorite offices',
        leading: IconBtnWidget(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child:
            BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
          if (state is GetFavoriteOfficeLoadingState) {
            return ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ShimmerOfficeWidget();
              },
              separatorBuilder: (BuildContext context, int index) {
                return 10.verticalSpace;
              },
            );
          } else if (state is GetFavoriteOfficeLoadedState) {
            return state.favoriteOfficesModel.isEmpty
                ? Center(
                    child: Image.asset(AppImages.noDataImage),
                  )
                : AnimationLimiter(
                    child: ListView.separated(
                      itemCount: state.favoriteOfficesModel.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 1000),
                            child: SlideAnimation(
                              verticalOffset: 100.0,
                              child: FadeInAnimation(
                                child: OfficeCard(
                                  index: index,
                                  getFavoriteOfficeLoadedState: state,
                                  city: state.favoriteOfficesModel[index].city,
                                  address:
                                      state.favoriteOfficesModel[index].address,
                                  phone:
                                      state.favoriteOfficesModel[index].phone,
                                  id: state.favoriteOfficesModel[index].id
                                      .toString(),
                                ),
                              ),
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 10.verticalSpace;
                      },
                    ),
                  );
          } else if (state is GetFavoriteOfficeErrorState) {
            return NoInternetWidget(onTap: () {
              context.read<FavoriteBloc>().add(GetFavoriteOfficesEvent());
            });
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
