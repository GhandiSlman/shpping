import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/office/data/model/favorite_offices_model.dart';
import 'package:logistech/fetures/office/data/model/governorate_model.dart';
import 'package:logistech/fetures/office/data/model/office_model.dart';

abstract class OfficeRepo {
  Future<DataState> getOffices({required GetOfficesModel getOfficesModel,required String gover});
  Future<DataState> favorite({required int id});
  Future<DataState> getFavoriteOffices(
      {required FavoriteOfficesModel favoriteOfficesModel});
  Future<DataState> getGovernorate(
      {required GovernorateModel governorateModel});
}
