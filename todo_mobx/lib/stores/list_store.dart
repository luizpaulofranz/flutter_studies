import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store{

  @observable
  String newTodoTitle = "";

  /* 
    We have to use ObservableList when we want that changes in the elements triggers mobx reactions.
    That's because @observables looks to new instances or references, but the list reference will never change
    So, we have to use this kind of object to reflect on Observer component when we add new item on list, for example.
    Of course, if you always return a new list when you add a new item it will works with @observable, but this is the correct way.
    There are others, ObservableMap, ObservableSet, etc.

    And in this case, we can use a list of other Store
  */
  ObservableList<TodoStore> todos = ObservableList();

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @action
  void addTodo() {
    todos.insert( 0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

}