import 'package:get_it/get_it.dart';
import 'package:informa3/features/bmi_calculater/presentation/manger/bmi_cubit/bmi_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    sl.registerLazySingleton<BmiCubit>(() => BmiCubit());
  }
}
