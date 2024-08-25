import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/order/data/model/add_order_model.dart';
import 'package:logistech/fetures/order/data/model/company_model.dart';
import 'package:logistech/fetures/order/data/model/delivery_status_model.dart';
import 'package:logistech/fetures/order/data/model/get_user_order_model.dart';
import 'package:logistech/fetures/order/data/model/location_model.dart';
import 'package:logistech/fetures/order/data/model/payment_model.dart';
import 'package:logistech/fetures/order/data/model/user_location_model.dart';

abstract class OrderRepo {
  Future<DataState> getOrder({required GetUserOrdersModel getOrderModel});

  Future<DataState> createOrder({required CreateOrderModel createOrderModel});

  Future<DataState> payMent({required PayMentModel payMentModel});

  Future<DataState> getOfficeLocation(
      {required LocationModel locationModel, required String officeId});

  Future<DataState> getDeleiveryStatus(
      {required DeliveryStatusModel deliveryStatusModel});

  Future<DataState> getUserLocation(
      {required UserLocatoinModel getUserOrdersModel, required String orderId});

  Future<DataState> getCompany({required CompanyModel companyModel});

   Future<DataState> updateOrder({required String order});
}
