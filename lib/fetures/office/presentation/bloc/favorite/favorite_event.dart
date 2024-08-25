import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddRemoveFavoriteEvent extends FavoriteEvent {
  final int id;

  const AddRemoveFavoriteEvent(this.id);

  @override
  List<Object> get props => [id];
}

//offices
class GetFavoriteOfficesEvent extends FavoriteEvent {}


