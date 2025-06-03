class Student {
  final String name;
  final String email;
  final String phone;
  final DateTime birthDate;

  Student({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
  });

  String get formattedBirthDate {
    return '${birthDate.day.toString().padLeft(2, '0')}/${birthDate.month.toString().padLeft(2, '0')}/${birthDate.year}';
  }
}
