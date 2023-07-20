import 'package:flutter/material.dart';
import 'dart:convert';
import 'model_class.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {

  List<Recipe> allFoodRecipes = [];

  @override
  void initState() {
    super.initState();
    fetchRecipesData();
  }

  void fetchRecipesData() {
    // Simulate fetching recipes from the JSON
    String jsonString = '''
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

    // final jsonData = json.decode(jsonString);
    // final  List<dynamic> recipeList = jsonData['recipes'];
    // //allFoodRecipes = recipeList.map((recipeJson) => Recipe.fromJson(recipeJson)).toList();


    final List<dynamic>jsonData = jsonDecode(jsonString)['recipes'];
    allFoodRecipes = jsonData.map((e) => Recipe.fromJson(e)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: allFoodRecipes.length,
        itemBuilder: (context, index) {
          final recipe = allFoodRecipes[index];
          return ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
          );
        },
      ),
    );
  }
}


