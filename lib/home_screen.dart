import 'package:flutter/material.dart';
import 'dart:convert';
import 'model_class.dart';

class RecipeListScreen extends StatelessWidget {
  final String jsonString = '''
    {
      "recipes": [
        {
          "title": "Pasta Carbonara",
          "description": "Creamy pasta dish with bacon and cheese.",
          "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
        },
        {
          "title": "Caprese Salad",
          "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
          "ingredients": ["tomatoes", "mozzarella", "basil"]
        },
        {
          "title": "Banana Smoothie",
          "description": "Healthy and creamy smoothie with bananas and milk.",
          "ingredients": ["bananas", "milk"]
        },
        {
          "title": "Chicken Stir-Fry",
          "description": "Quick and flavorful stir-fried chicken with vegetables.",
          "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
        },
        {
          "title": "Grilled Salmon",
          "description": "Delicious grilled salmon with lemon and herbs.",
          "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
        },
        {
          "title": "Vegetable Curry",
          "description": "Spicy and aromatic vegetable curry.",
          "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
        },
        {
          "title": "Berry Parfait",
          "description": "Layered dessert with fresh berries and yogurt.",
          "ingredients": ["berries", "yogurt", "granola"]
        }
      ]
    }
  ''';

  const RecipeListScreen({super.key});

  List<Recipe> _recipesFromJson(String jsonString) {
    final parsedJson = json.decode(jsonString);
    final recipeList = parsedJson['recipes'] as List<dynamic>;
    return recipeList.map((recipeJson) => Recipe.fromJson(recipeJson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = _recipesFromJson(jsonString);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
          );
        },
      ),
    );
  }
}
