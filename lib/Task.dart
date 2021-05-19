class Task {
  String taskName;
  bool isDone;
  Task({this.isDone = false, this.taskName});

  void toggleDone() {
    //performing task of CheckBox->Setstate i.e., true->false and vv
    isDone = !isDone;
  }
}
