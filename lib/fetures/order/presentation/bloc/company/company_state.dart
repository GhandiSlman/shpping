part of 'company_bloc.dart';

sealed class CompanyState extends Equatable {
  const CompanyState();
  
  @override
  List<Object> get props => [];
}

final class CompanyInitial extends CompanyState {}

class GetCompanyInfoLoadingState extends CompanyState {}

class GetCompanyInfoLoafedState extends CompanyState {
  final CompanyModelData companyModelData;
  const GetCompanyInfoLoafedState({required this.companyModelData});

  @override
  List<Object> get props => [companyModelData];
}

class GetCompanyInfoErrorState extends CompanyState {}
