class SubCategory {
  int id;
  String name;
  int parentId;
  int isLeave;

  SubCategory({
    required this.id,
    required this.name,
    required this.parentId,
    required this.isLeave,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      parentId: json['parent_id'],
      isLeave: json['is_leave'],
    );
  }

  toJson() => {
    'id': id,
    'name': name,
    'parent_id': parentId,
    'is_leave': isLeave,
  };

}