import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaning_app_bloc/pages/sign_up/bloc/sign_up_events.dart';
import 'package:uleaning_app_bloc/pages/sign_up/bloc/sign_up_states.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates>{
  SignUpBloc():super(const SignUpStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }
  void _userNameEvent(UserNameEvent event, Emitter<SignUpStates> emit){
    emit(state.copyWith(userName: event.userName));
  }
  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit){
    emit(state.copyWith(password: event.password));
  }
  void _rePasswordEvent(RePasswordEvent event, Emitter<SignUpStates> emit){
    emit(state.copyWith(rePassword: event.rePassword));
  }
}