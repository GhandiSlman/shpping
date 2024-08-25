import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logistech/fetures/notification/presentation/bloc/notification_bloc.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/notification.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:logistech/fetures/auth/presentation/bloc/hide_show_password_bloc/bloc/hs_password_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/governorate/governorate_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/office/offices_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/add_delete_more_goods/add_delete_more_goods_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/company/company_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/delivery/delivery_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/home/home_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/order/order_bloc.dart';
import 'package:logistech/my_observer.dart';
import 'firebase_options.dart';
import 'package:logistech/core/injection_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String? fcmToken;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  fcmToken = await FirebaseMessaging.instance.getToken();
  final NotificationSetUp noti = NotificationSetUp();
  noti.configurePushNotifications();
  noti.eventListenerCallback();
  await GetStorage.init();
  print(box.read('token'));
  Bloc.observer = MyBlocObserver();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<AuthBloc>()),
          BlocProvider(create: (context) => di.sl<HsPasswordBloc>()),
          BlocProvider(create: (context) => di.sl<OrderBloc>()),
          BlocProvider(create: (context) => di.sl<OfficesBloc>()),
          BlocProvider(create: (context) => di.sl<AddDeleteMoreGoodsBloc>()),
          BlocProvider(create: (context) => di.sl<FavoriteBloc>()),
          BlocProvider(create: (context) => di.sl<GovernorateBloc>()),
          BlocProvider(
            create: (context) => di.sl<NotificationBloc>(),
          ),
          BlocProvider(
            create: (context) => di.sl<HomeBloc>(),
          ),
          BlocProvider(
            create: (context) => di.sl<DeliveryBloc>(),
          ),
          BlocProvider(
            create: (context) => di.sl<CompanyBloc>(),
          )
        ],
        child: ScreenUtilInit(
          designSize: (const Size(360, 690)),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              routes: AppRouter.routes,
              initialRoute: box.read('token') == null
                  ? AppRouter.loginScreen
                  : AppRouter.homeScreen,
            );
          },
        ));
  }
}
