import 'package:flutter/material.dart';
import 'dart:convert';
import 'json.dart';
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
    // final jsonData = json.decode(jsonString);
    // final  List<dynamic> recipeList = jsonData['recipes'];
    // //allFoodRecipes = recipeList.map((recipeJson) => Recipe.fromJson(recipeJson)).toList();

    final List<dynamic>jsonData = jsonDecode(jsonString)['recipes'];
    //allFoodRecipes = jsonData.map((e) => Recipe.fromJson(e)).toList();
    for (var jsonItem in jsonData) {
      allFoodRecipes.add(Recipe.fromJson(jsonItem));
    }

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


