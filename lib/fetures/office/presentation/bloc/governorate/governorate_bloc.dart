import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/office/data/model/governorate_model.dart';
import 'package:logistech/fetures/office/data/repo/office_repo.dart';

part 'governorate_event.dart';
part 'governorate_state.dart';

class GovernorateBloc extends Bloc<GovernorateEvent, GovernorateState> {
    final OfficeRepo officeRepo;
  GovernorateBloc(this.officeRepo) : super(GovernorateInitial()) {
    on<GetGovernoratesEvent>((event, emit) async {
      emit(GetGovernoratesLoadingState());
      final result =
          await officeRepo.getGovernorate(governorateModel: GovernorateModel());
      if (result is DataSuccess<GovernorateModel>) {
        emit(GetGovernoratesLoadedState(governorates: result.data!.data!));
      } else if (result is DataFailed) {
        emit(GetGovernoratesErrorState(message: result.errorMessage!));
      }
    });
  
  }
}
