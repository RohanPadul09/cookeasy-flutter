import 'package:flutter/material.dart';
import '../recipes/recipe_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CookEasy 🍳')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Start Cooking Like a Pro!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  _CategoryCard(title: 'Beginner'),
                  _CategoryCard(title: 'Vegetarian'),
                  _CategoryCard(title: 'Non-Veg'),
                  _CategoryCard(title: 'Quick Meals'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;

  const _CategoryCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipeScreen(category: title),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}