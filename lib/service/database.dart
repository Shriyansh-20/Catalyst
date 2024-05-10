import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Class responsible for interacting with Firestore for student-related operations.
class DatabaseMethods {
  // Adds student details to the Firestore collection "Student".
  // Takes a map of student information and a unique ID as parameters.
  Future addStudentDetails(
      Map<String, dynamic> studentInfoMap, String id) async {
    // Uses Firestore to add the student information to the "Student" collection.
    // The document ID is set to the provided 'id'.
    return await FirebaseFirestore.instance
        .collection("Student")
        .doc(id)
        .set(studentInfoMap);
  }

  // Retrieves a stream of student details from the Firestore collection "Student".
  // Returns a stream of QuerySnapshot objects, allowing for real-time updates.
  Future<Stream<QuerySnapshot>> getStudentDetails() async {
    // Uses Firestore to get a stream of snapshots from the "Student" collection.
    // This stream can be listened to for real-time updates of student details.
    return await FirebaseFirestore.instance.collection("Student").snapshots();
  }
}
