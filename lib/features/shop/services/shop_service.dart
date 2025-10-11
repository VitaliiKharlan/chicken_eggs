import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/egg_item.dart';

class ShopService {
  static const String _coinsKey = 'player_coins';
  static const String _selectedEggKey = 'selected_egg_id';
  static const String _unlockedEggsKey = 'unlocked_eggs';


  static final List<EggItem> _availableEggs = [
    EggItem(
      id: 'egg_1',
      name: 'Classic egg',
      imagePath: 'assets/images/egg_1.png',
      price: 0,
      isUnlocked: true,
      isSelected: true,
      rarity: 1,
    ),
    EggItem(
      id: 'egg_2',
      name: 'Gold egg',
      imagePath: 'assets/images/egg_2.png',
      price: 100,
      isUnlocked: false,
      isSelected: false,
      rarity: 2,
    ),
    EggItem(
      id: 'egg_3',
      name: 'Silver egg',
      imagePath: 'assets/images/egg_3.png',
      price: 150,
      isUnlocked: false,
      isSelected: false,
      rarity: 2,
    ),
    EggItem(
      id: 'egg_4',
      name: 'Bronze egg',
      imagePath: 'assets/images/egg_4.png',
      price: 200,
      isUnlocked: false,
      isSelected: false,
      rarity: 2,
    ),
    EggItem(
      id: 'egg_5',
      name: 'Rainbow egg',
      imagePath: 'assets/images/egg_5.png',
      price: 300,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
    EggItem(
      id: 'egg_6',
      name: 'Crystal egg',
      imagePath: 'assets/images/egg_6.png',
      price: 400,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
    EggItem(
      id: 'egg_7',
      name: 'Fire Egg',
      imagePath: 'assets/images/egg_7.png',
      price: 500,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
    EggItem(
      id: 'egg_8',
      name: 'Ice egg',
      imagePath: 'assets/images/egg_8.png',
      price: 600,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
    EggItem(
      id: 'egg_9',
      name: 'Electric egg',
      imagePath: 'assets/images/egg_9.png',
      price: 700,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
    EggItem(
      id: 'egg_10',
      name: 'Dark egg',
      imagePath: 'assets/images/egg_10.png',
      price: 800,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
    EggItem(
      id: 'egg_11',
      name: 'Light egg',
      imagePath: 'assets/images/egg_11.png',
      price: 900,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
    EggItem(
      id: 'egg_12',
      name: 'Legendary egg',
      imagePath: 'assets/images/egg_12.png',
      price: 1000,
      isUnlocked: false,
      isSelected: false,
      rarity: 3,
    ),
  ];


  Future<int> getCoins() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_coinsKey) ?? 1000;
  }


  Future<void> setCoins(int coins) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_coinsKey, coins);
  }


  Future<void> addCoins(int amount) async {
    final currentCoins = await getCoins();
    await setCoins(currentCoins + amount);
  }


  Future<bool> spendCoins(int amount) async {
    final currentCoins = await getCoins();
    if (currentCoins >= amount) {
      await setCoins(currentCoins - amount);
      return true;
    }
    return false;
  }


  Future<String> getSelectedEggId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_selectedEggKey) ?? 'egg_1';
  }


  Future<void> setSelectedEggId(String eggId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedEggKey, eggId);
  }


  Future<List<String>> getUnlockedEggs() async {
    final prefs = await SharedPreferences.getInstance();
    final unlockedJson = prefs.getString(_unlockedEggsKey);
    if (unlockedJson != null) {
      final List<dynamic> unlockedList = json.decode(unlockedJson);
      return unlockedList.cast<String>();
    }
    return ['egg_1'];
  }


  Future<void> unlockEgg(String eggId) async {
    final unlockedEggs = await getUnlockedEggs();
    if (!unlockedEggs.contains(eggId)) {
      unlockedEggs.add(eggId);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_unlockedEggsKey, json.encode(unlockedEggs));
    }
  }


  Future<List<EggItem>> getAllEggs() async {
    final unlockedEggs = await getUnlockedEggs();
    final selectedEggId = await getSelectedEggId();

    return _availableEggs.map((egg) {
      return egg.copyWith(
        isUnlocked: unlockedEggs.contains(egg.id),
        isSelected: egg.id == selectedEggId,
      );
    }).toList();
  }


  Future<bool> buyEgg(String eggId) async {
    final egg = _availableEggs.firstWhere((e) => e.id == eggId);
    final success = await spendCoins(egg.price);
    
    if (success) {
      await unlockEgg(eggId);
      return true;
    }
    return false;
  }


  Future<bool> selectEgg(String eggId) async {
    final unlockedEggs = await getUnlockedEggs();
    if (unlockedEggs.contains(eggId)) {
      await setSelectedEggId(eggId);
      return true;
    }
    return false;
  }
}
