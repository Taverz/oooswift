
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oooswift/bloc/event/task_bloc.dart';
import 'package:oooswift/bloc/event/task_event.dart';
import 'package:oooswift/bloc/event/task_state.dart';
import 'package:oooswift/bloc/task_bloc.dart';
import 'package:oooswift/bloc/task_event.dart';
import 'package:oooswift/bloc/task_state.dart';


class TaskPage extends StatefulWidget {
  const TaskPage({ Key? key }) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  String type = "Разработка";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Row(children: [
                  Spacer(),
                  Container(
                    child: Text("Главная", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                  ),
                  Spacer(),  
                ],),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      child: Text(type,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    ), 
                    Spacer(),
                    Icon(Icons.notifications_active)
                  ],
                ),
              ),
              Container(
                child: ListCustom(
                  type: TypeListCustom.Task,
                  expanded: 4,
                ),
              ),
              Container(
                child: ListCustom(
                  type: TypeListCustom.Event,
                  expanded: 3,
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }

}

enum TypeListCustom { Task, Event }

class ListCustom extends StatelessWidget {
  TypeListCustom type;
  int expanded;
  ListCustom({ 
    required this.type,
    required this.expanded,

    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(children: [
        Row(
          children: [
            Container(
              child: Text(type == TypeListCustom.Event ? "События" : "Задачи", 
              style: TextStyle(fontSize: 16, color: Colors.grey[350]),),
            ),
          ],
        ),
        Container(
          height: expanded == 3 ? 200: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          padding: EdgeInsets.all(10),
          child:_listView() ,
        )
      ],),
    );
  }

  _listView(){
    if(TypeListCustom.Task == type){
      var bloc = TaskBloc(InitStateTask([]));
      bloc.add(InitEventTask());
      return BlocBuilder
      // <TaskBloc, StateTask>
      (
        bloc: bloc,
        builder: (context, state) {
          if(state is InitStateTask){
            return ListView.builder(
              itemCount: state.list.length ,
              itemBuilder: (context, index){
                return _itemList(state.list[index]);
              }
            );
          }
          return Center(child: Text("Пусто"),);
          
        }
      );
    }
    if(TypeListCustom.Event == type){
      var bloc2 = EventBloc(InitStateEvent([]));
      bloc2.add(InitEvent());
      return BlocBuilder
      // <EventBloc, StateEvent>
      (
        bloc: bloc2,
        builder: (context, state) {
          if(state is InitStateEvent){
            return ListView.builder(
              itemCount: state.list.length ,
              itemBuilder: (context, index){
                return _itemList(state.list[index]);
              }
            );
          }
          return Center(child: Text("Пусто"),);
          
        }
      );
    }
    return Center(child: Text("Не определенно"),);

    
  }
  _itemList(String title){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: type == TypeListCustom.Event ? Colors.green[300] : Colors.blue[300],
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Text("$title " ),
    );
  }
}

