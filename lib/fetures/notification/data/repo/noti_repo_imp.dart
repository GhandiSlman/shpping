import 'package:logistech/core/data/data_repo.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/notification/data/model/nontification_model.dart';
import 'package:logistech/fetures/notification/data/repo/noti_repo.dart';

class NotiRepoImp implements NotiRepo {
  final DataService _dataService;
  NotiRepoImp(this._dataService);

  @override
  Future<DataState> getNoti({required GetNotiModel getNotiModel}) async {
    final response = await _dataService.getData(
        endPoint: 'get-notification',
        fromJson: (json) => GetNotiModel.fromJson(json));
    return response;
  }
}
