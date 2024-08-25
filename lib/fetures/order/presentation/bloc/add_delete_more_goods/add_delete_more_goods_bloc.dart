import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_delete_more_goods_event.dart';
part 'add_delete_more_goods_state.dart';

class AddDeleteMoreGoodsBloc
    extends Bloc<AddDeleteMoreGoodsEvent, AddDeleteMoreGoodsState> {
  List<Map<String, String?>> goodsList = [{}];
  AddDeleteMoreGoodsBloc() : super(AddDeleteMoreGoodsInitial()) {
    on<AddMoreGoodsEvent>((event, emit) {
      goodsList.add({});
      emit(GoodsUpdatedState(goodsList: List.from(goodsList)));
    });
    on<RemoveGoodsEvent>((event, emit) {
      goodsList.removeAt(event.index);
      emit(GoodsUpdatedState(goodsList: List.from(goodsList)));
    });
  }
}
