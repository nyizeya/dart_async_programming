// Basic Future syntax

void main() async {
  print(await getName());
  print(await getAddress());
  print("Done");
  print(await getPhoneNumber());
}

Future<String> getName() async => "Nyi Zeya";
Future<String> getAddress() => Future.value("123, Main St");
Future<String> getPhoneNumber() =>
    Future.delayed(Duration(seconds: 1), () => "55-555-555");

Future<String> getCity() async {
  Future.delayed(const Duration(seconds: 1));

  return "New York";
}
