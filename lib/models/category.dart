import 'package:flutter/cupertino.dart';

class Category {
  int? categoryId;
  String? categoryTitle;
  String? categoryDesc;
  int? parent;
  Image? image;

  Category({
    this.categoryId,
    this.categoryTitle,
    this.categoryDesc,
    this.image,

  });

  Category.fromJson(Map<String,dynamic> json) {
    categoryId = json['id'];
    categoryTitle = json['title'];
    categoryDesc = json['description'];
    parent = json['parent'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }
}


class Image{
  String? url;

  Image({
    this.url,
  });

  Image.fromJson(Map<String,dynamic> json) {
    url = json['src'];
  }
}