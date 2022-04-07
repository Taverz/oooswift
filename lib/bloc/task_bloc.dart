
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oooswift/bloc/task_event.dart';
import 'package:oooswift/bloc/task_state.dart';


class TaskBloc extends Bloc<EventTask, StateTask>{


  TaskBloc(StateTask initialState) : super(initialState){
    on<InitEventTask>((event, emit) {
      emit(InitStateTask(tasklist));
    } );
    // on<(_confirm);
  }

  @override
  StateTask get initialState => InitStateTask([]);

  

}


List tasklist = [
  "Выпуск новой версии",
  "Аналитика",
  "Ответ на отзывы",
  "Изменение архитектуры"
];