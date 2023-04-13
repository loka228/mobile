class Person {
  String surname;
  DateTime birthDate;

  Person(this.surname, this.birthDate);

  void printInfo() {
    print('Surname: $surname');
    print('Birth date: $birthDate');
  }

  int calculateAge() {
    DateTime now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
  }
    return age;
  }
}

class Applicant extends Person {
  String faculty;

  Applicant(String surname, DateTime birthDate, this.faculty) : super(surname, birthDate);

  void printInfo() {
    super.printInfo();
    print('Faculty: $faculty');
  }
}

class Student extends Applicant {
  int course;

  Student(String surname, DateTime birthDate, String faculty, this.course) : super(surname, birthDate, faculty);

  void printInfo() {
    super.printInfo();
    print('Course: $course');
  }
}

class Teacher extends Person {
  String faculty;
  String position;
  int experience;

  Teacher(String surname, DateTime birthDate, this.faculty, this.position, this.experience) : super(surname, birthDate);

  void printInfo() {
    super.printInfo();
    print('Faculty: $faculty');
    print('Position: $position');
    print('Experience: $experience years');
  }
}

void main() {
    List persons = [
    Applicant('Ivanov', DateTime(1999, 5, 12), 'Mathematics'),
    Student('Petrov', DateTime(2000, 1, 25), 'Physics', 3),
    Teacher('Sidorov', DateTime(1985, 3, 8), 'Chemistry', 'Professor', 7),
    Applicant('Semova', DateTime(2002, 10, 2), 'Biology')
  ];

  for (Person person in persons) {
    person.printInfo();
    print('Age: ${person.calculateAge()}');
    print('');
  }

  int minAge = 15;
  int maxAge = 25;

  print('------------------------------------');
  print('Persons in the age range of $minAge to $maxAge:');
  for (Person person in persons) {
  int age = person.calculateAge();
    if (age >= minAge && age <= maxAge) {
      person.printInfo();
      print('Age: $age');
      print('');
    }
  }
}





