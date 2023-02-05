import 'dart:ffi';

class State<T> {
}

class DataState<T> extends State<T> {
  late T data;
}

class LoadingState extends State<Void> {

}

class ErrorState extends State<Void> {
  Exception throwable;

  ErrorState(this.throwable);
}
