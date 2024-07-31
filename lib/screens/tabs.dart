import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteMeal(Meal meal) {
    final isMealExists = _favoriteMeals.contains(meal);
    if (isMealExists) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Meal is no longer a favorite.");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Marked as a favorite!");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: (meal) {
        _toggleFavoriteMeal(meal);
      },
    );
    var activePageTitle = 'Categories';

    if (selectedIndex == 1) {
      activePage = MealsScreen(
          meals: _favoriteMeals,
          onToggleFavorite: (meal) {
            _toggleFavoriteMeal(meal);
          });
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
        onTap: _selectPage,
        currentIndex: selectedIndex,
      ),
    );
  }
}
