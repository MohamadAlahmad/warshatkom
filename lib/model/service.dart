class Service {
  int id;
  int parentId;
  String name;

  Service({required this.id, required this.parentId, required this.name});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      parentId: json['parent_id'],
      name: json['name'],
    );
  }

  toJson() => {
    'id': id,
    'parent_id': parentId,
    'name': name,
  };

}