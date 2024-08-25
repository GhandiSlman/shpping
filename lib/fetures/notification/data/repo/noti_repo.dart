import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/notification/data/model/nontification_model.dart';

abstract class NotiRepo {
  Future<DataState> getNoti({required GetNotiModel getNotiModel});
}
