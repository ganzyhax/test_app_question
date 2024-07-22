import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:brain_task_app/app/api/api.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    var data;
    on<HomeEvent>((event, emit) async {
      if (event is HomeLoad) {
        var req = await ApiClient().get();
        if (req['message'] == 'success') {
          data = req['data'];
          log(data.toString());
        }
        emit(HomeLoaded(data: data));
      }
    });
  }
}
