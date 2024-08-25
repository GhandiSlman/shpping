part of 'add_delete_more_goods_bloc.dart';

sealed class AddDeleteMoreGoodsState extends Equatable {
  const AddDeleteMoreGoodsState();
  
  @override
  List<Object> get props => [];
}

final class AddDeleteMoreGoodsInitial extends AddDeleteMoreGoodsState {}
final class GoodsUpdatedState extends AddDeleteMoreGoodsState {
  final List<Map<String, String?>> goodsList;

  const GoodsUpdatedState({required this.goodsList});

  @override
  List<Object> get props => [goodsList];
}