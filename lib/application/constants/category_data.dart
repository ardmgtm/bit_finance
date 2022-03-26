import 'package:flutter/material.dart';

import '../../domain/entity/category/category.dart';

List<Category> expenseCategories = [
  Category(
    name: 'Food/Drink',
    color: Colors.red,
    icon: const Icon(Icons.fastfood_rounded),
  ),
  Category(
    name: 'Grocery',
    color: Colors.orange,
    icon: const Icon(Icons.shopping_bag_rounded),
  ),
  Category(
    name: 'Shopping',
    color: Colors.green,
    icon: const Icon(Icons.shopping_cart_rounded),
  ),
  Category(
    name: 'Bill',
    color: Colors.teal,
    icon: const Icon(Icons.receipt_rounded),
  ),
  Category(
    name: 'Transport',
    color: Colors.blue,
    icon: const Icon(Icons.directions_subway_rounded),
  ),
  Category(
    name: 'Family/Friend',
    color: Colors.purple,
    icon: const Icon(Icons.family_restroom_rounded),
  ),
  Category(
    name: 'Education',
    color: Colors.redAccent,
    icon: const Icon(Icons.school_rounded),
  ),
  Category(
    name: 'Health',
    color: Colors.orangeAccent,
    icon: const Icon(Icons.medication_rounded),
  ),
  Category(
    name: 'Investment',
    color: Colors.greenAccent,
    icon: const Icon(Icons.savings_rounded),
  ),
  Category(
    name: 'Vehicle',
    color: Colors.tealAccent,
    icon: const Icon(Icons.directions_car_rounded),
  ),
  Category(
    name: 'Entertainment',
    color: Colors.blueAccent,
    icon: const Icon(Icons.sports_esports_rounded),
  ),
  Category(
    name: 'Other',
    color: Colors.purpleAccent,
    icon: const Icon(Icons.apps_rounded),
  ),
];

List<Category> incomeCategories = [
  Category(
    name: 'Salary',
    color: Colors.red,
    icon: const Icon(Icons.payments_rounded),
  ),
  Category(
    name: 'Investment',
    color: Colors.green,
    icon: const Icon(Icons.savings_rounded),
  ),
  Category(
    name: 'Bonus',
    color: Colors.blue,
    icon: const Icon(Icons.paid_rounded),
  ),
  Category(
    name: 'Other',
    color: Colors.purple,
    icon: const Icon(Icons.apps_rounded),
  ),
];
