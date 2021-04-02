class Category {
  final String electronics;
  final String jewelery;
  final String menClothing;
  final String womenClothing;

  Category(
      {this.electronics, this.jewelery, this.menClothing, this.womenClothing});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        electronics: json['electronics'] as String,
        jewelery: json['jewelery'] as String,
        menClothing: json['men clothing'] as String,
        womenClothing: json['women clothing'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'electronics': electronics,
      'jewelery': jewelery,
      'men clothing': menClothing,
      'women clothing': womenClothing
    };
  }
}

class ListCategory {
  List<Category> listcategory;
  ListCategory({this.listcategory});

  factory ListCategory.fromJson(List<dynamic> json) {
    return ListCategory(
        listcategory: json
            ?.map((e) =>
                e == null ? null : Category.fromJson(e as Map<String, dynamic>))
            ?.toList());
  }
}
