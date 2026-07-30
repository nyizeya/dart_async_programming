// Stream

void main() async {
  // Observer way, non-blocking
  getNumbers().listen(
    (data) => print("RECEIVED $data"),
    onError: print,
    onDone: () => print("Done"),
    cancelOnError: false,
  );

  try {
    // blocking way
    await for (final name in getNames()) {
      print(name);
    }
  } catch (e) {
    print(e);
  }
}

Stream<int> getNumbers() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));

    if (i == 5) {
      throw Exception("I just hate number 5");
    }

    print('SENT $i');
    yield i;
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(seconds: 1));

  yield 'John';

  throw Exception('Something went wrong');
}
