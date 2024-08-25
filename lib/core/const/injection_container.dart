import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logistech/fetures/notification/data/repo/noti_repo.dart';
import 'package:logistech/fetures/notification/data/repo/noti_repo_imp.dart';
import 'package:logistech/fetures/notification/presentation/bloc/notification_bloc.dart';
import 'package:logistech/core/data/data_repo.dart';
import 'package:logistech/core/network/network_info.dart';
import 'package:logistech/fetures/auth/data/repo/auth_repo.dart';
import 'package:logistech/fetures/auth/data/repo/auth_repo_imp.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:logistech/fetures/auth/presentation/bloc/hide_show_password_bloc/bloc/hs_password_bloc.dart';
import 'package:logistech/fetures/office/data/repo/office_repo.dart';
import 'package:logistech/fetures/office/data/repo/office_repo_imp.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/governorate/governorate_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/add_delete_more_goods/add_delete_more_goods_bloc.dart';
import 'package:logistech/fetures/office/presentation/bloc/office/offices_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/company/company_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/delivery/delivery_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/home/home_bloc.dart';
import 'package:logistech/fetures/order/presentation/bloc/order/order_bloc.dart';
import 'package:logistech/fetures/order/data/repo/order_repo.dart';
import 'package:logistech/fetures/order/data/repo/order_repo_imp.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(InternetConnectionChecker()));

  sl.registerLazySingleton<DataService>(() => DataService(sl(), sl()));

  //Auth
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImp(sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<HsPasswordBloc>(() => HsPasswordBloc());

  //Order
  sl.registerLazySingleton<OrderRepo>(() => OrderRepoImp(sl()));
  sl.registerLazySingleton<OrderBloc>(() => (OrderBloc(sl())));
  sl.registerLazySingleton<AddDeleteMoreGoodsBloc>(
      () => AddDeleteMoreGoodsBloc());

  //Offic
  sl.registerLazySingleton<OfficeRepo>(() => OfficeRepoImp(sl()));
  sl.registerLazySingleton<OfficesBloc>(() => (OfficesBloc(sl())));
  sl.registerLazySingleton<FavoriteBloc>(() => (FavoriteBloc(sl())));

  //Gover
  sl.registerLazySingleton<GovernorateBloc>(() => (GovernorateBloc(sl())));

  //notification
  sl.registerLazySingleton<NotiRepo>(() => NotiRepoImp(sl()));
  sl.registerLazySingleton<NotificationBloc>(() => (NotificationBloc(sl())));

  //home
  sl.registerLazySingleton<HomeBloc>(() => (HomeBloc()));

  //Delivery
  sl.registerLazySingleton<DeliveryBloc>(() => (DeliveryBloc(sl())));

  //company
  sl.registerLazySingleton<CompanyBloc>(() => (CompanyBloc(sl())));
}
