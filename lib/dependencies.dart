import './services/rest.dart';
import './services/event_service.dart';
import './services/member_service.dart';
import 'package:get_it/get_it.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(() => Rest());
  service.registerLazySingleton(() => MemberService());
  service.registerLazySingleton(() => EventService());
}
