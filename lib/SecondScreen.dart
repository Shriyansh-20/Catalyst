/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  Stream? StudentStream;

  Widget allStudentDetails() {
    return StreamBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(itemBuilder: (context, index) {
                itemCount:
                snapshot.data.docs.length;
                itemBuilder:
                (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Card(
                    color: Colors.deepPurple.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name:' + ds['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple)),
                          Text('Roll Number:' + ds['Roll'],
                              style: TextStyle(color: Colors.deepPurple)),
                          Text('Semester:' + ds['Semester'],
                              style: TextStyle(color: Colors.deepPurple)),
                          SizedBox(height: 20),
                          Image.network(
                              'https://conferenceoeh.com/wp-content/uploads/profile-pic-dummy.png',
                              width: 100,
                              height: 100), // Replace with actual URL
                        ],
                      ),
                    ),
                  );
                };
              })
            : Container();
      },
      stream: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Homepage', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Student Details
              Card(
                color: Colors.deepPurple.shade100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: John Doe',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple)),
                      Text('Roll Number: 12345',
                          style: TextStyle(color: Colors.deepPurple)),
                      Text('Semester: 2',
                          style: TextStyle(color: Colors.deepPurple)),
                      SizedBox(height: 20),
                      Image.network(
                          'https://conferenceoeh.com/wp-content/uploads/profile-pic-dummy.png',
                          width: 100,
                          height: 100), // Replace with actual URL
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Courses
              Text('Courses',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              ...List.generate(5, (index) {
                return ListTile(
                  leading: Icon(Icons.book, color: Colors.deepPurple),
                  title: Text('Course ${index + 1}',
                      style: TextStyle(color: Colors.deepPurple)),
                  onTap: () {
                    // Handle course tap
                  },
                );
              }),

              SizedBox(height: 20),

              // Class Schedules
              Text('Upcoming Classes',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(color: Colors.deepPurple))),
                  DataColumn(
                      label: Text('Time',
                          style: TextStyle(color: Colors.deepPurple))),
                  DataColumn(
                      label: Text('Class',
                          style: TextStyle(color: Colors.deepPurple))),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('2024-05-08',
                          style: TextStyle(color: Colors.deepPurple))),
                      DataCell(Text('10:00 AM',
                          style: TextStyle(color: Colors.deepPurple))),
                      DataCell(Text('Mathematics',
                          style: TextStyle(color: Colors.deepPurple))),
                    ],
                  ),
                  // Add more rows as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'course_details.dart'; // Make sure to import the CourseDetailPage

class SecondScreen extends StatelessWidget {
  Stream? StudentStream;

  Widget allStudentDetails() {
    return StreamBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(itemBuilder: (context, index) {
                itemCount:
                snapshot.data.docs.length;
                itemBuilder:
                (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Card(
                    color: Colors.deepPurple.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name:' + ds['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple)),
                          Text('Roll Number:' + ds['Roll'],
                              style: TextStyle(color: Colors.deepPurple)),
                          Text('Semester:' + ds['Semester'],
                              style: TextStyle(color: Colors.deepPurple)),
                          SizedBox(height: 20),
                          Image.network(
                              'https://conferenceoeh.com/wp-content/uploads/profile-pic-dummy.png',
                              width: 100,
                              height: 100), // Replace with actual URL
                        ],
                      ),
                    ),
                  );
                };
              })
            : Container();
      },
      stream: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Homepage', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Student Details
              Card(
                color: Colors.deepPurple.shade100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: John Doe',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple)),
                      Text('Roll Number: 12345',
                          style: TextStyle(color: Colors.deepPurple)),
                      Text('Semester: 2',
                          style: TextStyle(color: Colors.deepPurple)),
                      SizedBox(height: 20),
                      Image.network(
                          'https://conferenceoeh.com/wp-content/uploads/profile-pic-dummy.png',
                          width: 100,
                          height: 100), // Replace with actual URL
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Courses
              Text('Courses',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              ...List.generate(5, (index) {
                return ListTile(
                  leading: Icon(Icons.book, color: Colors.deepPurple),
                  title: Text('Course ${index + 1}',
                      style: TextStyle(color: Colors.deepPurple)),
                  onTap: () {
                    // Navigate to CourseDetailPage with dummy data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailPage(
                          courseName: 'Course ${index + 1}',
                          courseInfo: 'Course Information',
                          announcements: ['Announcement 1', 'Announcement 2'],
                          instructorFeedback: 'Instructor Feedback',
                        ),
                      ),
                    );
                  },
                );
              }),

              SizedBox(height: 20),

              // Class Schedules
              Text('Upcoming Classes',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(color: Colors.deepPurple))),
                  DataColumn(
                      label: Text('Time',
                          style: TextStyle(color: Colors.deepPurple))),
                  DataColumn(
                      label: Text('Class',
                          style: TextStyle(color: Colors.deepPurple))),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('2024-05-08',
                          style: TextStyle(color: Colors.deepPurple))),
                      DataCell(Text('10:00 AM',
                          style: TextStyle(color: Colors.deepPurple))),
                      DataCell(Text('Mathematics',
                          style: TextStyle(color: Colors.deepPurple))),
                    ],
                  ),
                  // Add more rows as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
