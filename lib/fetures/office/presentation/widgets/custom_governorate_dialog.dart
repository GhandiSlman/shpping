import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/no_data_widget.dart';
import 'package:logistech/core/widget/no_internet.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/office/presentation/bloc/governorate/governorate_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/office/offices_bloc.dart';
import 'package:logistech/fetures/office/presentation/widgets/shimmer_gover_widget.dart';

class CustomGovernorateDialog extends StatelessWidget {
  const CustomGovernorateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_circle_down_rounded),
      onPressed: () {
        context.read<GovernorateBloc>().add(GetGovernoratesEvent());

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocBuilder<OfficesBloc, OfficesState>(
                builder: (context, officeState) {
                  return AlertDialog(
                    backgroundColor: AppColor.whiteColor,
                    title: Column(
                      children: [
                        FittedBox(
                          child: SizedBox(
                            width: 150.h,
                            child: TextWidget(
                              text: 'Filter by governorate',
                              fontSize: 20.sp,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    content: BlocBuilder<GovernorateBloc, GovernorateState>(
                      builder: (context, state) {
                        if (state is GetGovernoratesLoadingState) {
                          return ListView.separated(
                            itemCount: 14,
                            itemBuilder: (context, index) {
                              return const ShimmerGoverWidget();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return 40.verticalSpace;
                            },
                          );
                        } else if (state is GetGovernoratesLoadedState) {
                          return state.governorates.isEmpty
                              ? const NoDataWidget()
                              : ListView.builder(
                                  itemCount: state.governorates.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        BlocProvider.of<OfficesBloc>(context)
                                            .add(
                                          GetAllFilterdOfficesEvent(
                                            gover:
                                                state.governorates[index].name!,
                                          ),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: ListTile(
                                        title: TextWidget(
                                            text: state
                                                .governorates[index].name!),
                                      ),
                                    );
                                  },
                                );
                        } else if (state is GetGovernoratesErrorState) {
                          return NoInternetWidget(onTap: () {
                            context
                                .read<GovernorateBloc>()
                                .add(GetGovernoratesEvent());
                          });
                        }

                        return const SizedBox();
                      },
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.r)),
                    ),
                  );
                },
              );
            });
      },
    );
  }
}
