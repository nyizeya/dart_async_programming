// Future Error Handling

void main(List<String> args) async {
  try {
    print(await getFullName(firstName: "", lastName: "Zeya"));
  } on FirstOrLastNameMissingException {
    print("First or Last name is missing");
  }
}

Future<String> getFullName({
  required String firstName,
  required String lastName,
}) async {
  if (firstName.isEmpty || lastName.isEmpty) {
    throw FirstOrLastNameMissingException();
  }

  return '$firstName $lastName';
}

class FirstOrLastNameMissingException implements Exception {
  const FirstOrLastNameMissingException();
}
