/// Base level repository. At the very least it expects an adapter.
abstract class Repository<T, Adapter> {
  const Repository({
    required this.adapter,
  });

  final Adapter adapter;
}
