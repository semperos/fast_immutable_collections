import 'package:fast_immutable_collections/fast_immutable_collections.dart';

// /////////////////////////////////////////////////////////////////////////////////////////////////

class L2<T> extends L<T> {
  final L<T> _l;
  final T _item;

  L2(this._l, this._item)
      : assert(_l != null),
        assert(_item != null);

  @override
  bool get isEmpty => false;

  @override
  Iterator<T> get iterator => IteratorL2(_l.iterator, _item);

  /// Implicitly uniting the lists.
  @override
  T operator [](int index) {
    if (index < 0 || index >= length)
      throw RangeError.range(index, 0, length - 1, 'index');
    return (index == length - 1) ? _item : _l[index];
  }

  @override
  int get length => _l.length + 1;
}

// /////////////////////////////////////////////////////////////////////////////////////////////////

class IteratorL2<T> implements Iterator<T> {
  Iterator<T> iterator;
  T item;
  T _current;
  int extraMove;

  IteratorL2(this.iterator, this.item)
      : _current = iterator.current,
        extraMove = 0;

  @override
  T get current => _current;

  @override
  bool moveNext() {
    bool isMoving = iterator.moveNext();
    if (isMoving)
      _current = iterator.current;
    else {
      extraMove++;
      _current = (extraMove == 1) ? item : null;
    }
    return extraMove <= 1;
  }
}

// /////////////////////////////////////////////////////////////////////////////////////////////////
