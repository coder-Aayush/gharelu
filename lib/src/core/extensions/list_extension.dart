extension ListUpdate<T> on List<T> ***REMOVED***
  List<T> update(int pos, T t) ***REMOVED***
    List<T> list = [];
    list.add(t);
    replaceRange(pos, pos + 1, list);
    return this;
  ***REMOVED***
***REMOVED***
