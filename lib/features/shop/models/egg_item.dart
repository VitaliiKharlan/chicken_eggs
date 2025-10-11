class EggItem {
  final String id;
  final String name;
  final String imagePath;
  final int price;
  final bool isUnlocked;
  final bool isSelected;
  final int rarity;
  EggItem({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.isUnlocked,
    required this.isSelected,
    this.rarity = 1,
  });


  factory EggItem.fromJson(Map<String, dynamic> json) {
    return EggItem(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      price: json['price'] as int,
      isUnlocked: json['isUnlocked'] as bool,
      isSelected: json['isSelected'] as bool,
      rarity: json['rarity'] != null ? json['rarity'] as int : 1,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'price': price,
      'isUnlocked': isUnlocked,
      'isSelected': isSelected,
      'rarity': rarity,
    };
  }


  EggItem copyWith({
    String? id,
    String? name,
    String? imagePath,
    int? price,
    bool? isUnlocked,
    bool? isSelected,
    int? rarity,
  }) {
    return EggItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      isSelected: isSelected ?? this.isSelected,
      rarity: rarity ?? this.rarity,
    );
  }
}
