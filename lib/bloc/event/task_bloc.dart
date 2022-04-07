
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oooswift/bloc/event/task_event.dart';
import 'package:oooswift/bloc/event/task_state.dart';
import 'package:oooswift/bloc/task_event.dart';
import 'package:oooswift/bloc/task_state.dart';


class EventBloc extends Bloc<EventEvent, StateEvent>{


  EventBloc(StateEvent initialState) : super(initialState){
    on<InitEvent>((event, emit) {
      emit(InitStateEvent(eventlist));
    } );
    // on<(_confirm);
  }

  @override
  StateTask get initialState => InitStateTask([]);

  

}


List eventlist = [
  "Совещание",
  "Запись видео"
];