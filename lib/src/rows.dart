class Rows<T> {
  final List<T> _templates = [];

  void add(T template) => _templates.add(template);

  void forEach(void f(T element)) => _templates.forEach(f);

  bool get isEmpty => _templates.isEmpty;

  @override
  String toString() => _templates.map((t) => t.toString()).where((s) => s.isNotEmpty).join('\n');
}
