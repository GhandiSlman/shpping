import 'package:bloc/bloc.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/office/data/model/favorite_model.dart';
import 'package:logistech/fetures/office/data/model/favorite_offices_model.dart';
import 'package:logistech/fetures/office/data/repo/office_repo.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/bloc/favorite_state.dart';
import 'package:logistech/fetures/office/presentation/bloc/favorite/favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final OfficeRepo officeRepo ;
  // bool isFavorite = false;
  FavoriteBloc(this.officeRepo) : super(FavoriteInitial()) {
    on<AddRemoveFavoriteEvent>((event, emit) async {
      emit(FavoriteLoadingState());

      final result = await officeRepo.favorite(id: event.id);
      if (result is DataSuccess<FavoriteModel>) {
        // isFavorite = !isFavorite;
        emit(FavoriteLoadedState(result.data!));
      } else if (result is DataFailed) {
        emit(FavoriteErrorState(result.errorMessage!));
      }
    });
     on<GetFavoriteOfficesEvent>((event, emit) async {
      emit(GetFavoriteOfficeLoadingState());
      final result =
          await officeRepo.getFavoriteOffices(favoriteOfficesModel: FavoriteOfficesModel());

      if (result is DataSuccess) {
        emit(GetFavoriteOfficeLoadedState(favoriteOfficesModel: result.data!.data!));
      } else if (result is DataFailed) {
        emit(GetFavoriteOfficeErrorState(message: result.errorMessage!));
        
      }
    });
  }
}
