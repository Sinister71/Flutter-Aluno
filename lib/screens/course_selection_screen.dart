import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/course.dart';

class CourseSelectionScreen extends StatefulWidget {
  final Student? student;
  final Function(Course) onCourseSelected;

  CourseSelectionScreen({
    required this.student,
    required this.onCourseSelected,
  });

  @override
  _CourseSelectionScreenState createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  Course? selectedCourse;
  List<Course> courses = Course.getAvailableCourses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Curso'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.school,
                      size: 48,
                      color: Color(0xFF1B365D),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Olá, ${widget.student?.name ?? 'Aluno'}!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B365D),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Selecione o curso que deseja estudar:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            ...courses.map((course) => _buildCourseCard(course)).toList(),
            SizedBox(height: 24),
            if (selectedCourse != null)
              ElevatedButton(
                onPressed: () {
                  widget.onCourseSelected(selectedCourse!);
                  Navigator.pushNamed(context, '/profile');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    'Confirmar Seleção',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    bool isSelected = selectedCourse == course;
    
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: isSelected ? 8 : 4,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedCourse = course;
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(color: Color(0xFF1B365D), width: 2)
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _getCourseIcon(course.name),
                      size: 32,
                      color: isSelected ? Color(0xFF1B365D) : Colors.grey[600],
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        course.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Color(0xFF1B365D) : Colors.black,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFF1B365D),
                        size: 24,
                      ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  course.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${course.duration} semestres',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.book,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${course.subjects.length} matérias',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                if (isSelected) ...[
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 8),
                  Text(
                    'Grade Curricular:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B365D),
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: course.subjects
                        .map((subject) => Chip(
                              label: Text(
                                subject,
                                style: TextStyle(fontSize: 12),
                              ),
                              backgroundColor: Color(0xFFD7D7D7),
                            ))
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getCourseIcon(String courseName) {
    switch (courseName) {
      case 'Ciência da Computação':
        return Icons.computer;
      case 'Administração':
        return Icons.business;
      case 'Design Gráfico':
        return Icons.palette;
      default:
        return Icons.school;
    }
  }
}
