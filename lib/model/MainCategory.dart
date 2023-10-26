class MainCategory {
  int id;
  String name;

  MainCategory({
    required this.id,
    required this.name,
  });

  factory MainCategory.fromJson(Map<String, dynamic> json) {
    return MainCategory(
      id: json['id'],
      name: json['name'],
    );
  }

  toJson() => {
    'id': id,
    'name': name,
  };

}