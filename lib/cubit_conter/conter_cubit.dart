import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_cubit_sayac/cubit_conter/conter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(const CounterInitial(baslangicDegeri: 20));

  void arttir() {
    emit(MyCounterState(sayacDegeri: state.sayac + 1));
  }

  void azalt() {
    emit(MyCounterState(sayacDegeri: state.sayac - 1));
  }
}
