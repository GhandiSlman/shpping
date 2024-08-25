import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/utils/app_consts.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/fetures/auth/presentation/screens/profile_screen.dart';
import 'package:logistech/fetures/notification/presentation/screens/noti_screen.dart';
import 'package:logistech/fetures/office/presentation/screens/all_offices_screen.dart';
import 'package:logistech/fetures/order/presentation/bloc/home/home_bloc.dart';
import 'package:logistech/fetures/order/presentation/screens/cmopany_screen.dart';
import 'package:logistech/fetures/order/presentation/screens/delivery_status_screen.dart';
import 'package:logistech/fetures/order/presentation/screens/orders_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screensUser = [
      const CompanyScreen(),
      const OrderScreen(),
      const OfficesScreen(),
      const ProfileScreen(),
    ];

    final List<Widget> screensDelivery = [
      const OrderScreen(),
      const DeliveryStatusScreen(),
      const NotiScreen(),
      const ProfileScreen(),
    ];

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return Scaffold(
            body: 
           
            
            box.read('role') == 'client'
                ? screensUser[state.index]
                : screensDelivery[state
                    .index], // Use the screen from the list based on the current index
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: GNav(
                  backgroundColor: AppColor.primary.withOpacity(0.2),
                  color: Colors.black,
                  activeColor: AppColor.primary,
                  padding: EdgeInsets.all(16.h),
                  selectedIndex: state.index,
                  onTabChange: (index) {
                    context.read<HomeBloc>().add(TabChangeEvent(index: index));
                  },
                  tabs: box.read('role') == 'client'
                      ? [
                          const GButton(
                            icon: Iconsax.home,
                          ),
                          const GButton(
                            icon: Iconsax.box,
                          ),
                          const GButton(
                            icon: Iconsax.building,
                          ),
                          const GButton(
                            icon: Iconsax.user,
                          ),
                        ]
                      : [
                          const GButton(
                            icon: Iconsax.box,
                          ),
                          const GButton(
                            icon: Iconsax.status,
                          ),
                          const GButton(
                            icon: Iconsax.notification4,
                          ),
                           const GButton(
                            icon: Iconsax.user,
                          ),
                        ]),
            ),
            
          );
        }
        return const SizedBox();
      },
    );
  }
}
