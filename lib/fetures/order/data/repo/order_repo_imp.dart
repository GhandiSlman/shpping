import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/data/data_repo.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/order/data/model/company_model.dart';
import 'package:logistech/fetures/order/data/model/delivery_status_model.dart';
import 'package:logistech/fetures/order/data/model/location_model.dart';
import 'package:logistech/fetures/order/data/model/payment_model.dart';
import 'package:logistech/fetures/order/data/model/user_location_model.dart';
import 'package:logistech/fetures/order/data/repo/order_repo.dart';
import 'package:logistech/fetures/order/data/model/add_order_model.dart';
import 'package:logistech/fetures/order/data/model/get_user_order_model.dart';

class OrderRepoImp implements OrderRepo {
  final DataService _dataService;
  OrderRepoImp(this._dataService);
  @override
  Future<DataState> getOrder(
      {required GetUserOrdersModel getOrderModel}) async {
    final response = await _dataService.getData(
      endPoint: 'orders/user',
      baseUrl: baseUrl,
      fromJson: (json) => GetUserOrdersModel.fromJson(json),
    );
    return response;
  }

  @override
  Future<DataState> createOrder(
      {required CreateOrderModel createOrderModel}) async {
    final repsonse = await _dataService.postData(
        endPoint: 'orders/create',
        data: createOrderModel.toJson(),
        fromJson: GetOrderModel.fromJson);

    return repsonse;
  }

  @override
  Future<DataState> payMent({required PayMentModel payMentModel}) async {
    final response = await _dataService.postData(
        endPoint: 'order/payment',
        data: payMentModel.toJson(),
        fromJson: GetPayMentModel.fromJson);
    return response;
  }

  @override
  Future<DataState> getOfficeLocation(
      {required LocationModel locationModel, required String officeId}) async {
    final response = await _dataService.getData(
        endPoint: 'office/location/$officeId',
        fromJson: (json) => LocationModel.fromJson(json));
    return response;
  }

  @override
  Future<DataState> getDeleiveryStatus(
      {required DeliveryStatusModel deliveryStatusModel}) async {
    final response = await _dataService.getData(
        endPoint: 'isOnline',
        fromJson: (json) => DeliveryStatusModel.fromJson(json));

    return response;
  }

  @override
  Future<DataState> getUserLocation(
      {required UserLocatoinModel getUserOrdersModel,
      required String orderId}) async {
    final response = await _dataService.getData(
        endPoint: 'Get/Order/location/$orderId',
        fromJson: (json) => UserLocatoinModel.fromJson(json));

    return response;
  }

  @override
  Future<DataState> getCompany({required CompanyModel companyModel}) async {
    final response = await _dataService.getData(
        endPoint: 'company/details',
        fromJson: (json) => CompanyModel.fromJson(json));
    return response;
  }

  @override
  Future<DataState> updateOrder({required String order}) async {
    final response =
        await _dataService.getData(endPoint: 'update/order-state/$order');

    return response;
  }
}
