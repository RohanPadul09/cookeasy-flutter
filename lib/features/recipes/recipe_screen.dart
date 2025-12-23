import 'package:flutter/material.dart';
import 'recipe_service.dart';
import 'recipe_model.dart';
import 'recipe_detail_screen.dart'; // ← Add this import

class RecipeScreen extends StatelessWidget {
  final String category;

  const RecipeScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final service = RecipeService();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: StreamBuilder<List<Recipe>>(
        stream: service.getRecipesByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No recipes found'));
          }

          final recipes = snapshot.data!;

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return ListTile(
                title: Text(recipe.title),
                subtitle: Text(
                  '${recipe.description}\nCategory: ${recipe.category}',
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // ✅ Navigate to Recipe Detail Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RecipeDetailScreen(recipe: recipe),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}