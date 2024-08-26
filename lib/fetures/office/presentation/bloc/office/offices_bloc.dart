import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/office/data/repo/office_repo.dart';

import 'package:logistech/fetures/office/data/model/office_model.dart';

part 'offices_event.dart';
part 'offices_state.dart';

class OfficesBloc extends Bloc<OfficesEvent, OfficesState> {
  final OfficeRepo officeRepo;
  int? selectedIndex;
  bool? isSelected = false;
  OfficesBloc(this.officeRepo) : super(OfficesInitial()) {
    on<GetAllOfficesEvent>((event, emit) async {
      emit(GetOfficesLoadingState());
      final result = await officeRepo.getOffices(
          getOfficesModel: GetOfficesModel(), gover: '');

      if (result is DataSuccess<GetOfficesModel>) {
        emit(GetOfficesLoadedState(offices: result.data!.offices!));
      } else if (result is DataFailed) {
        emit(GetOfficesErrorState(message: result.errorMessage!));
      }
    });

    on<GetAllFilterdOfficesEvent>((event, emit) async {
      emit(GetFilterOfficesLoadingState());
      final result = await officeRepo.getOffices(
          getOfficesModel: GetOfficesModel(), gover: event.gover);
      if (result is DataSuccess<GetOfficesModel>) {
        emit(GetFilterOfficesLoadedState(offices: result.data!.offices!));
      } else if (state is DataFailed) {
        emit(GetFilterOfficesErrorState(message: result.errorMessage!));
      }
    });
   
  }
}
