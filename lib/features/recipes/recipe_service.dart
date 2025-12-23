import 'package:cloud_firestore/cloud_firestore.dart';
import 'recipe_model.dart';

class RecipeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Recipe>> getRecipesByCategory(String category) {
    return _firestore
        .collection('recipes')
        .where('category', isEqualTo: category)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Recipe.fromFirestore(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }
}