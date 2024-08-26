import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/order/data/model/company_model.dart';
import 'package:logistech/fetures/order/data/repo/order_repo.dart';
part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  OrderRepo orderRepo;
  CompanyBloc(this.orderRepo) : super(CompanyInitial()) {
    on<GetCompanyInfoEvent>((event, emit) async {
      emit(GetCompanyInfoLoadingState());
      final result = await orderRepo.getCompany(companyModel: CompanyModel());
      if (result is DataSuccess<CompanyModel>) {
        emit(GetCompanyInfoLoafedState(companyModelData: result.data!.data!));
      } else if (result is DataFailed) {
        emit(GetCompanyInfoErrorState());
      }
    });
  }
}
