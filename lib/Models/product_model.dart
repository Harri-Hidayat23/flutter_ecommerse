part of 'model.dart';

class ProductModel {
  int? id;
  String name;
  double? price;
  String? description;
  String? tags;
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updateAt;
  List<GalleryModel> galleries = [];

  ProductModel(
      {this.id,
      required this.name,
      this.price,
      this.description,
      this.tags,
      this.category,
      this.createdAt,
      this.updateAt,
      required this.galleries});

  ProductModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updateAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'tags': tags,
      'category': category?.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'createAt': createdAt,
      'updateAt': updateAt
    };
  }
}
