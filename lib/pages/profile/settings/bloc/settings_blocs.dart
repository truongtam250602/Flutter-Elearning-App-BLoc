import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaning_app_bloc/pages/profile/settings/bloc/settings_events.dart';
import 'package:uleaning_app_bloc/pages/profile/settings/bloc/settings_states.dart';
import 'package:uleaning_app_bloc/pages/profile/settings/settings_page.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsSates>{
  SettingsBlocs():super(const SettingsSates()){
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsEvents events, Emitter<SettingsSates> emit){
    emit(const SettingsSates());
  }
}

