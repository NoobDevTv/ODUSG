extension ListExtension<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E, int) func) sync* {
    int index = 0;
    for (var element in this) {
      yield func(element, index++);
    }
  }
}
