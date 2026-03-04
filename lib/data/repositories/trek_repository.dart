import '../models/trek.dart';
import '../sample/dummy_treks.dart';

class TrekRepository {
  final List<Trek> _items = List<Trek>.from(dummyTreks);

  List<Trek> getAll() => List<Trek>.unmodifiable(_items);

  void add(Trek trek) {
    _items.insert(0, trek);
  }
}
