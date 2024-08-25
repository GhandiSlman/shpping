import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hs_password_event.dart';
part 'hs_password_state.dart';

class HsPasswordBloc extends Bloc<HsPasswordEvent, HsPasswordState> {
    bool isPasswordHidden = false;
  HsPasswordBloc() : super(HsPasswordInitial()) {

      on<HidePasswordEvent>((event, emit) {
      isPasswordHidden = event.hideOrShow; 
      emit(PasswordHideShowState(isPasswordHidden));
    });
  }
}
