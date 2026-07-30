// Future Chaining

void main() {
  getFullName()
      .then((name) => calculateLength(name))
      .then((length) => print("Lenght is $length"));

  print("Hey Yo");
}

Future<String> getFullName() =>
    Future.delayed(const Duration(seconds: 1), () => "John Doe");

Future<int> calculateLength(String value) {
  return Future.delayed(const Duration(seconds: 1), () => value.length);
}
