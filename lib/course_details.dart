import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart'; // Import the Flutter Lorem package

class CourseDetailPage extends StatelessWidget {
  final String courseName;
  final String courseInfo;
  final List<String> announcements;
  final String instructorFeedback;

  CourseDetailPage({
    required this.courseName,
    required this.courseInfo,
    required this.announcements,
    required this.instructorFeedback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Information
              Card(
                color: Colors.deepPurple.shade100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseInfo,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Course Description:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      SizedBox(height: 10),
                      Text(
                        lorem(
                            paragraphs: 3,
                            words:
                                50), // Use Flutter Lorem for placeholder text
                        style:
                            TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Announcements
              Text(
                'Announcements:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              ...announcements
                  .map((announcement) => ListTile(
                        title: Text(announcement),
                      ))
                  .toList(),

              SizedBox(height: 20),

              // Instructor Feedback
              Text(
                'Instructor Feedback:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              Text(
                instructorFeedback,
                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
