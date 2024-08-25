import 'package:equatable/equatable.dart';
import 'package:logistech/fetures/office/data/model/favorite_model.dart';
import 'package:logistech/fetures/office/data/model/favorite_offices_model.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {
  final FavoriteModel favorite;

  const FavoriteLoadedState(this.favorite);

  @override
  List<Object?> get props => [favorite];
}

class FavoriteErrorState extends FavoriteState {
  final String error;

  const FavoriteErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

//My favorite

class GetFavoriteOfficeLoadingState extends FavoriteState {}

class GetFavoriteOfficeLoadedState extends FavoriteState {
  final List<FavoriteOfficesModelData> favoriteOfficesModel;
  const GetFavoriteOfficeLoadedState({required this.favoriteOfficesModel});

  @override
  List<Object?> get props => [favoriteOfficesModel];
}

class GetFavoriteOfficeErrorState extends FavoriteState {
  final String message;
  const GetFavoriteOfficeErrorState({required this.message});

  @override
  List<Object?> get props => [message];
} 