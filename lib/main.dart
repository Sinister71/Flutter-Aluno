import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/student_registration_screen.dart';
import 'screens/course_selection_screen.dart';
import 'screens/student_profile_screen.dart';
import 'models/student.dart';
import 'models/course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student? currentStudent;
  Course? selectedCourse;

  void updateStudent(Student student) {
    setState(() {
      currentStudent = student;
    });
  }

  void updateCourse(Course course) {
    setState(() {
      selectedCourse = course;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Alunos',
      theme: ThemeData(
        primaryColor: Color(0xFF1B365D), // Azul marinho
        scaffoldBackgroundColor: Color(0xFFD7D7D7), // Cinza secundário
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF1B365D),
          secondary: Color(0xFFD7D7D7),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1B365D),
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1B365D),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/register': (context) => StudentRegistrationScreen(
          onStudentRegistered: updateStudent,
        ),
        '/courses': (context) => CourseSelectionScreen(
          student: currentStudent,
          onCourseSelected: updateCourse,
        ),
        '/profile': (context) => StudentProfileScreen(
          student: currentStudent,
          course: selectedCourse,
        ),
      },
    );
  }
}

