part of 'add_delete_more_goods_bloc.dart';

sealed class AddDeleteMoreGoodsEvent extends Equatable {
  const AddDeleteMoreGoodsEvent();

  @override
  List<Object> get props => [];
}
class AddMoreGoodsEvent extends AddDeleteMoreGoodsEvent {}

class RemoveGoodsEvent extends AddDeleteMoreGoodsEvent {
  final int index;

  const RemoveGoodsEvent({required this.index});

  @override
  List<Object> get props => [index];
}