class City {
  int id;
  String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
    );
  }

  toJson() => {
    'id': id,
    'name': name,
  };

}