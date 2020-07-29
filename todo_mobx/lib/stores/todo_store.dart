import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {

  _TodoStore(this.title);

  // not all our status must be observable, in this case, the title will never change
  final String title;

  @observable
  bool done = false;

  @action
  void toggleDone() => done = !done;

}