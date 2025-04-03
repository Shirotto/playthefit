import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new user to the Firestore database
  Future<void> addUser(String userId, String name, String email) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  // Prendere i dati di un utente specifico
  Future<DocumentSnapshot> getUser(String userId) async {
    try {
      return await _firestore.collection('users').doc(userId).get();
    } catch (e) {
      print("Error fetching user: $e");
      rethrow;
    }
  }

  // Eliminare un utente dal Firestore
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  // Aggiorna i dati di un utente
  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).update(data);
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  // Ottenere la lista di tutti gli utenti
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error fetching all users: $e");
      return [];
    }
  }

}