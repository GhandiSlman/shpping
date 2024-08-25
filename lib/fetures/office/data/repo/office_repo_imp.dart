import 'package:logistech/core/utils/app_consts.dart';
import 'package:logistech/core/data/data_repo.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/office/data/model/favorite_model.dart';
import 'package:logistech/fetures/office/data/model/favorite_offices_model.dart';
import 'package:logistech/fetures/office/data/model/governorate_model.dart';
import 'package:logistech/fetures/office/data/model/office_model.dart';
import 'package:logistech/fetures/office/data/repo/office_repo.dart';

class OfficeRepoImp implements OfficeRepo {
  final DataService _dataService;
  OfficeRepoImp(this._dataService);

  

  @override
  Future<DataState> favorite({required int id}) async {
    final response = await _dataService.getData(
      endPoint: 'favourites/$id',
      fromJson: (json) => FavoriteModel.fromJson(json),
    );
    return response;
  }

  @override
  Future<DataState> getFavoriteOffices(
      {required FavoriteOfficesModel favoriteOfficesModel}) async {
    final response = await _dataService.getData(
        endPoint: 'favourites',
        fromJson: (json) => FavoriteOfficesModel.fromJson(json));
    return response;
  }

  @override
  Future<DataState> getGovernorate(
      {required GovernorateModel governorateModel}) async {
    final response = await _dataService.getData(
        endPoint: 'governorates',
        fromJson: (json) => GovernorateModel.fromJson(json));
    return response;
  }
  
  @override
  Future<DataState> getOffices({required GetOfficesModel getOfficesModel, required String gover}) async{
     final response = await _dataService.getData(
      endPoint: 'offices/CG/?governorate=$gover',
      baseUrl: baseUrl,
      fromJson: (json) => GetOfficesModel.fromJson(json),
    );

    return response;
  }
}
