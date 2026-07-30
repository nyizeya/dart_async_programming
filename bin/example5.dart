// Async expand

void main() async {
  final stream = getNames().asyncExpand((name) => getCharacters(name));

  stream.listen((data) => print('RECEIVED $data'));
}

Stream<String> getCharacters(String fromString) async* {
  print('FROM $fromString');
  for (var i = 0; i < fromString.length; i++) {
    await Future.delayed(const Duration(milliseconds: 300));
    yield fromString[i];
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(milliseconds: 200));
  yield 'John';

  await Future.delayed(const Duration(milliseconds: 200));
  yield 'Doe';
}
